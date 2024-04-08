import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Widgets/builld_signup_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Controllers/login_controller.dart';
import '../Utils/object_factory.dart';
import '../Utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewNew extends StatefulWidget {
  const LoginViewNew({super.key});

  @override
  State<LoginViewNew> createState() => _LoginViewNewState();
}

class _LoginViewNewState extends State<LoginViewNew> {
  LoginController loginController = LoginController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      body: Column(children: [
        Image(
            width: screenHeight(context, dividedBy: 2.7),
            image: const AssetImage(
                'assets/images/icon_images/Black_and_White_Monogram_Business_Logo-removebg-preview.png')),
        SizedBox(
          height: screenHeight(context, dividedBy: 30),
        ),
        Container(
          width: screenWidth(context, dividedBy: 1),
          height: screenHeight(context, dividedBy: 2.5),
          child: Lottie.asset('assets/lotties/Animation - 1709666921300.json'),
        ),
        BuildSignUpWidget(
          onTap: () async {
            await loginController.signInWithGoogle(context);
            print('tappedd');
            print('Email from Hive: ${ObjectFactory().appHive.getEmail()}');
            print('UserID from Hive: ${ObjectFactory().appHive.getUserId()}');
          },
        ),
        Spacer(),
        RotatedBox(
          quarterTurns: 2,
          child: Container(
            width: screenWidth(context),
            height: screenHeight(context, dividedBy: 16),
            // color: Colors.deepOrange,
            child: Lottie.asset('assets/lotties/Animation - 1709298216754.json',
                fit: BoxFit.cover),
          ),
        )
      ]),
    );
  }
}
