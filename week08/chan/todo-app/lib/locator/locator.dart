import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../service/todo_service.dart';

GetIt locator = GetIt.instance;

/// registerFactory: 새로운 instance를 생성
/// registerSingleton: 한번 생성된 instance를 계속 사용
/// registerLazySingleton: 처음 사용될 때 생성
initLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ToDoService>(() => TodoServiceImplementation(dio: locator<Dio>()));
}