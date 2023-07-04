
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/di/module.dart';
import 'package:todo_app/ui/home/home_screen.dart';

import '../repository/fake_http_todo_repository.dart';

void main() {
  testWidgets('HomeScreen renders a list of todos', (WidgetTester tester) async {
    // 프로바이더 재정의
    final container = ProviderContainer(overrides: [
      todoRepositoryProvider.overrideWithValue(FakeHttpTodoRepository()),
    ]);

    // `createWidget`를 이용하여 위젯을 테스트 환경에 그립니다.
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    // 로딩 중이므로, CircularProgressIndicator가 그려져야 합니다.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // 데이터 로드가 끝날 때까지 기다립니다.
    await tester.pumpAndSettle();

    // 화면에 그려진 ListTile의 갯수를 체크합니다.
    final listItemCount = tester.widgetList(find.byType(ListTile)).length;
    expect(listItemCount, FakeHttpTodoRepository.fakeTodos.length);

    // Clean up
    container.dispose();
  });
}
