import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class GenBadgeFilter extends StatelessWidget {
  final String lable;
  final Null Function() onTap;
  final String selected;

  const GenBadgeFilter({
    super.key,
    required this.lable,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: lable == selected ? primaryColor : Colors.transparent,
          ),
          color: lable == selected
              ? primaryColor.withOpacity(0.3)
              : Colors.transparent,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: Text(
          lable,
          style: footFont.copyWith(
            color: lable == selected ? blackFlat : greyDarkColor,
            fontWeight: lable == selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
