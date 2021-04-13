import 'package:flutter/material.dart';
import 'package:my_app/UI/button.dart';

class Answer extends StatelessWidget {
  final String text, lastAnswered;
  final Function pressed;

  Answer(this.text, this.pressed, this.lastAnswered);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Button(
          onPressed: () => pressed(text),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                textAlign: TextAlign.left,
              ),
              lastAnswered == text ? Icon(Icons.check) : SizedBox(),
            ],
          ),
        ));
  }
}
