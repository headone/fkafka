import 'dart:ffi';
import 'dart:io';

const String ENV_LIBRDKAFKA_ROOT = 'LIBRDKAFKA_ROOT';

class Loader {

  static DynamicLibrary Function() load = _load;

  /// load library
  static DynamicLibrary _load() {

    // choose sys
    if (Platform.isWindows) {
      var libs = Directory.current.listSync().where((_) => _.path.endsWith('.dll')).toList();

      if (Platform.environment.containsKey(ENV_LIBRDKAFKA_ROOT)) {
        libs.addAll(Directory(Platform.environment[ENV_LIBRDKAFKA_ROOT]!).listSync().where((_) => _.path.endsWith('.dll')).toList());
      }

      // load
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('zstd.dll')).path);
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('zlib1.dll')).path);
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('msvcp140.dll')).path);
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('vcruntime140.dll')).path);
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('libcrypto-1_1-x64.dll')).path);
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('libcurl.dll')).path);
      DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('libssl-1_1-x64.dll')).path);
      return DynamicLibrary.open(libs.firstWhere((_) => _.path.contains('librdkafka.dll')).path);

    } else {
      return DynamicLibrary.process();
    }
  }
}
