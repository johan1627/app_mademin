import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class GenBadge extends StatelessWidget {
  final String lable;

  const GenBadge({
    super.key,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor.withOpacity(0.3),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: Text(
        lable,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: footFont.copyWith(
          color: primaryColor,
        ),
      ),
    );
  }
}
