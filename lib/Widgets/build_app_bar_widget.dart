import 'package:flutter/material.dart';
import '../Utils/constants.dart';
import 'build_icon_widget.dart';
import 'build_textwidget.dart';

class BuildAppBarWidget extends StatefulWidget {

  const BuildAppBarWidget({super.key,});

  @override
  State<BuildAppBarWidget> createState() => _BuildAppBarWidgetState();
}

class _BuildAppBarWidgetState extends State<BuildAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Constants.kitGradients[3],
        centerTitle: true,
        title: Text(
          'Blood Donor Network',
          style: TextStyle(
            color: Constants.kitGradients[0],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BuildIconWidget(
          iconData: Icons.menu,
          color: Constants.kitGradients[0],
        ),
        actions: [
          BuildIconWidget(
            iconData: Icons.person,
            color: Constants.kitGradients[0],
          ),
          SizedBox(
            width: 10,
          )
        ]);
  }
}
