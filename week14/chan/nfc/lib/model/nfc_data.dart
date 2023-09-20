
const tag_pattern = 'https://example.com';

class NfcData {
  final String uid;
  final String payload;
  final bool isWriteable;

  NfcData({
    required this.uid,
    required this.payload,
    required this.isWriteable
  });

  factory NfcData.fromMap(Map<String, dynamic> map) {
    bool isAndroid = map.containsKey('nfca'); // android에서만 가지고 있는 구조

    var payload = "";
    if( map['ndef']['cachedMessage'] != null ) {
      payload = String.fromCharCodes(map['ndef']['cachedMessage']['records'][0]['payload']);
    }

    if (isAndroid) {
      return NfcData(
          uid: map['nfca']['identifier'].map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase()).join(),
          payload: payload,
          isWriteable: map['ndef']['isWritable']
      );
    } else {
      return NfcData(
          uid: map['mifare']['identifier'].map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase()).join(),
          payload: payload,
          isWriteable: map['ndef']['isWritable']
      );
    }
  }

  bool get isValidFormat => payload.startsWith(tag_pattern) && payload.split(tag_pattern).length > 1 && payload.split(tag_pattern)[1].length == 40;

  String get key {
    var result = '';
    return isValidFormat ? payload.split(tag_pattern)[1] : result;
  }

  @override
  String toString() {
    return '{uid: $uid, payload: $payload, key: $key}';
  }
}