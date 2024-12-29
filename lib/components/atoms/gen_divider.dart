import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 2.0,
      color: blackLight,
    );
  }
}
