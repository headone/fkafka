import 'dart:collection';
import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'src/rdkafka/bridges.dart';
import 'src/rdkafka/types.dart';

/// default timeout (ms) of connect to kafka
const int defaultTimeoutMs = 30000;
final RdkafkaBridges _bridges = RdkafkaBridges.instance;

abstract class FkafkaClient {

  final FkafkaConf _conf;
  late Pointer<rd_kafka_t> _kafkaPtr;
  final rd_kafka_type_t_e type;

  Map<String, String> get conf => _conf.conf;

  FkafkaClient(this.type, this._conf) {
    _init();
  }

  void _init() {
    _kafkaPtr = _bridges.rd_kafka_new.call(
        type.index,
        _conf._confPtr,
        nullptr,
        nullptr
    );
  }

  /// librdkafka version
  String get libVersion => _bridges.rd_kafka_version_str().toDartString();

  /// release native handle
  release();
}

/// kafka producer client
class FkafkaProducerClient extends FkafkaClient {

  FkafkaProducerClient({required FkafkaConf conf}) : super(rd_kafka_type_t_e.RD_KAFKA_PRODUCER, conf);

  /// create topic
  ///
  /// TODO customize topic conf
  FkafkaTopic newTopic(String topic) {
    assert(topic.isNotEmpty);
    var topicPtr = _bridges.rd_kafka_topic_new.call(
      _kafkaPtr,
      topic.toNativeUtf8(),
      nullptr
    );

    var result =  FkafkaTopic.ptr(topicPtr);
    _bridges.rd_kafka_topic_destroy(topicPtr);
    return result;
  }

  /// find topics
  ///
  /// [topics] specified topics, query all topics if null
  List<FkafkaTopic> findTopics({List<String> topics = const []}) {
    Pointer<Pointer<rd_kafka_metadata_t>> rd_kafka_metadata = calloc();
    // find
    _bridges.rd_kafka_metadata(
        _kafkaPtr,
        // always query all topics
        1,
        nullptr,
        rd_kafka_metadata,
        defaultTimeoutMs
    );

    // traverse the topic
    final result = rd_kafka_metadata.value.ref.topicList
        .map((_) => FkafkaTopic.metadata(_))
        .toList();

    // filter
    if (topics.isNotEmpty) {
      result.removeWhere((_) => !topics.contains(_.name));
    }

    // release
    calloc.free(rd_kafka_metadata);

    return result;
  }

  /// fill FkafkaPartition low and high offsets
  void fillOffsets(FkafkaTopic topic) {
    assert(topic.partitions != null && topic.partitions!.isNotEmpty);

    for (FkafkaPartition partition in topic.partitions!) {
      Pointer<Int64> low = malloc.allocate(sizeOf<Int64>());
      Pointer<Int64> high = malloc.allocate(sizeOf<Int64>());
      _bridges.rd_kafka_query_watermark_offsets(
          _kafkaPtr,
          topic.name.toNativeUtf8(),
          partition.id,
          low,
          high,
          defaultTimeoutMs
      );

      // set result
      partition.low = low.value;
      partition.high = high.value;

      // release
      malloc.free(low);
      malloc.free(high);
    }
  }

  @override
  release() {
    _bridges.rd_kafka_destroy(_kafkaPtr);
  }
}

/// kafka consumer client
class FkafkaConsumerClient extends FkafkaClient {

  FkafkaConsumerClient({required FkafkaConf conf}) : super(rd_kafka_type_t_e.RD_KAFKA_CONSUMER, conf);

  /// find group
  ///
  /// [group] specified group, query all topics if null
  List<FkafkaGroup> findGroups({String? group}) {

    Pointer<Pointer<rd_kafka_group_list>> grplistp = calloc();

    _bridges.rd_kafka_list_groups(
        _kafkaPtr,
        group == null ? nullptr : group.toNativeUtf8(),
        grplistp,
        defaultTimeoutMs
    );

    var result = grplistp.value.ref.groupList.map((_) => FkafkaGroup.metadata(_)).toList();

    // release
    calloc.free(grplistp);

    return result;
  }

  @override
  release() {
    _bridges.rd_kafka_destroy(_kafkaPtr);
  }
}

/// kafka admin client
class FkafkaAdminClient {
  // TODO
}

class FkafkaConf {

  late Pointer<rd_kafka_conf_t> _confPtr;
  late Map<String, String> _conf;

  Map<String, String> get conf => _conf;

  FkafkaConf(Map<String, String> conf) {
    _conf = UnmodifiableMapView(conf);
    _confPtr = _bridges.rd_kafka_conf_new();

    // set kafka native conf
    _conf.forEach((key, value) {
      _bridges.rd_kafka_conf_set(
          _confPtr,
          key.toNativeUtf8(),
          value.toNativeUtf8(),
          nullptr,
          nullptr
      );
    });
  }
}

class FkafkaTopic {
  const FkafkaTopic({
    required this.name,
    this.partitionCount,
    this.partitions
  });

  final String name;
  final int? partitionCount;
  final List<FkafkaPartition>? partitions;

  factory FkafkaTopic.ptr(Pointer<rd_kafka_topic_t> topicPtr) => FkafkaTopic(
        name: _bridges.rd_kafka_topic_name(topicPtr).toDartString()
    );

  factory FkafkaTopic.metadata(rd_kafka_metadata_topic topicMetadata) => FkafkaTopic(
      name: topicMetadata.topic.toDartString(),
      partitionCount: topicMetadata.partition_cnt,
      partitions: topicMetadata.partitionList.map((_) => FkafkaPartition(id: _.id)).toList()
  );
}

class FkafkaPartition {
  FkafkaPartition({
    required this.id
  });

  final int id;
  // low offset
  int? low;
  // high offset
  int? high;
}

class FkafkaGroup {
  FkafkaGroup({
    required this.name,
    this.state,
    this.protocolType,
    this.protocol
  });

  final String name;
  String? state;
  String? protocolType;
  String? protocol;

  factory FkafkaGroup.metadata(rd_kafka_group_info groupMetadata) => FkafkaGroup(
      name: groupMetadata.group.toDartString(),
      state: groupMetadata.state.toDartString(),
      protocolType: groupMetadata.protocol_type.toDartString(),
      protocol: groupMetadata.protocol.toDartString()
  );

  @override
  String toString() {
    return 'FkafkaGroup{name: $name, state: $state, protocolType: $protocolType, protocol: $protocol}';
  }
}
