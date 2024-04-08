import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';

class Utils {}

String? currentAddress;
Position? _currentPosition;
// late bool servicePermission = false;
// late LocationPermission permission;
// String _currentAdress = "";

double screenWidth(BuildContext context, {double? dividedBy}) {
  return MediaQuery.of(context).size.width / (dividedBy ?? 1.0);
}

double screenHeight(BuildContext context, {double? dividedBy}) {
  return MediaQuery.of(context).size.height / (dividedBy ?? 1.0);
}

Future<void> getCurrentPosition(BuildContext context) async {
  final hasPermission = await _handleLocationPermission(context);

  if (!hasPermission) return;
  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
    // setState(() =>
    _currentPosition = position;
    // );
    _getAddressFromLatLng(_currentPosition!);
  }).catchError((e) {
    debugPrint(e.toString());
  });
}

Future<void> _getAddressFromLatLng(Position position) async {
  await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
    // setState(() {
    currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    // });
  }).catchError((e) {
    debugPrint(e.toString());
  });
}

Future<bool> _handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

/// validate name
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your name';
  }
  return null;
}

/// validate district
String? validateDistrict(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your District';
  }
  return null;
}

/// validate city
String? validateCity(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your city';
  }
  return null;
}

/// validate email
String? validateEmail(String? value) {
  final RegExp emailRegEx = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  if (value == null || value.isEmpty) {
    return 'Enter your email address';
  } else if (!emailRegEx.hasMatch(value)) {
    return 'Enter a valid email address ';
  }
  return null;
}

/// validate phone number
String? validatePhoneNumber(String? value) {
  final RegExp phoneNumberRegExp = RegExp(r"^(?:[+0][1-9])?[0-9]{10,12}$");
  if (value == null || value.isEmpty) {
    return 'enter your phone number';
  } else if (!phoneNumberRegExp.hasMatch(value)) {
    return 'Enter a valid phone number';
  }
  return null;
}

/// validate password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter a password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'please type your age';
  } else if (value.length > 2) {
    return 'enter a valid age';
  }
}

String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your address';
  }
}

Future<dynamic> pushAndReplacement(BuildContext context, Widget route) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => route));
}

// void launchPhoneDialer(String phoneNumber) async {
//   String url = 'tel:$phoneNumber';
//
//   try {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print('Could not launch $url');
//     }
//   } catch (e) {
//     print('Error launching phone dialer: $e');
//   }
// }
