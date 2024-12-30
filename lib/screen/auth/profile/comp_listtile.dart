import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Null Function() onTap;
  final bool visible;

  const CompListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.visible = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        color: whiteFlat.withOpacity(0.1),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: primaryColor,
                  ),
                  title: Text(title, style: lableFont),
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
