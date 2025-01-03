import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class LoadingSimple extends StatelessWidget {
  final String lable;

  const LoadingSimple({
    Key? key,
    required this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteFlat,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: primaryColor,
              ),
              const SizedBox(height: 10.0),
              Text(lable, style: lableFont)
            ],
          ),
        ),
      ),
    );
  }
}
