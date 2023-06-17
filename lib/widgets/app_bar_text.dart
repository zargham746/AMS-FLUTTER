import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String text;
  const AppBarText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            color: Colors.white,
          ),
          Shadow(
            offset: Offset(1, 1.0),
            blurRadius: 1.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
