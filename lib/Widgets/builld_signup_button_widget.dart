import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:flutter/material.dart';

class BuildSignUpWidget extends StatefulWidget {
  final void Function() onTap;
  const BuildSignUpWidget({super.key, required this.onTap});

  @override
  State<BuildSignUpWidget> createState() => _BuildSignUpWidgetState();
}

class _BuildSignUpWidgetState extends State<BuildSignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: screenHeight(context, dividedBy: 15.5),
        width: screenWidth(context, dividedBy: 1.2),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 5.0,
                  offset: Offset(0.0, 3.0)),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.5)),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Row(
          children: [
            Image(
                image: AssetImage(
                    'assets/images/icon_images/7123025_logo_google_g_icon.png')),
            SizedBox(
              width: screenWidth(context, dividedBy: 12.5),
            ),
            Text(
              'Continue With Google',
              style: TextStyle(
                color: Constants.kitGradients[3],
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
