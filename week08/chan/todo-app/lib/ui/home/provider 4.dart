import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/todo_service.dart';
import 'home_view_model.dart';

/// Provider는 Flutter에서 상태 관리를 담당하는 패키지입니다.
/// 이 패키지는 데이터 흐름을 관리하고, 의존성 주입을 제공하여 전체 앱에서 액세스할 수 있는 공유 상태를 생성합니다.
/// 아래의 Provider 객체는 Dio와 TodoServiceImplementation를 제공합니다.
/// 다른 객체가 이들을 요청할 때(ref.read()나 ref.watch()를 사용해서), Provider는 이들의 인스턴스를 제공합니다.
final dioProvider = Provider((ref) => Dio());
final todoServiceProvider = Provider((ref) => TodoServiceImplementation(dio: ref.read(dioProvider)));
final todoViewModelProvider = ChangeNotifierProvider((ref) {
  final todoService = ref.watch(todoServiceProvider);
  return TodoViewModel(todoService);
});