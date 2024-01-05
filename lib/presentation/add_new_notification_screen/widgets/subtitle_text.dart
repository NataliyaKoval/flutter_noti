import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.43,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
