import 'package:flutter/material.dart';

class BuildAgeDropdownWidget extends StatefulWidget {
  final Function(String?) selectedValue;
  const BuildAgeDropdownWidget({super.key, required this.selectedValue});

  @override
  State<BuildAgeDropdownWidget> createState() => _BuildAgeDropdownWidgetState();
}

class _BuildAgeDropdownWidgetState extends State<BuildAgeDropdownWidget> {
  @override
  String dropdownValue = 'Gender';
  String genderValue = '';

  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // Step 3.
      value: dropdownValue,
      // Step 4.
      items: <String>['Gender', 'Male', 'Female', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
      // Step 5.
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          widget.selectedValue(dropdownValue);
        });
      },
    );
  }
}
