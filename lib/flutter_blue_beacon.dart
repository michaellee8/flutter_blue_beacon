library flutter_blue_beacon;

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_beacon/beacon.dart';
export 'package:flutter_blue_beacon/beacon.dart';
import 'package:flutter/foundation.dart';

class FlutterBlueBeacon {
  // Singleton
  FlutterBlueBeacon._();

  static FlutterBlueBeacon _instance = new FlutterBlueBeacon._();

  static FlutterBlueBeacon get instance => _instance;

  Stream<Beacon> scan({@required Duration timeout}) => FlutterBlue.instance
      .scan(
          timeout: timeout)
      .map((scanResult) => Beacon.fromScanResult(scanResult))
      .expand((b) => b)
      .where((b) => (b is EddystoneUID));
}
