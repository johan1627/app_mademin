import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompSectionBgWhite extends StatelessWidget {
  const CompSectionBgWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 180.0), // 160.0
      decoration: const BoxDecoration(
        color: whiteFlat,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
    );
  }
}
