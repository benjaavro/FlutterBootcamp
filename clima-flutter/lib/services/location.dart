import 'package:geolocator/geolocator.dart';

class LocationManager {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position pos = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = pos.latitude;
      longitude = pos.longitude;

    } catch(e) {
      print(e);

    }
  }
}
