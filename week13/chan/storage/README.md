# 저장소 패키지들에 대한 플랫폼별 사용 가능 여부 비교표
| Function                              | Package Name       |        iOS        | Android (≤ 9) | Android (≥ 10) | macOS | Windows | Linux | Web | Embedded | Description                                               |
|---------------------------------------|--------------------|:-----------------:|:------------:|:--------------:|:-----:|:-------:|:-----:|:---:|:--------:|-----------------------------------------------------------|
| **asset**                             | N/A                |        ✔️         |      ✔️       |       ✔️        |   ✔️   |    ✔️    |   ✔️   | ✔️  |    ✔️    | 빌드 시 앱 파일에 포함, 변경 불가능                          |
| **getApplicationDocumentsDirectory()** | `path_provider`    |        ✔️         |      ✔️       |       ✔️        |   ✔️   |    ✔️    |   ✔️   | ❌  |    ❓    | 앱의 문서 저장 디렉토리                                      |
| **getTemporaryDirectory()**            |                    |        ✔️         |      ✔️       |       ✔️        |   ✔️   |    ✔️    |   ✔️   | ❌  |    ❓    | 임시 파일 저장 디렉토리                                      |
| **getExternalStorageDirectory()**      |                    |         ❌         |      ✔️       |       ❌         |   ❌   |    ❌    |   ❌   | ❌  |    ❌    | 안드로이드 외부 저장소 접근 (Android 10 이상 SAF 사용 권장)  |
| **getApplicationSupportDirectory()**   |                    |        ✔️         |      ✔️       |       ✔️        |   ✔️   |    ❌    |   ❌   | ❌  |    ❓    | 앱의 지원 파일 저장 디렉토리                                  |
| **getLibraryDirectory()**              |                    |        ✔️         |      ❌       |       ❌         |   ❌   |    ❌    |   ❌   | ❌  |    ❌    | iOS 앱 라이브러리 파일 저장 디렉토리                         |
| **getExternalCacheDirectories()**      |                    |         ❌         |      ✔️       |       ✔️        |   ❌   |    ❌    |   ❌   | ❌  |    ❌    | 안드로이드 외부 캐시 접근                                     |
| **getExternalStorageDirectories()**    |                    |         ❌         |      ✔️       |       ✔️        |   ❌   |    ❌    |   ❌   | ❌  |    ❌    | 안드로이드 외부 저장소 접근                                   |
| **shared_preferences**                 | shared_preferences |        ✔️         |      ✔️      |       ✔️       |   ✔️   |    ✔️    |   ✔️   | ✔️  |    ❓    | 키-값 저장소, 각 플랫폼에 적합한 저장 방식 사용                 |
| **hive**                               | hive               |        ✔️         |      ✔️      |       ✔️       |   ✔️   |    ✔️    |   ✔️   | ✔️  |    ❓    | 빠른 읽기/쓰기를 위한 경량 NoSQL 데이터베이스                    |
| **cached_network_image**               | cached_network_image|        ✔️         |      ✔️      |       ✔️       |   ✔️   |    ✔️    |   ✔️   | ✔️  |    ❓    | 네트워크 이미지 캐싱 및 표시                                  |

* 위 표에서 getApplicationDocumentsDirectory(), getTemporaryDirectory()가 웹이나 embedded 에서 사용이 불가능한데, Flutter에서 모든 플랫폼에서 일관되게 사용 가능한 파일 접근 방법은 없으며, 플랫폼별로 특화된 코드를 작성하거나 서버 기반의 스토리지 솔루션을 사용해야 할 수 있습니다.

## getApplicationSupportDirectory():

iOS, macOS, Android에서만 지원됩니다. Windows와 Linux에서는 해당 디렉토리의 개념이 없을 수 있기 때문에 지원되지 않습니다.

## getLibraryDirectory():

iOS에서만 사용됩니다. 다른 플랫폼(macOS, Android, Windows, Linux, Web, Embedded)에서는 이와 일치하는 디렉토리나 개념이 없기 때문에 지원되지 않습니다.

## getExternalStorageDirectory(), getExternalCacheDirectories(), getExternalStorageDirectories():

