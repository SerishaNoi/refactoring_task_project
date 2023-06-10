import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  bool isDeviceConnected = false;

  Future<bool> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      isDeviceConnected = true;
    }
    return isDeviceConnected;
  }
}
