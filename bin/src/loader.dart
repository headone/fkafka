import 'dart:ffi';
import 'dart:io';
import 'package:path/path.dart' as path;

class Loader {

  /// load library
  static DynamicLibrary load() {
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'zstd.dll'));
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'zlib1.dll'));
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'libcrypto-1_1-x64.dll'));
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'libcurl.dll'));
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'libssl-1_1-x64.dll'));
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'msvcp140.dll'));
    DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'vcruntime140.dll'));
    return DynamicLibrary.open(path.join(Directory.current.path, 'lib', 'librdkafka', 'win-x64', 'native', 'librdkafka.dll'));
  }
}
