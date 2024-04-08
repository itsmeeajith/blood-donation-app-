import 'package:flutter/cupertino.dart';

import '../Utils/constants.dart';
import '../Utils/utils.dart';
import 'build_textwidget.dart';

class BuildPositiveNegativeWidget extends StatefulWidget {
  final String? title;
  final int? index;
  final int? selectedIndex;
  final Function? onTap;
  final double? size;
  final bool isSelected;
  final Color? color;
  const BuildPositiveNegativeWidget(
      {super.key,
      this.title,
      this.index,
      this.selectedIndex,
      this.onTap,
      this.size,
      required this.isSelected,
      this.color});

  @override
  State<BuildPositiveNegativeWidget> createState() =>
      _BuildPositiveNegativeWidgetState();
}

class _BuildPositiveNegativeWidgetState
    extends State<BuildPositiveNegativeWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap as void Function(),
      child: Container(
        height: screenHeight(context, dividedBy: 13),
        width: screenWidth(context, dividedBy: 4.9),
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
                  : Constants.kitGradients[0],
            ),
          ),
        ),
      ),
    );
  }
}
