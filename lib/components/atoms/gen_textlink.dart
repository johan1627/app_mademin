import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String? title;
  final Null Function()? onPressed;
  final Color? color;

  const TextLink({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(
        title!,
        style: footFont.copyWith(
          decoration: TextDecoration.underline,
          color: color,
        ),
      ),
    );
  }
}
