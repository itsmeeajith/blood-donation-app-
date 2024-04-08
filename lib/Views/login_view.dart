import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Views/home_view.dart';
import 'package:blood_donation_app/Views/registration_view.dart';
import 'package:blood_donation_app/Widgets/build_textformfield_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:blood_donation_app/firebase_controller/firebase_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final _emailController = TextEditingController();
  final _loginpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visible = false;
  checkExistingUser({required String email, password}) async {
    bool userExists = await getData(
      email: email,
      password: password,
    );
    print('userExists');
    print(userExists);
  }

  // @override
  // void initState() {
  //   checkExistingUser(email: 'akzajith009@gmail.com');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          // systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
      child: SafeArea(
        // child: AnnotatedRegion<SystemUiOverlayStyle>(
        // value: SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness: Brightness.dark,
        //   // statusBarBrightness: Brightness.light,
        // ),
        child: Scaffold(
          backgroundColor: Constants.kitGradients[0],
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    height: screenHeight(context, dividedBy: 2.9),
                    color: Constants.kitGradients[3],
                    image: const AssetImage(
                        'assets/images/icon_images/Black_and_White_Monogram_Business_Logo-removebg-preview.png'
                        ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Column(
                      children: [
                        BuildTextFormField(
                          iconData: Icons.email_outlined,
                          labelText: 'Email',
                          controller: _emailController,
                          validation: (value) {
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_emailController.text)) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 60),
                        ),
                        BuildTextFormField(
                            iconData: Icons.lock,
                            labelText: 'Password',
                            isObscure: visible,
                            controller: _loginpasswordController,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter some text';
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: const Icon(CupertinoIcons.eye_slash))),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 195),
                    child: BuildTextWidget(
                      text: 'Forgot Password?',
                      color: Colors.black,
                      size: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    width: screenWidth(context, dividedBy: 1.1),
                    height: screenHeight(context, dividedBy: 15),
                    decoration: BoxDecoration(
                        color: Constants.kitGradients[3],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await getData(
                              email: _emailController.text,
                              password: _loginpasswordController.text,
                            )
                                // checkExistingUser(email: 'email')
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeView(),
                                    ))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegistrationView(),
                                    ));
                          }
                        },
                        child: BuildTextWidget(
                            text: 'Log In',
                            color: Constants.kitGradients[0],
                            size: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth(context, dividedBy: 3),
                        height: 0.5,
                        color: Constants.kitGradients[1].withOpacity(0.5),
                      ),
                      BuildTextWidget(
                        text: ' OR ',
                        size: 10,
                        color: Constants.kitGradients[1].withOpacity(0.8),
                      ),
                      Container(
                        width: screenWidth(context, dividedBy: 3),
                        height: 0.5,
                        color: Constants.kitGradients[1].withOpacity(0.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Image(
                          image: AssetImage(
                              'assets/images/icon_images/2993685_brand_brands_google_logo_logos_icon.png'),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Image(
                          image: AssetImage(
                            'assets/images/icon_images/5296499_fb_facebook_facebook logo_icon.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 5.8),
                  ),
                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BuildTextWidget(
                        text: 'Dont have an accocunt? ',
                        size: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationView()));
                        },
                        child: BuildTextWidget(
                          text: 'Register Now',
                          color: Constants.kitGradients[2],
                          size: 14,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  )
                ],
              ),
            ),
          ),
        ),
        // )
      ),
    );
  }
}
