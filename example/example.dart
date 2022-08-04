import 'package:fkafka_ffi/fkafka_ffi.dart';

main() {
  // instantiate the client
  var client = FkafkaAdminClient(
      conf: FkafkaConf({
        'bootstrap.servers': '127.0.0.1:9092'
      })
  );

  // use its method like create topic
  client.newTopic('topic');

  // release when no longer in use
  client.release();
}