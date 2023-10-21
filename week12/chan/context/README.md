# BuildContext

A handle to the location of a widget in the widget tree

Widget Tree에서 현재 widget의 위치를 알 수 있는 정보

# Widget의 라이프사이클

- Create: build()
- Update: setState() -> build()
- Destroy: dispose()

# Widget은 불변이다.
- Widget자체는 StatelessWidget, StatefulWidget 둘 다 불변
- 다만, StatefulWidget은 State를 가지고 있고, State는 변경 가능

# Widget 동작 원리
1. 위젯 트리 생성
```agsl
MaterialApp → Scaffold → MyWidget
```
2. Element 트리 생성
```agsl
Element
  ↘ Widget
```
3. build 함수 호출
```
Element → build() → Widget
```
4. RenderObject 트리 생성
```
RenderObjectWidget → RenderObjectElement → RenderObject
```
5. 화면 렌더링
```
RenderObject → Screen
```
6. 상태 변경과 재빌드
```
setState() → Element.update → build() → RenderObject.update
```

# Element class
```dart
abstract class Element extends DiagnosticableTree implements BuildContext {
  Element(Widget widget)
    : _widget = widget {
    if (kFlutterMemoryAllocationsEnabled) {
      MemoryAllocations.instance.dispatchObjectCreated(
        library: _flutterWidgetsLibrary,
        className: '$Element',
        object: this,
      );
    }
  }
  
  Element? _parent;
  
  @override
  Widget get widget => _widget!;
  Widget? _widget;  
  
  /// Subclasses should override this function to actually call the appropriate
  /// `build` function (e.g., [StatelessWidget.build] or [State.build]) for
  /// their widget.
  @protected
  Widget build();
}
```