abstract class FileStorage{
  Future<String> readJsonFile(String fileName);
  Future<String> writeJsonFile(String fileName, String content);
}