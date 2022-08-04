# fkafka - Dart wrapper of the librdkafka

## Overview

Use [librdkafka](https://github.com/edenhill/librdkafka) via Dart FFI, wraps admin and producer and consumer clients.

## Features

### 1. Admin Client

- create topic
- query topics
- query groups
- query topic offsets
- query group committed offsets

### 2. Producer Client

(coming soon)

### 3. Consumer Client

(coming soon)

## Usage

1. ready *librdkafka*

   - if **windows**, can download *dll* file form [this](https://github.com/headone/fkafka/tree/master/lib/librdkafka), and then put the file in current dir or set env `LIBRDKAFKA_ROOT` the value is dll file dir.

1. in your code

   1. instantiate the client

   ```dart
   var client = FkafkaAdminClient(
     conf: FkafkaConf({
       'bootstrap.servers': '127.0.0.1:9092'
     })
   );
   ```

   2. use its method like create topic

   ```dart
   client.newTopic('first-topic');
   ```

   3. release when no longer in use

   ```dart
   client.release();
   ```


## License

[MIT License](https://github.com/headone/fkafka/blob/master/LICENSE)
