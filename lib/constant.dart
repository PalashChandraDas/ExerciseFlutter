import 'package:connectivity_plus/connectivity_plus.dart';

//check internet_connection
Future<bool> checkNet() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  const noCon = ConnectivityResult.none;
  return (connectivityResult == noCon) ? false : true;
}