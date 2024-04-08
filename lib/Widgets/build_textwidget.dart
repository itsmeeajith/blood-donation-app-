import 'package:flutter/cupertino.dart';

class BuildTextWidget extends StatefulWidget {
  final String? text;
  final String? fontFamily;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  const BuildTextWidget(
      {super.key,
      this.text,
      this.fontFamily,
      this.color,
      this.size,
      this.fontWeight});

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toString(),
      style: (TextStyle(
        color: widget.color,
        fontSize: widget.size,
        fontFamily: widget.fontFamily,
        fontWeight: widget.fontWeight,
      )),
    );
  }
}
