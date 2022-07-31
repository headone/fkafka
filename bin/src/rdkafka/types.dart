import 'dart:ffi';

import 'package:ffi/ffi.dart';

enum rd_kafka_type_t_e { RD_KAFKA_PRODUCER, RD_KAFKA_CONSUMER }

enum rd_kafka_conf_res_t_e { RD_KAFKA_CONF_UNKNOWN, RD_KAFKA_CONF_INVALID, RD_KAFKA_CONF_OK }

enum rd_kafka_resp_err_t_e {
  RD_KAFKA_RESP_ERR__BEGIN,
  RD_KAFKA_RESP_ERR__BAD_MSG,
  RD_KAFKA_RESP_ERR__BAD_COMPRESSION,
  RD_KAFKA_RESP_ERR__DESTROY,
  RD_KAFKA_RESP_ERR__FAIL,
  RD_KAFKA_RESP_ERR__TRANSPORT,
  RD_KAFKA_RESP_ERR__CRIT_SYS_RESOURCE,
  RD_KAFKA_RESP_ERR__RESOLVE,
  RD_KAFKA_RESP_ERR__MSG_TIMED_OUT,
  RD_KAFKA_RESP_ERR__PARTITION_EOF,
  RD_KAFKA_RESP_ERR__UNKNOWN_PARTITION,
  RD_KAFKA_RESP_ERR__FS,
  RD_KAFKA_RESP_ERR__UNKNOWN_TOPIC,
  RD_KAFKA_RESP_ERR__ALL_BROKERS_DOWN,
  RD_KAFKA_RESP_ERR__INVALID_ARG,
  RD_KAFKA_RESP_ERR__TIMED_OUT,
  RD_KAFKA_RESP_ERR__QUEUE_FULL,
  RD_KAFKA_RESP_ERR__ISR_INSUFF,
  RD_KAFKA_RESP_ERR__NODE_UPDATE,
  RD_KAFKA_RESP_ERR__SSL,
  RD_KAFKA_RESP_ERR__WAIT_COORD,
  RD_KAFKA_RESP_ERR__UNKNOWN_GROUP,
  RD_KAFKA_RESP_ERR__IN_PROGRESS,
  RD_KAFKA_RESP_ERR__PREV_IN_PROGRESS,
  RD_KAFKA_RESP_ERR__EXISTING_SUBSCRIPTION,
  RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS,
  RD_KAFKA_RESP_ERR__REVOKE_PARTITIONS,
  RD_KAFKA_RESP_ERR__CONFLICT,
  RD_KAFKA_RESP_ERR__STATE,
  RD_KAFKA_RESP_ERR__UNKNOWN_PROTOCOL,
  RD_KAFKA_RESP_ERR__NOT_IMPLEMENTED,
  RD_KAFKA_RESP_ERR__AUTHENTICATION,
  RD_KAFKA_RESP_ERR__NO_OFFSET,
  RD_KAFKA_RESP_ERR__OUTDATED,
  RD_KAFKA_RESP_ERR__TIMED_OUT_QUEUE,
  RD_KAFKA_RESP_ERR__UNSUPPORTED_FEATURE,
  RD_KAFKA_RESP_ERR__WAIT_CACHE,
  RD_KAFKA_RESP_ERR__INTR,
  RD_KAFKA_RESP_ERR__KEY_SERIALIZATION,
  RD_KAFKA_RESP_ERR__VALUE_SERIALIZATION,
  RD_KAFKA_RESP_ERR__KEY_DESERIALIZATION,
  RD_KAFKA_RESP_ERR__VALUE_DESERIALIZATION,
  RD_KAFKA_RESP_ERR__PARTIAL,
  RD_KAFKA_RESP_ERR__READ_ONLY,
  RD_KAFKA_RESP_ERR__NOENT,
  RD_KAFKA_RESP_ERR__UNDERFLOW,
  RD_KAFKA_RESP_ERR__INVALID_TYPE,
  RD_KAFKA_RESP_ERR__RETRY,
  RD_KAFKA_RESP_ERR__PURGE_QUEUE,
  RD_KAFKA_RESP_ERR__PURGE_INFLIGHT,
  RD_KAFKA_RESP_ERR__FATAL,
  RD_KAFKA_RESP_ERR__INCONSISTENT,
  RD_KAFKA_RESP_ERR__GAPLESS_GUARANTEE,
  RD_KAFKA_RESP_ERR__MAX_POLL_EXCEEDED,
  RD_KAFKA_RESP_ERR__UNKNOWN_BROKER,
  RD_KAFKA_RESP_ERR__NOT_CONFIGURED,
  RD_KAFKA_RESP_ERR__FENCED,
  RD_KAFKA_RESP_ERR__APPLICATION,
  RD_KAFKA_RESP_ERR__ASSIGNMENT_LOST,
  RD_KAFKA_RESP_ERR__NOOP,
  RD_KAFKA_RESP_ERR__AUTO_OFFSET_RESET,
  RD_KAFKA_RESP_ERR__END,
  RD_KAFKA_RESP_ERR_UNKNOWN,
  RD_KAFKA_RESP_ERR_NO_ERROR,
  RD_KAFKA_RESP_ERR_OFFSET_OUT_OF_RANGE,
  RD_KAFKA_RESP_ERR_INVALID_MSG,
  RD_KAFKA_RESP_ERR_UNKNOWN_TOPIC_OR_PART,
  RD_KAFKA_RESP_ERR_INVALID_MSG_SIZE,
  RD_KAFKA_RESP_ERR_LEADER_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_NOT_LEADER_FOR_PARTITION,
  RD_KAFKA_RESP_ERR_REQUEST_TIMED_OUT,
  RD_KAFKA_RESP_ERR_BROKER_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_REPLICA_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_MSG_SIZE_TOO_LARGE,
  RD_KAFKA_RESP_ERR_STALE_CTRL_EPOCH,
  RD_KAFKA_RESP_ERR_OFFSET_METADATA_TOO_LARGE,
  RD_KAFKA_RESP_ERR_NETWORK_EXCEPTION,
  RD_KAFKA_RESP_ERR_COORDINATOR_LOAD_IN_PROGRESS,
  RD_KAFKA_RESP_ERR_COORDINATOR_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_NOT_COORDINATOR,
  RD_KAFKA_RESP_ERR_TOPIC_EXCEPTION,
  RD_KAFKA_RESP_ERR_RECORD_LIST_TOO_LARGE,
  RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS,
  RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND,
  RD_KAFKA_RESP_ERR_INVALID_REQUIRED_ACKS,
  RD_KAFKA_RESP_ERR_ILLEGAL_GENERATION,
  RD_KAFKA_RESP_ERR_INCONSISTENT_GROUP_PROTOCOL,
  RD_KAFKA_RESP_ERR_INVALID_GROUP_ID,
  RD_KAFKA_RESP_ERR_UNKNOWN_MEMBER_ID,
  RD_KAFKA_RESP_ERR_INVALID_SESSION_TIMEOUT,
  RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS,
  RD_KAFKA_RESP_ERR_INVALID_COMMIT_OFFSET_SIZE,
  RD_KAFKA_RESP_ERR_TOPIC_AUTHORIZATION_FAILED,
  RD_KAFKA_RESP_ERR_GROUP_AUTHORIZATION_FAILED,
  RD_KAFKA_RESP_ERR_CLUSTER_AUTHORIZATION_FAILED,
  RD_KAFKA_RESP_ERR_INVALID_TIMESTAMP,
  RD_KAFKA_RESP_ERR_UNSUPPORTED_SASL_MECHANISM,
  RD_KAFKA_RESP_ERR_ILLEGAL_SASL_STATE,
  RD_KAFKA_RESP_ERR_UNSUPPORTED_VERSION,
  RD_KAFKA_RESP_ERR_TOPIC_ALREADY_EXISTS,
  RD_KAFKA_RESP_ERR_INVALID_PARTITIONS,
  RD_KAFKA_RESP_ERR_INVALID_REPLICATION_FACTOR,
  RD_KAFKA_RESP_ERR_INVALID_REPLICA_ASSIGNMENT,
  RD_KAFKA_RESP_ERR_INVALID_CONFIG,
  RD_KAFKA_RESP_ERR_NOT_CONTROLLER,
  RD_KAFKA_RESP_ERR_INVALID_REQUEST,
  RD_KAFKA_RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT,
  RD_KAFKA_RESP_ERR_POLICY_VIOLATION,
  RD_KAFKA_RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER,
  RD_KAFKA_RESP_ERR_DUPLICATE_SEQUENCE_NUMBER,
  RD_KAFKA_RESP_ERR_INVALID_PRODUCER_EPOCH,
  RD_KAFKA_RESP_ERR_INVALID_TXN_STATE,
  RD_KAFKA_RESP_ERR_INVALID_PRODUCER_ID_MAPPING,
  RD_KAFKA_RESP_ERR_INVALID_TRANSACTION_TIMEOUT,
  RD_KAFKA_RESP_ERR_CONCURRENT_TRANSACTIONS,
  RD_KAFKA_RESP_ERR_TRANSACTION_COORDINATOR_FENCED,
  RD_KAFKA_RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED,
  RD_KAFKA_RESP_ERR_SECURITY_DISABLED,
  RD_KAFKA_RESP_ERR_OPERATION_NOT_ATTEMPTED,
  RD_KAFKA_RESP_ERR_KAFKA_STORAGE_ERROR,
  RD_KAFKA_RESP_ERR_LOG_DIR_NOT_FOUND,
  RD_KAFKA_RESP_ERR_SASL_AUTHENTICATION_FAILED,
  RD_KAFKA_RESP_ERR_UNKNOWN_PRODUCER_ID,
  RD_KAFKA_RESP_ERR_REASSIGNMENT_IN_PROGRESS,
  RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTH_DISABLED,
  RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_NOT_FOUND,
  RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_OWNER_MISMATCH,
  RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_REQUEST_NOT_ALLOWED,
  RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTHORIZATION_FAILED,
  RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_EXPIRED,
  RD_KAFKA_RESP_ERR_INVALID_PRINCIPAL_TYPE,
  RD_KAFKA_RESP_ERR_NON_EMPTY_GROUP,
  RD_KAFKA_RESP_ERR_GROUP_ID_NOT_FOUND,
  RD_KAFKA_RESP_ERR_FETCH_SESSION_ID_NOT_FOUND,
  RD_KAFKA_RESP_ERR_INVALID_FETCH_SESSION_EPOCH,
  RD_KAFKA_RESP_ERR_LISTENER_NOT_FOUND,
  RD_KAFKA_RESP_ERR_TOPIC_DELETION_DISABLED,
  RD_KAFKA_RESP_ERR_FENCED_LEADER_EPOCH,
  RD_KAFKA_RESP_ERR_UNKNOWN_LEADER_EPOCH,
  RD_KAFKA_RESP_ERR_UNSUPPORTED_COMPRESSION_TYPE,
  RD_KAFKA_RESP_ERR_STALE_BROKER_EPOCH,
  RD_KAFKA_RESP_ERR_OFFSET_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_MEMBER_ID_REQUIRED,
  RD_KAFKA_RESP_ERR_PREFERRED_LEADER_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_GROUP_MAX_SIZE_REACHED,
  RD_KAFKA_RESP_ERR_FENCED_INSTANCE_ID,
  RD_KAFKA_RESP_ERR_ELIGIBLE_LEADERS_NOT_AVAILABLE,
  RD_KAFKA_RESP_ERR_ELECTION_NOT_NEEDED,
  RD_KAFKA_RESP_ERR_NO_REASSIGNMENT_IN_PROGRESS,
  RD_KAFKA_RESP_ERR_GROUP_SUBSCRIBED_TO_TOPIC,
  RD_KAFKA_RESP_ERR_INVALID_RECORD,
  RD_KAFKA_RESP_ERR_UNSTABLE_OFFSET_COMMIT,
  RD_KAFKA_RESP_ERR_THROTTLING_QUOTA_EXCEEDED,
  RD_KAFKA_RESP_ERR_PRODUCER_FENCED,
  RD_KAFKA_RESP_ERR_RESOURCE_NOT_FOUND,
  RD_KAFKA_RESP_ERR_DUPLICATE_RESOURCE,
  RD_KAFKA_RESP_ERR_UNACCEPTABLE_CREDENTIAL,
  RD_KAFKA_RESP_ERR_INCONSISTENT_VOTER_SET,
  RD_KAFKA_RESP_ERR_INVALID_UPDATE_VERSION,
  RD_KAFKA_RESP_ERR_FEATURE_UPDATE_FAILED,
  RD_KAFKA_RESP_ERR_PRINCIPAL_DESERIALIZATION_FAILURE
}

