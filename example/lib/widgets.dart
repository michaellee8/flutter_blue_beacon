// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_beacon/flutter_blue_beacon.dart';

class IBeaconCard extends StatelessWidget {
  final IBeacon iBeacon;

  IBeaconCard({@required this.iBeacon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("iBeacon"),
          Text("uuid: ${iBeacon.uuid}"),
          Text("major: ${iBeacon.major}"),
          Text("minor: ${iBeacon.minor}"),
          Text("tx: ${iBeacon.tx}"),
          Text("rssi: ${iBeacon.rssi}"),
          Text("distance: ${iBeacon.distance}"),
        ],
      ),
    );
  }
}

class EddystoneUIDCard extends StatelessWidget {
  final EddystoneUID eddystoneUID;

  EddystoneUIDCard({@required this.eddystoneUID});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("EddystoneUID"),
          Text("beaconId: ${eddystoneUID.beaconId}"),
          Text("namespaceId: ${eddystoneUID.namespaceId}"),
          Text("tx: ${eddystoneUID.tx}"),
          Text("rssi: ${eddystoneUID.rssi}"),
          Text("distance: ${eddystoneUID.distance}"),
        ],
      ),
    );
  }
}

class EddystoneEIDCard extends StatelessWidget {
  final EddystoneEID eddystoneEID;

  EddystoneEIDCard({@required this.eddystoneEID});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("EddystoneEID"),
          Text("ephemeralId: ${eddystoneEID.ephemeralId}"),
          Text("tx: ${eddystoneEID.tx}"),
          Text("rssi: ${eddystoneEID.rssi}"),
          Text("distance: ${eddystoneEID.distance}"),
        ],
      ),
    );
  }
}
