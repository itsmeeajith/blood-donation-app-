import 'package:blood_donation_app/Views/login_view_new.dart';
import 'package:flutter/material.dart';

import 'Views/add_image_view.dart';
import 'Views/second_registration_view.dart';
import 'Views/donor_profile_view.dart';
import 'Views/home_view.dart';
import 'Views/login_view.dart';
import 'Views/pick_your_blood_group_view.dart';
import 'Views/registration_view.dart';
import 'Views/select_location_view.dart';
import 'Widgets/build_dotted_border_widget.dart';
import 'Widgets/build_pick_your_blood_group_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Widgets/home_menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginViewNew(),
    );
  }
}
