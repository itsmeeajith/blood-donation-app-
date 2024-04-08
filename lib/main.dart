import 'package:blood_donation_app/Utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(Constants.BOX_NAME);
  // var box = await Hive.openBox("BloodDonation");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // _makingPhoneCall() async {
  //   var url = Uri.parse("tel:8137988414");
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'could not launch $url';
  //   }
  // }

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) =>
    const MyApp(),
    // ),
  );
}
