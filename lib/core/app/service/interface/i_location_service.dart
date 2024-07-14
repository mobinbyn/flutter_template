import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ILocationService {
  Future<bool> hasPermission();

  Future<bool> handleLocationPermission();

  // TODO register live location
  Future<LatLng?> getUserCurrentLocation({bool trackInBackground = false});

  Future<String> getAddressFromLatLng(LatLng latLng);

  void closeLocation();
}
