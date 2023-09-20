import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'file_storage.dart';

class FileStorageImpl extends FileStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Future<String> readJsonFile(String fileName) async {
    try {
      final path = await _localPath;
      final file = File('$path/$fileName.json');
      return await file.readAsString();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> writeJsonFile(String fileName, String content) async {
    try {
      final path = await _localPath;
      final file = File('$path/$fileName.json');
      await file.writeAsString(content);
      return content;
    } catch (e) {
      rethrow;
    }
  }
}