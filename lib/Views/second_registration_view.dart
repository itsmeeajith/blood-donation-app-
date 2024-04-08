import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Utils/object_factory.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Views/add_image_view.dart';
import 'package:blood_donation_app/Views/home_view.dart';
import 'package:blood_donation_app/Views/pick_your_blood_group_view.dart';
import 'package:blood_donation_app/Widgets/build_icon_widget.dart';
import 'package:blood_donation_app/Widgets/build_page_navigator.dart';
import 'package:blood_donation_app/Widgets/build_textformfield_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Widgets/build_age_dropdown_widget.dart';

class SecondRegistrationView extends StatefulWidget {
  const SecondRegistrationView({super.key});

  @override
  State<SecondRegistrationView> createState() => _SecondRegistrationViewState();
}

class _SecondRegistrationViewState extends State<SecondRegistrationView> {
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _nameController = TextEditingController();
  final _districtController = TextEditingController();
  final _cityController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String genderValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Constants.kitGradients[0],
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ));
            },
            child: BuildIconWidget(
              iconData: Icons.arrow_back_ios,
              color: Constants.kitGradients[1],
            ),
          ),
          title: BuildTextWidget(
            text: 'Personal Information',
            size: 20,
            color: Constants.kitGradients[1],
            fontWeight: FontWeight.w400,
          )),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context, dividedBy: 8.5),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    // const BuildTextFormField(
                    //   iconData: Icons.no_adult_content,
                    //   hintText: 'Age',
                    // ),
                    BuildAgeDropdownWidget(
                      selectedValue: (p0) {
                        setState(() {
                          genderValue = p0!;
                        });
                        print(genderValue);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BuildTextFormField(
                        iconData: Icons.person,
                        hintText: 'Name',
                        controller: _nameController,
                        validation: (value) => validateName(value)),
                    const SizedBox(
                      height: 8,
                    ),
                    BuildTextFormField(
                      iconData: Icons.person,
                      hintText: 'Age',
                      controller: _ageController,
                      validation: (value) => validateAge(value),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    BuildTextFormField(
                      iconData: Icons.home,
                      hintText: 'Addreess',
                      controller: _addressController,
                      validation: (value) => validateAddress(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print(_ageController);
                        if (_formkey.currentState!.validate()) {
                          // try {
                          //   await FirebaseFirestore.instance
                          //       .collection('users')
                          //       .add({
                          //     'gender': genderValue,
                          //     'age': _ageController.text,
                          //     'address': _addressController.text,
                          //   });
                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) =>
                          //             const PickYourBloodGroup(),
                          //       ));
                          // } catch (e) {
                          //   print('Error adding to Firestore: $e');
                          // }
                          setState(() {
                            ObjectFactory()
                                .appHive
                                .putGender(value: genderValue);
                            ObjectFactory()
                                .appHive
                                .putAge(value: _ageController.text);
                            ObjectFactory()
                                .appHive
                                .putAddress(value: _addressController.text);
                            ObjectFactory()
                                .appHive
                                .putName(name: _nameController.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddImageView(),
                                ));
                            print(
                                'Gender stored in hive ${ObjectFactory().appHive.getGender()}');
                            print(
                                'age stored in hive ${ObjectFactory().appHive.getAge()} ');
                            print(
                                'address stored in hive ${ObjectFactory().appHive.getAddress()}');
                            print(
                                'name stored in hive ${ObjectFactory().appHive.getName()}');
                          });
                        }
                      },
                      child: BuildPageNavigator(
                          text: 'Next', color: Constants.kitGradients[0]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
