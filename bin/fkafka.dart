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

  /// release native handle
  release();
}

/// kafka producer client
class FkafkaProducerClient extends FkafkaClient {

  FkafkaProducerClient(FkafkaConf conf) : super(rd_kafka_type_t_e.RD_KAFKA_PRODUCER, conf);

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

    return FkafkaTopic(topicPtr: topicPtr)
      ..release();
  }

  /// find topics
  ///
  /// [onlyLocalTopic] TODO find only specified topics
  List<FkafkaTopic> findTopics({List<String> topics = const []}) {
    Pointer<Pointer<rd_kafka_metadata_t>> rd_kafka_metadata = calloc();
    // find
    _bridges.rd_kafka_metadata(
        _kafkaPtr,
        topics.isEmpty ? 1 : 0,
        nullptr,
        rd_kafka_metadata,
        defaultTimeoutMs
    );

    final result = <FkafkaTopic>[];
    // traverse the topic name
    for (int i = 0; i < rd_kafka_metadata.value.ref.topic_cnt; i++) {
      var topic = rd_kafka_metadata.value.ref.topics[i];
      result.add(FkafkaTopic(name: topic.topic.toDartString()));
    }

    // release
    calloc.free(rd_kafka_metadata);

    return result;
  }

  @override
  release() {
    _bridges.rd_kafka_destroy(_kafkaPtr);
  }
}

/// kafka consumer client
class FkafkaConsumerClient extends FkafkaClient {

  FkafkaConsumerClient(FkafkaConf conf) : super(rd_kafka_type_t_e.RD_KAFKA_CONSUMER, conf);

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

  final Pointer<rd_kafka_topic_t>? topicPtr;
  String? name;

  FkafkaTopic({this.topicPtr, this.name}) {
    if (topicPtr != null) {
      final _name = _bridges.rd_kafka_topic_name(topicPtr!)
          .toDartString();
      if (name != null) {
        assert(_name == name, 'rd_kafka_topic_t_name not equal to name');
      }
      name = _name;
    }
  }

  /// release native handle
  void release() {
    if (topicPtr != null) {
      _bridges.rd_kafka_topic_destroy(topicPtr!);
    }
  }
}
