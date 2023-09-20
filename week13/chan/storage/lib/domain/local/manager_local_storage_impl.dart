import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/model/manager_info.dart';
import '../../const/const.dart';
import '../provider/local_storage_provider.dart';
import 'manager_local_storage.dart';

final managerLocalStorageProvider = Provider<ManagerLocalStorage>((ref) => ManagerLocalStorageImpl(ref.watch(secureStorageProvider)));

class ManagerLocalStorageImpl implements ManagerLocalStorage {
  late final FlutterSecureStorage _storage;

  ManagerLocalStorageImpl(this._storage);

  @override
  Future<void> saveManagerInfo(ManagerInfo managerInfo) => _storage.write(
      key: StorageKey.managerInfo, value: jsonEncode(managerInfo.toJson()));

  @override
  Future<ManagerInfo> getManagerInfo() async {
    final String? managerInfoJson =
        await _storage.read(key: StorageKey.managerInfo);
    if (managerInfoJson == null || managerInfoJson.isEmpty) {
      throw Exception("Manager Info is null");
    }
    return ManagerInfo.fromJson(jsonDecode(managerInfoJson));
  }

  @override
  Future<void> saveManagerToken(String managerToken) => _storage.write(
      key: StorageKey.managerAccessToken, value: managerToken);

  @override
  Future<String> getManagerToken() async {
    final token = await _storage.read(key: StorageKey.managerAccessToken);
    if (token == null) {
      throw Exception("Manager Token is null");
    }
    return token;
  }
}