class rd_kafka_t extends Opaque {}

class rd_kafka_conf_t extends Opaque {}

class rd_kafka_topic_t extends Opaque {}

class rd_kafka_topic_conf_t extends Opaque {}

class rd_kafka_metadata_t extends Struct {

  @Int32()
  external int broker_cnt;
  external Pointer<rd_kafka_metadata_broker> brokers;
  @Int32()
  external int topic_cnt;
  external Pointer<rd_kafka_metadata_topic> topics;
  @IntPtr()
  external int orig_broker_id;
  external Pointer<Utf8> orig_broker_name;
}

class rd_kafka_metadata_broker extends Struct {

  @Int32()
  external int id;
  external Pointer<Utf8> host;
  @Int32()
  external int port;
}

class rd_kafka_metadata_topic extends Struct {

  external Pointer<Utf8> topic;
  @Int32()
  external int partition_cnt;
  external Pointer<rd_kafka_metadata_partition>	partitions;
  /// index of [rd_kafka_resp_err_t_e]
  @Int32()
  external int err;
}

class rd_kafka_metadata_partition extends Struct {

  @IntPtr()
  external int id;
  /// index of [rd_kafka_resp_err_t_e]
  @Int32()
  external int err;
  @IntPtr()
  external int leader;
  @IntPtr()
  external int replica_cnt;
  @IntPtr()
  external int replicas;
  @IntPtr()
  external int isr_cnt;
  @IntPtr()
  external int isrs;
}


