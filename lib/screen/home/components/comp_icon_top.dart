import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompIconTop extends StatelessWidget {
  final IconData icon;
  final String lable;
  final Null Function() onTap;
  final int countNotification;

  const CompIconTop({
    super.key,
    required this.countNotification,
    required this.icon,
    required this.lable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Icon(
                icon,
                color: whiteFlat,
                size: 34.0,
              ),
              Text(lable,
                  style: footFont.copyWith(
                    color: whiteFlat,
                  )),
            ],
          ),
        ),
        // ballon notification
        Visibility(
          visible: countNotification == 0 ? false : true,
          child: Container(
              decoration: const BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Text(
                  countNotification.toString(),
                  style: footFont.copyWith(color: Colors.white),
                ),
              )),
        )
      ],
    );
  }
}
