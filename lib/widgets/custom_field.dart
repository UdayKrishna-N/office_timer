import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:office_timer/constants.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.first,
    required this.last,
    required this.controller,
  }) : super(key: key);

  final bool first;
  final bool last;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 2 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        readOnly: false,
        showCursor: true,
        autofocus: true,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          color: Constants.primaryColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        cursorColor: Constants.primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
