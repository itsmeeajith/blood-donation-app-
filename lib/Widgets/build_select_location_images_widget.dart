import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildSelectLocationImagesWidget extends StatefulWidget {
  final String? assetImage;
  final String? title;
  const BuildSelectLocationImagesWidget(
      {super.key, this.assetImage, this.title});

  @override
  State<BuildSelectLocationImagesWidget> createState() =>
      _BuildSelectLocationImagesWidgetState();
}

class _BuildSelectLocationImagesWidgetState
    extends State<BuildSelectLocationImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage(widget.assetImage.toString())),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: BuildTextWidget(
            text: widget.title,
            fontWeight: FontWeight.w500,
            size: 11,
          ),
        ),
      ],
    );
  }
}
