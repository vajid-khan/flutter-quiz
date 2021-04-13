import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  Button({this.onPressed, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          alignment: Alignment(-1, 0),
        ),
      ),
    );
  }
}
