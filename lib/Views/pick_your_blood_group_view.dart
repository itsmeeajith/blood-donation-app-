import 'package:blood_donation_app/Utils/object_factory.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Views/login_view_new.dart';
import 'package:blood_donation_app/Views/second_registration_view.dart';
import 'package:blood_donation_app/Widgets/build_icon_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:flutter/material.dart';
import '../Utils/constants.dart';
import '../Widgets/build_page_navigator.dart';
import '../Widgets/build_pick_your_blood_group_widget.dart';

class PickYourBloodGroup extends StatefulWidget {
  const PickYourBloodGroup({super.key});

  @override
  State<PickYourBloodGroup> createState() => _PickYourBloodGroupState();
}

class _PickYourBloodGroupState extends State<PickYourBloodGroup> {
  List<bool> pickBloodGroup =
      List.generate(Constants.pickblood.length, (index) => false);
  List<bool> positiveNegative =
      List.generate(Constants.pickblood.length, (index) => false);
  bool isSelected = false;
  int count = 0;
  String? selectedBlood;
  List<String> selectNegativeOrPositive = [];

  // void storeSelectedBloodGroup(String bloodGroup) async {
  //   try {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       String selectedBloodGroup =
  //           Constants.pickblood[pickBloodGroup.indexOf(true)].title;
  //
  //       await FirebaseFirestore.instance
  //           .collection('donors')
  //           .doc(user.uid)
  //           .update({'bloodgroup': selectedBloodGroup});
  //       print('Blood group stored successfully: $selectedBloodGroup');
  //     } else {
  //       print('User not logged in');
  //     }
  //   } catch (e) {
  //     print('Error storing blood group: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginViewNew(),
                ));
          },
          child: BuildIconWidget(
              iconData: Icons.arrow_back_outlined,
              color: Constants.kitGradients[1]),
        ),
        backgroundColor: Constants.kitGradients[0],
        centerTitle: true,
        title: BuildTextWidget(
          text: 'Pick Your Blood Group',
          color: Constants.kitGradients[1],
          fontWeight: FontWeight.w500,
          size: 16,
        ),
      ),
      body: Column(children: [
        SizedBox(
            height: screenHeight(context, dividedBy: 6),
            width: screenWidth(context, dividedBy: 2.5),
            child: const Image(
                image:
                    AssetImage('assets/images/icon_images/Daco_5593601.png'))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Wrap(
              spacing: 13.0,
              runSpacing: 13.0,
              children: List.generate(
                Constants.pickblood.length,
                (index) => BuildPickYourBloodGroup(
                    title: Constants.pickblood[index].title,
                    onTap: () {
                      setState(
                        () {
                          for (int i = 0; i < pickBloodGroup.length; i++) {
                            pickBloodGroup[i] = (i == index);
                          }
                          setState(() {});
                          selectedBlood = Constants.pickblood[index].title;
                          print(selectedBlood);
                          // if (pickBloodGroup[index]) {
                          //   storeSelectedBloodGroup(
                          //       Constants.pickblood[index].title);
                          // }
                        },
                      );
                      // storeSelectedBloodGroup();
                    },
                    isSelected: pickBloodGroup[index]),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: screenHeight(context, dividedBy: 12),
        // ),
        // Wrap(
        //   spacing: 13.0,
        //   runSpacing: 13.0,
        //   children: List.generate(
        //     Constants.positivenegative.length,
        //     (index) => BuildPositiveNegativeWidget(
        //         title: Constants.positivenegative[index].title,
        //         onTap: () {
        //           setState(
        //             () {
        //               // positiveNegative[index] = !positiveNegative[index];
        //               for (int i = 0; i < positiveNegative.length; i++) {
        //                 positiveNegative[i] = (i == index);
        //               }
        //               setState(() {
        //                 selectNegativeOrPositive = [
        //                   selectedBlood!,
        //                   Constants.positivenegative[index].title
        //                 ];
        //                 print(selectNegativeOrPositive);
        //               });
        //             },
        //           );
        //         },
        //         isSelected: positiveNegative[index]),
        //   ),
        // ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (selectedBlood!.isEmpty) {
              print('not selected');
            } else {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondRegistrationView(),
                    ));
                ObjectFactory().appHive.putBloodGroup(value: selectedBlood);
                print(
                    'blood Group stored from hive : ${ObjectFactory().appHive.getBloodGroup()}');
              });
            }
          },
          child: BuildPageNavigator(
            text: 'Next',
            color: Constants.kitGradients[0],
          ),
        ),
        SizedBox(
          height: screenHeight(context, dividedBy: 25),
        ),
      ]),
    );
  }
}
