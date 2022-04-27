// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
//
// class CityProvider extends ChangeNotifier {
//   CityInfo cityInfo;
//
//   CityProvider() {
//     _handleCityChanges();
//   }
//
//   void _handleCityChanges() {
//     const EventChannel _stream = EventChannel('channel/city_change');
//     _stream.receiveBroadcastStream().listen(
//       (data) {
//         cityInfo = CityInfo.fromJson(jsonDecode(data));
//         notifyListeners();
//       },
//     );
//   }
// }
