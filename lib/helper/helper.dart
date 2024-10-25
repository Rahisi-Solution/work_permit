import 'package:connectivity/connectivity.dart';

class ConnectivityHelper {
  static isDeviceConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      print('Connected via Mobile Network');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('Connected via WiFi Network');
      return true;
    } else {
      print('Device is Offline, Not Connected');

      return false;
    }
  }
}
