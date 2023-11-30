import "package:flutter/material.dart";
import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter_todo_auth/config/config.dart";

class AnimatedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      stopPauseOnTap: true,
      animatedTexts: [
        ScaleAnimatedText(
          Config.title,
          textStyle: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );
  }
}