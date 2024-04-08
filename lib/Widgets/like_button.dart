import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import 'build_icon_widget.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isSelected = false;
  String like = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Constants.kitGradients[0],
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
              // isSelected = true;
              // isSelected ? like = 'not liked' : like = 'liked';
            },
            child: BuildIconWidget(
                iconData: CupertinoIcons.heart_fill,
                size: 29,
                color: isSelected
                    ? Constants.kitGradients[3]
                    : Constants.kitGradients[3].withOpacity(0.4)),
          ),
        ),
      ),
    );
  }
}
