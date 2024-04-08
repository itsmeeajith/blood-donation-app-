// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:blood_donation_app/Views/pick_your_blood_group_view.dart';
// import 'package:blood_donation_app/Views/select_location_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../Utils/constants.dart';
// import '../Views/home_view.dart';
//
// class HomeMenu extends StatefulWidget {
//   const HomeMenu({Key? key}) : super(key: key);
//
//   @override
//   State<HomeMenu> createState() => _HomeMenuState();
// }
//
// class _HomeMenuState extends State<HomeMenu> {
//   int currentIndex = 0;
//   final PageController pageController = PageController(
//     initialPage: 0,
//     keepPage: true,
//   );
//
//   List<Widget> pages = [
//     const HomeView(),
//     const SelectLocationView(),
//     const PickYourBloodGroup(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.red,
//         selectedItemColor: CupertinoColors.systemPurple,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Constants.kitGradients[1],
//             icon: Icon(Icons.home),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Constants.kitGradients[1],
//             icon: Icon(Icons.bloodtype),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Constants.kitGradients[1],
//             icon: Icon(CupertinoIcons.profile_circled),
//             label: '',
//           ),
//         ],
//         unselectedItemColor: Constants.kitGradients[5],
//         currentIndex: currentIndex,
//         onTap: (value) {
//           setState(() {
//             currentIndex = value;
//           });
//         },
//       ),
//     );
//   }
// }
