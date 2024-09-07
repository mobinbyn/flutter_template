// import 'dart:async';

// import 'package:flutter_template/core/app/service/interface/i_location_service.dart';
// import 'package:flutter_template/core/app/utility/logging_mixin.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationService extends ILocationService with LogMixin {
//   late StreamSubscription<Position>? positionStream;

//   // Continuously emit location updates
//   final StreamController<LatLng> _locationController = StreamController<LatLng>.broadcast();

//   Stream<LatLng> get locationStream => _locationController.stream;

//   LocationService() {
//     positionStream = Geolocator.getPositionStream().listen(
//       (Position location) {
//         _locationController.add(
//           LatLng(location.latitude, location.longitude),
//         );
//       },
//     );
//   }

//   @override
//   Future<String> getAddressFromLatLng(LatLng latLng) async {
//     await placemarkFromCoordinates(latLng.latitude, latLng.longitude).then(
//       (List<Placemark> placemark) {
//         Placemark place = placemark[0];
//         return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//       },
//     ).catchError(
//       (e) {
//         logger.e('No address found: $e');
//         return 'No address found';
//       },
//     );
//     return 'No address found';
//   }

//   @override
//   Future<LatLng?> getUserCurrentLocation({bool trackInBackground = false}) async {
//     LatLng? currentLocation;

//     final mHasPermission = await hasPermission();

//     if (!mHasPermission) return currentLocation;

//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then(
//       (Position position) {
//         currentLocation = LatLng(position.latitude, position.longitude);
//       },
//     );

//     return currentLocation;
//   }

//   @override
//   Future<bool> handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       logger.d('Location services are disabled. Please enable the services');
//       return false;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         logger.d('Location permissions are denied');
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       logger.d('Location permissions are permanently denied, we cannot request permissions.');
//       return false;
//     }
//     return true;
//   }

//   @override
//   Future<bool> hasPermission() async {
//     // Check if location services are enabled
//     if (!await Geolocator.isLocationServiceEnabled()) return false;

//     // Check if location permissions are granted
//     LocationPermission permission = await Geolocator.checkPermission();
//     return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
//   }

//   @override
//   void closeLocation() {
//     if (positionStream != null) {
//       positionStream!.cancel();

//       _locationController.close();

//       positionStream = null;
//     }
//   }
// }
