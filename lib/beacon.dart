library flutter_blue_beacon;

import 'package:flutter/foundation.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:math';
import 'package:flutter_blue_beacon/utils.dart';
export 'package:flutter_blue/flutter_blue.dart' show ScanResult;



const EddystoneServiceId = "0000feaa-0000-1000-8000-00805f9b34fb";


// This file defines type that are considered as a valid beacon.

// Base class for all beacons
abstract class Beacon {
  final int tx;
  final ScanResult scanResult;

  double get distance {
    double ratio = rssi * 1.0 / tx;
    if (ratio < 1.0) {
      return pow(ratio, 10);
    } else {
      return (0.89976) * pow(ratio, 7.7095) + 0.111;
    }
  }

  int get rssi => scanResult.rssi;

  String get name => scanResult.device.name;

  String get id => scanResult.device.id.id;

  const Beacon({@required this.tx, @required this.scanResult});

  // Returns the first found beacon protocol in one device
  factory Beacon.fromScanResult(ScanResult scanResult) {
    // Detect Eddystone
    if (scanResult.advertisementData.serviceData
        .containsKey(EddystoneServiceId)) {
      // Detect EddystoneUID
      if (scanResult.advertisementData
              .serviceData[EddystoneServiceId][0] ==
          0x00) {
        return EddystoneUID.fromScanResult(scanResult);
      }
    }
    return null;
  }
}

// Base class of all Eddystone beacons
abstract class Eddystone extends Beacon {
  const Eddystone({@required int tx, @required ScanResult scanResult})
      : super(tx: tx, scanResult: scanResult);

  @override
  double get distance {
    double ratio = rssi * 1.0 / (tx - 41);
    if (ratio < 1.0) {
      return pow(ratio, 10);
    } else {
      return (0.89976) * pow(ratio, 7.7095) + 0.111;
    }
  }
}

class EddystoneUID extends Eddystone {
  final int frameType;
  final String namespaceId;
  final String beaconId;

  const EddystoneUID(
      {@required this.frameType,
      @required this.namespaceId,
      @required this.beaconId,
      @required int tx,
      @required ScanResult scanResult})
      : super(tx: tx, scanResult: scanResult);

  factory EddystoneUID.fromScanResult(ScanResult scanResult) {
    if (!scanResult.advertisementData.serviceData
        .containsKey(EddystoneServiceId)) {
      return null;
    }
    if (scanResult.advertisementData
            .serviceData[EddystoneServiceId].length <
        18) {
      return null;
    }
    if (scanResult.advertisementData
            .serviceData[EddystoneServiceId][0] !=
        0x00) {
      return null;
    }
    List<int> rawBytes = scanResult
        .advertisementData.serviceData[EddystoneServiceId];
    var frameType = rawBytes[0];
    var tx = byteToInt32(rawBytes[1]);
    var namespaceId = byteListToHexString(rawBytes.sublist(2, 12));
    var beaconId = byteListToHexString(rawBytes.sublist(12, 18));
    return EddystoneUID(
        frameType: frameType,
        namespaceId: namespaceId,
        beaconId: beaconId,
        tx: tx,
        scanResult: scanResult);
  }
}
