import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import '../Utils/constants.dart';
import '../Utils/utils.dart';
import 'build_textwidget.dart';

class BuildPageNavigator extends StatefulWidget {
  final String text;
  final Color? color;
  // final Double? size;

  const BuildPageNavigator({
    super.key,
    required this.text,
    this.color,
    // this.size
  });

  @override
  State<BuildPageNavigator> createState() => _BuildPageNavigatorState();
}

class _BuildPageNavigatorState extends State<BuildPageNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1.1),
      height: screenHeight(context, dividedBy: 15),
      decoration: BoxDecoration(
          color: Constants.kitGradients[3],
          borderRadius: const BorderRadius.all(Radius.circular(3))),
      child: Center(
        child:
            BuildTextWidget(text: widget.text, color: widget.color, size: 16),
      ),
    );
  }
}