이 세 개의 함수는 안드로이드의 외부 저장소에 접근하는 기능을 제공합니다. 다른 플랫폼(iOS, macOS, Windows, Linux, Web, Embedded)에서는 이와 일치하는 개념이 없거나 보안 규칙에 의해 제한될 수 있기 때문에 지원되지 않습니다.

이 함수들의 차이는 아래와 같습니다.

- getExternalStorageDirectory(): 외부 저장소의 루트 디렉토리에 접근하게 해줍니다.
- getExternalCacheDirectories(): 외부 저장소에 있는 앱의 캐시 디렉토리에 접근하게 해줍니다.
- getExternalStorageDirectories(): 특정 타입의 외부 저장소 디렉토리(예: 사진, 동영상 등)에 접근할 수 있게 해줍니다.

안드로이드에서만 지원되는 이유는 외부 저장소의 개념이 안드로이드에만 존재하기 때문입니다. 여기서 외부 저장소란 SD card와 같은 저장소를 의미합니다.
iOS는 보안 이슈로 인해 SD card와 같은 외부 저장소가 존재하지 않습니다. (Windows와 macOS와 같은 데스크톱 운영 체제에서는 "외부 저장소"의 개념이 다르게 적용됩니다. 이러한 운영 체제에서는 파일 시스템을 통해 모든 드라이브와 장치에 일반적으로 접근할 수 있으며, 특별한 "외부 저장소" API가 필요하지 않습니다.)
다만, 비슷한 사유로 Android 10 이상에서 외부 저장소에 **직접 접근**하는 것이 deprecated 되었습니다. (즉, 현재 최신 Android 버전은 13, 14 이므로 사용하지 않는 게 좋습니다.)
대신, Storage Access Framework(SAF) 또는 MediaStore API를 사용하면 안드로이드의 외부 저장소와 상호 작용할 수 있습니다. 그리고 이 방식은 Android 10이하 버전에서도 하위호환이 됩니다.
Flutter에는 직접 SAF나 MediaStore API에 대한 플러그인이 제한적일 수 있으므로, 필요한 기능에 따라 직접 native 코드를 작성하거나 사용 가능한 라이브러리를 찾아 사용할 수 있습니다.

### Kotlin을 사용하여 Android에서 SAF를 사용하는 간단한 예제
```xml
// AndroidManifest.xml에 권한 추가
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

```kotlin
// native 코드 작성
import android.content.Intent
import android.provider.DocumentsContract

...

class MainActivity: FlutterActivity() {
    private val OPEN_DIRECTORY_REQUEST_CODE = 42

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "app.channel").setMethodCallHandler {
            call, result ->
            if (call.method == "openDirectory") {
                openDirectory()
            }
        }
    }

    private fun openDirectory() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        startActivityForResult(intent, OPEN_DIRECTORY_REQUEST_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == OPEN_DIRECTORY_REQUEST_CODE && resultCode == Activity.RESULT_OK) {
            val uri = data?.data
            val docId = DocumentsContract.getTreeDocumentId(uri)
            // 이제 docId를 사용하여 필요한 작업을 수행합니다.
        }
    }
}
```

```dart
// Flutter에서 native 호출
const channel = MethodChannel('app.channel');

void openDirectory() async {
  await channel.invokeMethod('openDirectory');
}
```

SAF와 MediaStore API의 차이는 아래와 같습니다.

- Storage Access Framework(SAF): SAF는 사용자가 파일을 선택하거나 문서를 생성, 편집할 수 있는 일반 인터페이스를 제공합니다. 사용자의 허가를 통해 다른 앱의 파일에 접근할 수 있으며, 이는 안드로이드 4.4 KitKat(API 레벨 19)부터 사용 가능하게 되었습니다.
- MediaStore API: MediaStore는 외부 저장소에 있는 공용 사진, 비디오, 오디오 파일에 접근할 수 있는 표준 인터페이스를 제공합니다. MediaStore 자체는 오래된 API이며, 안드로이드 1.0(API 레벨 1)부터 사용 가능하였습니다. Android 10에서는 scoped storage의 도입으로 인해 이를 사용하여 외부 저장소의 미디어 파일에 접근하는 것이 더 중요해졌습니다.