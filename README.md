# flutter_blue_beacon

A Bluetooth Low Energy (BLE) beacon implementation native to flutter using the `flutter_blue` plugin.

Current implementation status: 

| Protocol                     | Android | iOS*  |
| :---------------             | :-----: | :--- |
| iBeacon                      |   No    |  No  |
| AltBeacon                    |   No    |  No  |
| EddystoneUID                 |   Yes   |  Yes |
| EddystoneEID                 |   No    |  No  |
| EddystoneTLM (Unencrypted)   |   No    |  No  |
| EddystoneTLM (Encrypted)     |   No    |  No  |
| EddystoneURL                 |   No    |  No  |
* iOS code are not tested, feel free to report any problems

Feel free to contribute and add support to more protocols!  
A good start for implementing Eddystone: https://github.com/evothings/cordova-eddystone
A good start for implementing iBeacon: https://stackoverflow.com/questions/18906988/what-is-the-ibeacon-bluetooth-profile

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
