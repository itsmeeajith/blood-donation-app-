import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/constants.dart';
import '../Utils/utils.dart';
import 'build_textwidget.dart';

class BuildBloodGroupWidget extends StatefulWidget {
  final String? title;
  final bool isSelected;
  final int? selectedIndex;
  final int? index;
  final Function? onTap;
  final double? size;
  final String? value;
  final Color? color;

  const BuildBloodGroupWidget({
    super.key,
    this.title,
    required this.isSelected,
    this.index,
    this.onTap,
    this.selectedIndex,
    this.size,
    this.color,
    this.value,
  });

  @override
  State<BuildBloodGroupWidget> createState() => _BuildBloodGroupWidgetState();
}

class _BuildBloodGroupWidgetState extends State<BuildBloodGroupWidget> {
  bool isSelected = false;
  // String value='';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap as void Function(),
      child: Container(
        width: screenWidth(context, dividedBy: 12),
        height: screenHeight(context, dividedBy: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: widget.isSelected
                ? Constants.kitGradients[3]
                : Constants.kitGradients[0],
            border: Border.all(color: Constants.kitGradients[2])),
        child: Center(
          child: SizedBox(
            child: BuildTextWidget(
              text: widget.title.toString(),
              color: widget.isSelected
                  ? Constants.kitGradients[0]
                  : Constants.kitGradients[2],
            ),
          ),
        ),
      ),
    );
  }
}
