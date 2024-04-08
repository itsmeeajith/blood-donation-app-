import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../Utils/utils.dart';
import 'build_icon_widget.dart';
import 'build_textwidget.dart';

class BuildLocationBarWidget extends StatefulWidget {
  final String? text;
  final IconData? icon;
  // final bool isSelected;
  final Function(String)? onLocationSelected;

  const BuildLocationBarWidget(
      {super.key,
      this.text,
      this.icon,
      // required this.isSelected,
      this.onLocationSelected});

  @override
  State<BuildLocationBarWidget> createState() => _BuildLocationBarWidgetState();
}

class _BuildLocationBarWidgetState extends State<BuildLocationBarWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1.1),
      height: screenHeight(context, dividedBy: 18.5),
      decoration: BoxDecoration(
          color: Constants.kitGradients[7].withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          BuildIconWidget(
            iconData: widget.icon,
            color: Constants.kitGradients[0],
            size: 19,
          ),
          const SizedBox(
            width: 12,
          ),
          BuildTextWidget(
            text: widget.text,
            color: Constants.kitGradients[0],
            fontWeight: FontWeight.w400,
            size: 13,
          ),
        ],
      ),
    );
  }
}
