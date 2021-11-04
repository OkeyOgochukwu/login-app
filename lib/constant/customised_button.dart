import 'package:flutter/material.dart';

class CustomisedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  CustomisedButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    shadowColor: Colors.grey,
    backgroundColor: Colors.lightBlue[300], //,

    minimumSize: Size(150, 45),
    padding: EdgeInsets.symmetric(horizontal: 29.0),
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      style: flatButtonStyle,
    );
  }
}
