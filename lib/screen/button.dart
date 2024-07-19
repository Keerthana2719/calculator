import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textcolor;
  final buttonText;
  final VoidCallback onPressed;

  const Buttons({
    Key? key,
    required this.color,
    required this.textcolor,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textcolor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
