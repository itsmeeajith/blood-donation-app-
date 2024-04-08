import 'package:blood_donation_app/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/utils.dart';
import 'build_textwidget.dart';

class BuildPickYourBloodGroup extends StatefulWidget {
  final String? title;
  final int? index;
  final int? selectedIndex;
  final Function? onTap;
  final double? size;
  final bool isSelected;
  final Color? color;

  const BuildPickYourBloodGroup({
    super.key,
    this.title,
    this.size,
    this.selectedIndex,
    this.onTap,
    this.index,
    required this.isSelected,
    this.color,
  });
  @override
  State<BuildPickYourBloodGroup> createState() =>
      _BuildPickYourBloodGroupState();
}

class _BuildPickYourBloodGroupState extends State<BuildPickYourBloodGroup> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap as void Function(),
      child: Container(
        height: screenHeight(context, dividedBy: 13),
        width: screenWidth(context, dividedBy: 3.5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          color: widget.isSelected
              ? Constants.kitGradients[3]
              : Constants.kitGradients[5],
        ),
        child: Center(
          child: SizedBox(
            child: BuildTextWidget(
                size: 20,
                text: widget.title.toString(),
                color: widget.isSelected
                    ? Constants.kitGradients[0]
                    : Constants.kitGradients[0]),
          ),
        ),
      ),
    );
  }
}
