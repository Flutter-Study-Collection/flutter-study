import '../../common/model/manager_info.dart';

abstract class LocalStorage{
  Future<void> saveUserInfo(ManagerInfo managerInfo);
  Future<String> getUserToken();
  Future<void> saveManagerToken(String managerToken);
  Future<ManagerInfo> getManagerInfo();
}