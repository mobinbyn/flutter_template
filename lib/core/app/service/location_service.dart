// import 'dart:async';

// import 'package:flutter_template/core/app/utility/logging_mixin.dart';
// import 'package:location/location.dart';

// class LocationService with LogMixin {
//   // Keep track of current location
//   late UserLocation _currentLocation;

//   var location = Location();

//   // Continuously emit location updates
//   final StreamController<UserLocation> _locationController =
//       StreamController<UserLocation>.broadcast();

//   LocationService() {
//     location.requestPermission().then((value) {
//       if (value == PermissionStatus.granted) {
//         location.onLocationChanged.listen((locationData) {
//           _locationController.add(UserLocation(
//             latitude: locationData.latitude,
//             longitude: locationData.longitude,
//           ));
//         });
//       }
//     });
//   }

//   Stream<UserLocation> get locationStream => _locationController.stream;

//   Future<UserLocation> getLocation() async {
//     try {
//       LocationData userLocation = await location.getLocation();
//       logger.d(
//           'User location: latitude = ${userLocation.latitude} longitude = ${userLocation.longitude}');
//       _currentLocation = UserLocation(
//         latitude: userLocation.latitude,
//         longitude: userLocation.longitude,
//       );
//     } catch (e) {
//       logger.e('Can not access for location: $e');
//     }
//     return _currentLocation;
//   }
// }

// class UserLocation {
//   final double? latitude;
//   final double? longitude;

//   UserLocation({required this.latitude, required this.longitude});
// }
