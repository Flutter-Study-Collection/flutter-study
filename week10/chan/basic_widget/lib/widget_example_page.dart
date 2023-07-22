import 'package:flutter/material.dart';

class WidgetExamplePage extends StatelessWidget {
  final String widget;

  WidgetExamplePage(this.widget);

  @override
  Widget build(BuildContext context) {
    Widget example;
    String explanation = '';
    switch (widget) {
      case 'Container':
        example = Container(
          color: Colors.red,
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: const Text('Container'),
        );
        explanation = 'Container는 사각형을 나타내는 위젯이며, 일반적으로 다른 위젯을 포함하거나 스타일을 적용하는데 사용됩니다.';
        break;
      case 'Scaffold':
        example = Scaffold(
          appBar: AppBar(title: const Text('Scaffold')),
          body: const Center(child: Text('Scaffold')),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        );
        explanation = 'Scaffold는 머티리얼 디자인의 기본 레이아웃 구조를 제공하는 위젯입니다. AppBar, Drawer, Snackbar 등의 주요 구성 요소를 포함할 수 있습니다.';
        break;
      case 'Column and Row':
        example = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Column 1'),
            Text('Column 2'),
            Text('Column 3'),
          ],
        );
        explanation = 'Column과 Row는 각각 수직 및 수평 방향으로 자식 위젯을 배열하는 레이아웃 위젯입니다.';
        break;
      case 'Stack':
        example = Stack(
          children: <Widget>[
            Container(color: Colors.yellow, height: 300.0, width: 300.0),
            Container(color: Colors.green, height: 200.0, width: 200.0),
            Container(color: Colors.red, height: 100.0, width: 100.0),
          ],
        );
        explanation = 'Stack은 자식 위젯을 겹쳐서 배열하는 레이아웃 위젯입니다.';
        break;
      case 'SingleChildScrollView':
        example = SingleChildScrollView(
          child: Container(
            height: 1000.0,
            color: Colors.purple,
          ),
        );
        explanation = 'SingleChildScrollView는 자식 위젯이 화면보다 클 경우 스크롤 기능을 제공하는 위젯입니다.';
        break;
      case 'ListView and ListTile':
        example = ListView(
          children: const <Widget>[
            ListTile(leading: Icon(Icons.map), title: Text('Map')),
            ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
            ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
          ],
        );
        explanation = 'ListView는 스크롤 가능한 리스트를 구현하는 위젯이며, ListTile은 고정 높이의 행을 대표하는 위젯입니다.';
        break;
      case 'GridView':
        example = GridView.count(
          crossAxisCount: 2,
          children: List.generate(8, (index) => Center(child: Text('Item $index'))),
        );
        explanation = 'GridView는 2차원 스크롤 가능한 그리드 리스트를 구현하는 위젯입니다.';
        break;
      case 'Center':
        example = const Center(child: Text('Center'));
        explanation = 'Center는 자식 위젯을 부모 위젯의 중앙에 배치하는 위젯입니다.';
        break;
      case 'Align':
        example = const Align(
          alignment: Alignment.bottomRight,
          child: Text('Align'),
        );
        explanation = 'Align은 자식 위젯을 부모 위젯 내에서 특정 위치에 배치하는 위젯입니다.';
        break;
      case 'Padding':
        example = const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Padding'),
        );
        explanation = 'Padding은 자식 위젯 주위에 여백을 만드는 위젯입니다.';
        break;
      case 'Margin':
        example = Container(
          color: Colors.red,
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(4.0),
          child: const Text('Margin'),
        );
        explanation = 'Margin은 Container 위젯의 주위에 공간을 만듭니다. 이 예제에서는 Container의 margin 속성을 사용하여 구현합니다.';
        break;
      case 'Expanded':
        example = Row(
          children: <Widget>[
            const Text('Unexpanded'),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: const Text('Expanded'),
              ),
            ),
          ],
        );
        explanation = 'Expanded는 자식 위젯이 남은 공간을 채우도록 하는 레이아웃 위젯입니다.';
        break;
      case 'Card':
        example = Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {
                      print("BUY TICKETS clicked!");
                    },
                  ),
                  TextButton(
                    child: const Text('LISTEN'),
                    onPressed: () {
                      print("LISTEN clicked!");
                    },
                  ),
                ],
              ),
            ],
          ),
        );
        explanation = 'Card는 정보를 하나의 카드 형태로 그룹화하거나 분리하는 데 사용되는 머티리얼 디자인의 카드를 구현한 위젯입니다.';
        break;
      case 'ElevatedButton':
        example = ElevatedButton(
          child: const Text('ElevatedButton'),
          onPressed: () {},
        );
        explanation = 'RaisedButton은 머티리얼 디자인의 입체적인 버튼을 구현하는 위젯입니다.';
        break;
      case 'TextButton':
        example = TextButton(
          child: const Text('TextButton'),
          onPressed: () {},
        );
        explanation = 'FlatButton은 머티리얼 디자인의 평면 버튼을 구현하는 위젯입니다.';
        break;
      case 'IconButton':
        example = IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {},
        );
        explanation = 'IconButton은 아이콘을 표시하는 버튼을 구현하는 위젯입니다.';
        break;
      case 'FloatingActionButton':
        example = FloatingActionButton(
          child: const Icon(Icons.navigation),
          onPressed: () {},
        );
        explanation = 'FloatingActionButton은 머티리얼 디자인의 원형 플로팅 액션 버튼을 구현하는 위젯입니다.';
        break;
      case 'Image':
        example = Image.network('https://example.com/image.jpg');
        explanation = 'Image는 네트워크, 파일, 메모리 및 애셋에서 이미지를 표시하는 위젯입니다.';
        break;
      case 'Icon':
        example = const Icon(Icons.directions_bike);
        explanation = 'Icon은 머티리얼 아이콘 또는 이미지 아이콘을 표시하는 위젯입니다.';
        break;
      case 'CircleAvatar':
        example = const CircleAvatar(
          backgroundImage: NetworkImage('https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2023/01/21/56fbf185-1419-49f7-844b-68be7b58e9cc.jpg'),
          radius: 50,
        );
        explanation = 'CircleAvatar는 원형 아바타 이미지를 표시하는 위젯입니다.';
        break;
      case 'ProgressIndicator':
        example = const CircularProgressIndicator();
        explanation = 'ProgressIndicator는 머티리얼 디자인의 진행 상태 표시기를 구현하는 위젯입니다.';
        break;
      case 'PageView':
        example = PageView(
          children: const <Widget>[
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
          ],
        );
        explanation = 'PageView는 수평으로 스크롤되는 페이지 뷰를 생성하는 위젯입니다.';
        break;
      case 'BottomNavigationBar':
        example = Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
            ],
          ),
        );
        explanation = 'BottomNavigationBar는 머티리얼 디자인의 하단 탐색 바를 구현하는 위젯입니다.';
        break;
      case 'AppBar':
        example = Scaffold(
          appBar: AppBar(title: const Text('AppBar')),
        );
        explanation = 'AppBar는 머티리얼 디자인의 앱바를 구현하는 위젯입니다.';
        break;
      default:
        example = const Text('No example available');
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Example of $widget'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(child: example),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              explanation,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
