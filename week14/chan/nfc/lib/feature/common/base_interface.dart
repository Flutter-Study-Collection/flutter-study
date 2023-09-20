import 'dart:io';

import 'package:nfc_manager/nfc_manager.dart';

import '../../model/nfc_data.dart';

mixin class BaseInterface {
  /// 안드로이드의 경우엔 앱 선택 팝업이 뜨지 않게 하기 위해 앱의 구동 내내 nfc를 listen하고 있어야하며,
  /// iOS 같은 경우 NFC 읽기 상태를 활성화해줘야 팝업이 뜨고 읽기 가능함
  void listenNfc({required Function(NfcData nfcData) onDiscovered}) {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      onDiscovered(NfcData.fromMap(tag.data));

      if (!Platform.isAndroid) {
        await NfcManager.instance.stopSession(alertMessage: 'Session stopped');
      }
    });
  }
}
