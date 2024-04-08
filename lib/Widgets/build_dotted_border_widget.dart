import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../Utils/utils.dart';

class BuildDottedBorderWidget extends StatefulWidget {
  const BuildDottedBorderWidget({super.key});

  @override
  State<BuildDottedBorderWidget> createState() =>
      _BuildDottedBorderWidgetState();
}

class _BuildDottedBorderWidgetState extends State<BuildDottedBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: screenHeight(context, dividedBy: 3),
          width: screenWidth(context, dividedBy: 1.3),
          color: Constants.kitGradients[0],
          child: Column(children: [
            SizedBox(
              height: 90,
              width: 110,
              child: Image(
                  color: Constants.kitGradients[2].withOpacity(0.9),
                  image: const AssetImage(
                      'assets/images/icon_images/NicePng_upload-icon-png_1298352.png')),
            ),
            Center(
              child: BuildTextWidget(
                text: 'Drop file here',
                color: Constants.kitGradients[1],
                size: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            // BuildTextWidget(
            //   text: 'OR',
            //   color: Constants.kitGradients[1].withOpacity(0.5),
            //   size: 10,
            //   fontWeight: FontWeight.w500,
            // ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: screenWidth(context, dividedBy: 3.1),
                height: screenHeight(context, dividedBy: 20.5),
                decoration: BoxDecoration(
                    color: Constants.kitGradients[2].withOpacity(0.9),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: BuildTextWidget(
                    text: 'Upload file',
                    color: Constants.kitGradients[0],
                    fontWeight: FontWeight.w400,
                    size: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            const Center(
              child: BuildTextWidget(
                size: 10,
                text: 'Only PNG,JPJ and PDF files are supported',
              ),
            )
          ]),
        ),
      ),
    );
  }
}
