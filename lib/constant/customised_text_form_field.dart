import 'package:flutter/material.dart';

class CustomisedTextFormField extends StatefulWidget {
  final Function onSaved;
  final Function validator;
  final String hintText;
  final TextEditingController controller;

  CustomisedTextFormField(
      {Key? key,
      required this.onSaved,
      required this.validator,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  _CustomisedTextFormFieldState createState() =>
      _CustomisedTextFormFieldState();
}

class _CustomisedTextFormFieldState extends State<CustomisedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(180, 165, 142, 113),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.only(left: 20, bottom: 2, top: 2, right: 20),
        border: InputBorder.none,
        filled: true,
        fillColor: const Color.fromARGB(180, 165, 142, 113),
      ),
    );
  }
}
