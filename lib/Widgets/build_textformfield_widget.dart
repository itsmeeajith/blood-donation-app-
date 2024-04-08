import 'package:blood_donation_app/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'build_icon_widget.dart';

class BuildTextFormField extends StatefulWidget {
  final String? hintText;
  final IconData iconData;
  final String? labelText;
  final Widget? suffixIcon;
  final bool? isObscure;
  final TextEditingController? controller;
  final String? Function(String?)? validation;

  const BuildTextFormField({
    super.key,
    this.hintText,
    required this.iconData,
    this.labelText,
    this.suffixIcon,
    this.isObscure,
    this.controller,
    this.validation,
  });

  @override
  State<BuildTextFormField> createState() => _BuildTextFormFieldState();
}

class _BuildTextFormFieldState extends State<BuildTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isObscure ?? false,
        validator: (p0) => widget.validation!(p0),
        style: TextStyle(color: Constants.kitGradients[1]),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.kitGradients[1]),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Constants.kitGradients[1]),
          suffixIcon: widget.suffixIcon,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: widget.labelText,
          prefixIcon: BuildIconWidget(
              iconData: widget.iconData, color: Constants.kitGradients[3]),
        ),
      ),
    );
  }
}
