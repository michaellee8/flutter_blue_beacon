library flutter_blue_beacon;

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_beacon/beacon.dart';
export 'package:flutter_blue_beacon/beacon.dart';
import 'package:flutter/foundation.dart';

enum BeaconType {
  AltBeacon, // Not implemented
  IBeacon, // Not implemented
  EddystoneUID,
  EddystoneEID, // Not implemented
  EddystoneURL, // Not implemented
  EddystoneTLM // Not implemented
}

class FlutterBlueBeacon {
  // Singleton
  FlutterBlueBeacon._();

  static FlutterBlueBeacon _instance = new FlutterBlueBeacon._();

  static FlutterBlueBeacon get instance => _instance;

  Stream<Beacon> scan(
      {@required List<BeaconType> types, @required Duration timeout}) {
    assert(types.length > 0);
    if (types.contains(BeaconType.EddystoneUID)) {
      return FlutterBlue.instance
          .scan(
              withServices: [Guid("0000FEAA-0000-1000-8000-00805F9B34FB")],
              timeout: timeout)
          .map((scanResult) => Beacon.fromScanResult(scanResult))
          .expand((b) => b)
          .where((b) => (b is EddystoneUID));
    }
    return Stream.fromIterable(List<Beacon>());
  }
}
