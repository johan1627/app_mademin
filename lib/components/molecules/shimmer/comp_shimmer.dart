import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompShimmer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CompShimmer({
    super.key,
    required this.width,
    this.height = 10.0,
    this.color = greyLightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
