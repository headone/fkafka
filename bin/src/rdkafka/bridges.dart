import 'dart:ffi';
import 'package:ffi/ffi.dart';

import '../loader.dart';
import 'signatures.dart';
import 'types.dart';

class RdkafkaBridges {

  final DynamicLibrary _lib;

  RdkafkaBridges(this._lib);

  factory RdkafkaBridges.defaultLib() => RdkafkaBridges(Loader.load());

  static RdkafkaBridges get instance => _getInstance();
  static RdkafkaBridges? _instance;
  static RdkafkaBridges _getInstance() => _instance ??= RdkafkaBridges.defaultLib();

  // bind method

  late int Function() rd_kafka_version = _lib.lookup<NativeFunction<rd_kafka_version_native_t>>(rd_kafka_version_symbol).asFunction();

  late rd_kafka_version_str_native_t rd_kafka_version_str = _lib.lookup<NativeFunction<rd_kafka_version_str_native_t>>(rd_kafka_version_str_symbol).asFunction();

  late Pointer<rd_kafka_t> Function(int type, Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> errstr, Pointer<Int32> errstr_size) rd_kafka_new = _lib.lookup<NativeFunction<rd_kafka_new_native_t>>(rd_kafka_new_symbol).asFunction();

  late rd_kafka_conf_new_native_t rd_kafka_conf_new = _lib.lookup<NativeFunction<rd_kafka_conf_new_native_t>>(rd_kafka_conf_new_symbol).asFunction();

  late int Function(Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size) rd_kafka_conf_set = _lib.lookup<NativeFunction<rd_kafka_conf_set_native_t>>(rd_kafka_conf_set_symbol).asFunction();

  late rd_kafka_topic_new_native_t rd_kafka_topic_new = _lib.lookup<NativeFunction<rd_kafka_topic_new_native_t>>(rd_kafka_topic_new_symbol).asFunction();

  late rd_kafka_topic_conf_new_native_t rd_kafka_topic_conf_new = _lib.lookup<NativeFunction<rd_kafka_topic_conf_new_native_t>>(rd_kafka_topic_conf_new_symbol).asFunction();

  late int Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size) rd_kafka_topic_conf_set = _lib.lookup<NativeFunction<rd_kafka_topic_conf_set_native_t>>(rd_kafka_topic_conf_set_symbol).asFunction();

  late int Function(Pointer<rd_kafka_t> rk, int all_topics, Pointer<rd_kafka_topic_t> only_rkt, Pointer<Pointer<rd_kafka_metadata_t>> metadatap, int timeout_ms) rd_kafka_metadata = _lib.lookup<NativeFunction<rd_kafka_metadata_native_t>>(rd_kafka_metadata_symbol).asFunction();

  late void Function(Pointer<rd_kafka_topic_t> rkt) rd_kafka_topic_destroy = _lib.lookup<NativeFunction<rd_kafka_topic_destroy_native_t>>(rd_kafka_topic_destroy_symbol).asFunction();

  late rd_kafka_topic_name_native_t rd_kafka_topic_name = _lib.lookup<NativeFunction<rd_kafka_topic_name_native_t>>(rd_kafka_topic_name_symbol).asFunction();

  late void Function(Pointer<rd_kafka_t> rk) rd_kafka_destroy = _lib.lookup<NativeFunction<rd_kafka_destroy_native_t>>(rd_kafka_destroy_symbol).asFunction();

  late int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, int partition, Pointer<Int64> low, Pointer<Int64> high) rd_kafka_get_watermark_offsets = _lib.lookup<NativeFunction<rd_kafka_get_watermark_offsets_native_t>>(rd_kafka_get_watermark_offsets_symbol).asFunction();

  late int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, int partition, Pointer<Int64> low, Pointer<Int64> high, int timeout_ms) rd_kafka_query_watermark_offsets = _lib.lookup<NativeFunction<rd_kafka_query_watermark_offsets_native_t>>(rd_kafka_query_watermark_offsets_symbol).asFunction();

  late Pointer<Utf8> Function(int err) rd_kafka_err2str = _lib.lookup<NativeFunction<rd_kafka_err2str_native_t>>(rd_kafka_err2str_symbol).asFunction();

  late Pointer<Utf8> Function(int err) rd_kafka_err2name = _lib.lookup<NativeFunction<rd_kafka_err2name_native_t>>(rd_kafka_err2name_symbol).asFunction();

  late int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> group, Pointer<Pointer<rd_kafka_group_list>> grplistp, int timeout_ms) rd_kafka_list_groups = _lib.lookup<NativeFunction<rd_kafka_list_groups_native_t>>(rd_kafka_list_groups_symbol).asFunction();

  late void Function(Pointer<rd_kafka_group_list>) rd_kafka_group_list_destroy = _lib.lookup<NativeFunction<rd_kafka_group_list_destroy_native_t>>(rd_kafka_group_list_destroy_symbol).asFunction();

  late Pointer<rd_kafka_topic_partition_list_t> Function(int size) rd_kafka_topic_partition_list_new = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_new_native_t>>(rd_kafka_topic_partition_list_new_symbol).asFunction();

  late void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist) rd_kafka_topic_partition_list_destroy = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_destroy_native_t>>(rd_kafka_topic_partition_list_destroy_symbol).asFunction();
}
