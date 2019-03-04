import 'dart:typed_data';

int byteToInt32(int b) =>
    new Int8List.fromList([b]).buffer.asByteData().getInt8(0);

String byteListToHexString(List<int> bytes) => bytes
    .map((i) => i.toRadixString(16).padLeft(2, '0'))
    .reduce((a, b) => (a + b));
