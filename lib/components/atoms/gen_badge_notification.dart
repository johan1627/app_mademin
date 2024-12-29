import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class GenBadgeNotification extends StatelessWidget {
  final bool visible;
  final String value;

  const GenBadgeNotification({
    super.key,
    required this.visible,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Positioned(
        top: 0.0,
        right: 0.0,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 6.0,
          ),
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            value,
            style: smallFont.copyWith(
              color: whiteFlat,
            ),
          ),
        ),
      ),
    );
  }
}
