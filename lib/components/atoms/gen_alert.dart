import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class AlertdialogDuaAction extends StatelessWidget {
  final String title;
  final String content;
  final Null Function() actionsatuOnTap;
  final Null Function() actionduaOnTap;

  const AlertdialogDuaAction(
      {Key? key,
      required this.title,
      required this.content,
      required this.actionsatuOnTap,
      required this.actionduaOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          style: h4.copyWith(color: blackFlat, fontWeight: FontWeight.w600)),
      content: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: content,
                style: lableFont.copyWith(
                  height: 1.4,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: actionsatuOnTap,
          child: Text('Batal', style: h4.copyWith(color: redColor)),
        ),
        TextButton(
          onPressed: actionduaOnTap,
          child: Text('OK', style: h4.copyWith(color: blackFlat)),
        ),
      ],
    );
  }
}

class AlertInfo extends StatelessWidget {
  final bool isVisible;
  final String title;
  final String content;
  final String type; // warning, info

  const AlertInfo(
      {super.key,
      required this.isVisible,
      required this.title,
      required this.content,
      required this.type});

  @override
  Widget build(BuildContext context) {
    Color bgColors;
    Color borderColor;
    Color textColor;
    IconData iconData;
    if (type == "warning") {
      bgColors = const Color(0xFFfff3cd);
      borderColor = const Color(0xFFffecb5);
      textColor = const Color(0xFF664d03);
      iconData = Icons.warning_amber_outlined;
    } else if (type == "info") {
      bgColors = const Color(0xFFcff4fc);
      borderColor = const Color(0xFFb6effb);
      textColor = const Color(0xFF055160);
      iconData = Icons.info_outline;
    } else {
      bgColors = const Color(0xFFcff4fc);
      borderColor = const Color(0xFFb6effb);
      textColor = const Color(0xFF055160);
      iconData = Icons.info_outline;
    }

    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
                color: bgColors,
                border: Border.all(color: borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    iconData,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: footFont.copyWith(color: textColor),
                      ),
                      Text(
                        content,
                        style: footFont.copyWith(color: textColor),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
