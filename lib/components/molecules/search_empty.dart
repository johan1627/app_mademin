import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompSearchEmpty extends StatelessWidget {
  const CompSearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        const Icon(
          Icons.sentiment_dissatisfied_outlined,
          size: 56.0,
          color: greyColor,
        ),
        const SizedBox(height: 10.0),
        Text(
          "... Data tidak ditemukan ...",
          style: lableFont.copyWith(
            color: greyDarkColor,
          ),
        ),
      ],
    );
  }
}
