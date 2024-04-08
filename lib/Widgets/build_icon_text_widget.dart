import 'package:blood_donation_app/Widgets/build_icon_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:flutter/cupertino.dart';

class BuildIconTextWidget extends StatefulWidget {
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final String? text;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? color;
  const BuildIconTextWidget(
      {super.key,
      required this.icon,
      this.iconSize,
      this.iconColor,
      this.text,
      this.textSize,
      this.textFontWeight,
      this.color});

  @override
  State<BuildIconTextWidget> createState() => _BuildIconTextWidgetState();
}

class _BuildIconTextWidgetState extends State<BuildIconTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        BuildIconWidget(
          iconData: widget.icon,
          size: widget.iconSize,
          color: widget.iconColor,
        ),
        SizedBox(
          width: 20,
        ),
        BuildTextWidget(
          text: widget.text,
          color: widget.color,
          size: widget.textSize,
          fontWeight: widget.textFontWeight,
        )
      ],
    );
  }
}
