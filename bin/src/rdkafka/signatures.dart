import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'types.dart';

/// see https://docs.confluent.io/platform/current/clients/librdkafka/html/index.html

typedef rd_kafka_version_native_t = Int32 Function();
final String rd_kafka_version_symbol = 'rd_kafka_version';

typedef rd_kafka_version_str_native_t = Pointer<Utf8> Function();
final String rd_kafka_version_str_symbol = 'rd_kafka_version_str';

/// [type] is index of [rd_kafka_type_t_e]
/// [conf] create with [rd_kafka_conf_new]
///
/// return nullable
typedef rd_kafka_new_native_t = Pointer<rd_kafka_t> Function(Int32 type, Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> errstr, Pointer<Int32> errstr_size);
final String rd_kafka_new_symbol = 'rd_kafka_new';

typedef rd_kafka_conf_new_native_t = Pointer<rd_kafka_conf_t> Function();
final String rd_kafka_conf_new_symbol = 'rd_kafka_conf_new';

/// return index of [rd_kafka_conf_res_t_e]
typedef rd_kafka_conf_set_native_t = Int32 Function(Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size);
final String rd_kafka_conf_set_symbol = 'rd_kafka_conf_set';

typedef rd_kafka_topic_new_native_t = Pointer<rd_kafka_topic_t> Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, Pointer<rd_kafka_topic_conf_t> conf);
final String rd_kafka_topic_new_symbol = 'rd_kafka_topic_new';

typedef rd_kafka_topic_conf_new_native_t = Pointer<rd_kafka_topic_conf_t> Function();
final String rd_kafka_topic_conf_new_symbol = 'rd_kafka_topic_conf_new';

/// return index of [rd_kafka_conf_res_t_e]
typedef rd_kafka_topic_conf_set_native_t = Int32 Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size);
final String rd_kafka_topic_conf_set_symbol = 'rd_kafka_topic_conf_set';

/// [all_topics] if non-zero: request info about all topics in cluster, if zero: only request info about locally known topics.
/// [only_rkt] only request info about this topic
///
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_metadata_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Int32 all_topics, Pointer<rd_kafka_topic_t> only_rkt, Pointer<Pointer<rd_kafka_metadata_t>> metadatap, Int32 timeout_ms);
final String rd_kafka_metadata_symbol = 'rd_kafka_metadata';

typedef rd_kafka_topic_destroy_native_t = Void Function(Pointer<rd_kafka_topic_t> rkt);
final String rd_kafka_topic_destroy_symbol = 'rd_kafka_topic_destroy';

typedef rd_kafka_topic_name_native_t = Pointer<Utf8> Function(Pointer<rd_kafka_topic_t> rkt);
final String rd_kafka_topic_name_symbol = 'rd_kafka_topic_name';

typedef rd_kafka_destroy_native_t = Void Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_destroy_symbol = 'rd_kafka_destroy';

/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_get_watermark_offsets_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, Int32 partition, Pointer<Int64> low, Pointer<Int64> high);
final String rd_kafka_get_watermark_offsets_symbol = 'rd_kafka_get_watermark_offsets';

/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_query_watermark_offsets_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, Int32 partition, Pointer<Int64> low, Pointer<Int64> high, Int32 timeout_ms);
final String rd_kafka_query_watermark_offsets_symbol = 'rd_kafka_query_watermark_offsets';

/// [err] index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_err2str_native_t = Pointer<Utf8> Function(Int32 err);
final String rd_kafka_err2str_symbol = 'rd_kafka_err2str';

/// [err] index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_err2name_native_t = Pointer<Utf8> Function(Int32 err);
final String rd_kafka_err2name_symbol = 'rd_kafka_err2name';

/// [group] is an optional group name to describe, otherwise (NULL) all groups are returned.
typedef rd_kafka_list_groups_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> group, Pointer<Pointer<rd_kafka_group_list>> grplistp, Int32 timeout_ms);
final String rd_kafka_list_groups_symbol = 'rd_kafka_list_groups';

typedef rd_kafka_group_list_destroy_native_t = Void Function(Pointer<rd_kafka_group_list> grplist);
final String rd_kafka_group_list_destroy_symbol = 'rd_kafka_group_list_destroy';

typedef rd_kafka_topic_partition_list_new_native_t = Pointer<rd_kafka_topic_partition_list_t> Function(Int32 size);
final String rd_kafka_topic_partition_list_new_symbol = 'rd_kafka_topic_partition_list_new';

typedef rd_kafka_topic_partition_list_destroy_native_t = Void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist);
final String rd_kafka_topic_partition_list_destroy_symbol = 'rd_kafka_topic_partition_list_destroy';

typedef rd_kafka_topic_partition_list_add_native_t = Pointer<rd_kafka_topic_partition_t> Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, Int32 partition);
final String rd_kafka_topic_partition_list_add_symbol = 'rd_kafka_topic_partition_list_add';

typedef rd_kafka_topic_partition_list_add_range_native_t = Void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, Int32 start, Int32 end);
final String rd_kafka_topic_partition_list_add_range_symbol = 'rd_kafka_topic_partition_list_add_range';
