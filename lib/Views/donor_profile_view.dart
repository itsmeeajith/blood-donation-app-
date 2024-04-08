import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Widgets/build_icon_text_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:blood_donation_app/Widgets/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/build_icon_widget.dart';
import 'home_view.dart';

class DonorProfileView extends StatefulWidget {
  const DonorProfileView({
    super.key,
  });

  @override
  State<DonorProfileView> createState() => _DonorProfileViewState();
}

class _DonorProfileViewState extends State<DonorProfileView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image(
                  height: screenHeight(context, dividedBy: 1.8),
                  fit: BoxFit.cover,
                  image: const AssetImage(
                      'assets/images/donors_image/123228-odhiybzhuc-1562239844.jpg'),
                ),
                Positioned(
                  top: 17,
                  left: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ));
                    },
                    child: const BuildIconWidget(
                      iconData: Icons.arrow_back_ios,
                      size: 26,
                    ),
                  ),
                ),
                const Positioned(left: 310, top: 10, child: LikeButton()),
                Positioned(
                  top: screenHeight(context, dividedBy: 2.1),
                  child: Container(
                    height: screenHeight(context, dividedBy: 2.0),
                    width: screenWidth(context),
                    decoration: BoxDecoration(
                        color: Constants.kitGradients[0],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(60),
                            topLeft: Radius.circular(60)),
                        border: Border.symmetric(
                            horizontal: BorderSide(
                                color:
                                    Constants.kitGradients[2].withOpacity(0.8),
                                width: 6))),
                    child: Column(children: [
                      const SizedBox(
                        height: 25,
                      ),
                      BuildTextWidget(
                        text: 'Rodrigo Hernández',
                        color: Constants.kitGradients[3],
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'PaytoneOne-Regular.ttf',
                        size: 26,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            child: Container(
                              height: screenHeight(context, dividedBy: 3.1),
                              width: screenWidth(context, dividedBy: 1.1),
                              decoration: BoxDecoration(
                                  color: Constants.kitGradients[0],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                      color: Constants.kitGradients[1]
                                          .withOpacity(0.1))),
                              child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    BuildIconTextWidget(
                                      icon: Icons.directions_walk,
                                      text: 'Distance 383.53 Km',
                                    ),
                                    BuildIconTextWidget(
                                      icon: Icons.person,
                                      text: 'Age: 55   || Gender: male',
                                    ),
                                    BuildIconTextWidget(
                                      icon: Icons.home,
                                      text:
                                          'address: Rodrigo Hernandez \nCascante, Madrid, Spain',
                                    ),
                                    BuildIconTextWidget(
                                      icon: Icons.email,
                                      text: ' iamajith009@gmail.com',
                                    ),
                                    BuildIconTextWidget(
                                      icon: Icons.bloodtype,
                                      text: 'Unit Donated: 05',
                                    ),
                                  ]),
                            ),
                          ),
                          Positioned(
                            bottom: screenHeight(context, dividedBy: 3.3),
                            left: 89,
                            child: Card(
                              child: Container(
                                width: screenWidth(context, dividedBy: 2.4),
                                height: screenHeight(context, dividedBy: 21),
                                decoration: BoxDecoration(
                                    color: Constants.kitGradients[0],
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.1))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        BuildTextWidget(
                                          text: '5',
                                          size: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Constants.kitGradients[2],
                                        ),
                                        const BuildTextWidget(
                                          text: 'life saved',
                                          size: 8,
                                          fontWeight: FontWeight.w600,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: screenHeight(
                                        context,
                                      ),
                                      width:
                                          screenWidth(context, dividedBy: 6.5),
                                      decoration: BoxDecoration(
                                          color: Constants.kitGradients[2],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(3))),
                                      child: Center(
                                        child: Text('A+',
                                            style: TextStyle(
                                              color: Constants.kitGradients[0],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Column(
                                      children: [
                                        BuildTextWidget(
                                          text: '12',
                                          size: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Constants.kitGradients[2],
                                        ),
                                        const BuildTextWidget(
                                          text: 'appreciate',
                                          size: 8,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
