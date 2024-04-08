import 'package:blood_donation_app/Utils/hive.dart';
import 'package:blood_donation_app/Views/second_registration_view.dart';
import 'package:blood_donation_app/Views/pick_your_blood_group_view.dart';
import 'package:blood_donation_app/Widgets/build_textformfield_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/donor_response_model.dart';
import '../Utils/constants.dart';
import '../Utils/utils.dart';
import 'login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  _registerData() async {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance
          .collection('users')
          .add({'password': _passwordController.text});
    }
  }

  bool visible = true;
  List names = [];
  List<DonorResponseModel> userDatas = [];

  // getData() async {
  //   QuerySnapshot donorSnapshot =
  //       await FirebaseFirestore.instance.collection("users").get();
  //
  //   for (QueryDocumentSnapshot document in donorSnapshot.docs) {
  //     print(document["name"]);
  //     names.add(document["name"]);
  //     DonorResponseModel donorData =
  //         DonorResponseModel.fromJson(document.data() as Map<String, dynamic>);
  //
  //     userDatas.add(donorData);
  //   }
  //   print('userDatas[0].name');
  //   print(userDatas[0].name);
  // }

  @override
  void initState() {
    // getData();
    appHive.putEmail(value: "iamajith009@gmail.com");
    print("appHive.getEmail()");
    print(appHive.getEmail());
    _registerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                height: screenHeight(context, dividedBy: 3.0),
                color: Constants.kitGradients[3],
                image: const AssetImage(
                    'assets/images/icon_images/Black_and_White_Monogram_Business_Logo-removebg-preview.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    BuildTextFormField(
                        iconData: Icons.person,
                        labelText: 'Username',
                        controller: _usernameController,
                        validation: (value) => validateName(value)),
                    const SizedBox(
                      height: 8,
                    ),
                    BuildTextFormField(
                      iconData: Icons.email_outlined,
                      labelText: 'Email',
                      controller: _emailController,
                      validation: (value) => validateEmail(value),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BuildTextFormField(
                      iconData: Icons.call_rounded,
                      labelText: 'phone number',
                      controller: _mobileNumberController,
                      validation: (value) => validatePhoneNumber(value),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth(context, dividedBy: 1.1),
                height: screenHeight(context, dividedBy: 15),
                decoration: BoxDecoration(
                    color: Constants.kitGradients[3],
                    borderRadius: const BorderRadius.all(Radius.circular(3))),
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      : GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              // await Future.delayed(Duration(seconds: 5));
                              // try {
                              //   FirebaseFirestore.instance
                              //       .collection('users')
                              //       .add({
                              //     'username': _usernameController.text,
                              //     'Email': _emailController.text,
                              //     'phone number': _mobileNumberController.text,
                              //     'password': _passwordController.text
                              //   });
                              // } catch (e) {
                              //   print("error uploading data $e");
                              // }
                              appHive.putEmail(value: _emailController.text);
                              appHive.putUserId(
                                  userId: _usernameController.text);
                              appHive.putPhone_Number(
                                  phoneNumber: _mobileNumberController.text);

                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SecondRegistrationView(),
                                  ));
                            }
                          },
                          child: BuildTextWidget(
                              text: 'Register',
                              color: Constants.kitGradients[0],
                              size: 16),
                        ),
                ),
              ),
              SizedBox(height: screenHeight(context, dividedBy: 3.8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BuildTextWidget(
                    text: 'Already have an account? ',
                    size: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginview(),
                          ));
                    },
                    child: BuildTextWidget(
                      text: 'Log In ',
                      color: Constants.kitGradients[3],
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
    );
  }
}
