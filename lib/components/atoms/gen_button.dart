import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class ButtonWide extends StatelessWidget {
  final String lable;
  final Null Function() onSaved;
  final bool isEnabled;
  final String
      type; // primary | danger | danger outline | primary outline || third
  final bool isLoading;
  final IconData? iconData;

  const ButtonWide({
    super.key,
    required this.lable,
    required this.onSaved,
    required this.isEnabled,
    required this.isLoading,
    required this.type,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    //
    Color colorBG;
    Color colorLine;
    Color colorText;

    if (type == "primary") {
      colorLine = Colors.transparent;
      colorText = Colors.white;
      if (isEnabled) {
        colorBG = secondaryColor;
      } else {
        colorBG = greyColor;
      }
    } else if (type == "danger") {
      colorLine = Colors.transparent;
      colorText = Colors.white;
      if (isEnabled) {
        colorBG = redColor;
      } else {
        colorBG = greyColor;
      }
    } else if (type == "danger outline") {
      if (isEnabled) {
        colorBG = accentColor;
        colorLine = redColor;
        colorText = redColor;
      } else {
        colorBG = accentColor;
        colorLine = greyColor;
        colorText = greyColor;
      }
    } else if (type == "primary outline") {
      if (isEnabled) {
        colorBG = whiteFlat;
        colorLine = secondaryColor;
        colorText = secondaryColor;
      } else {
        colorBG = whiteFlat;
        colorLine = greyColor;
        colorText = greyColor;
      }
    } else if (type == "third") {
      colorLine = Colors.transparent;
      colorText = Colors.white;
      if (isEnabled) {
        colorBG = orangeDeep;
      } else {
        colorBG = greyColor;
      }
    } else {
      colorBG = secondaryColor;
      colorLine = Colors.transparent;
      colorText = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(colorBG),
          overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
          side: MaterialStateProperty.all(
            BorderSide(
              color: colorLine,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
        ),
        child: isLoading
            ? const SizedBox(
                height: 18.0,
                width: 18.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: whiteFlat,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconData == null
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            iconData,
                            color: colorText,
                            size: 18.0,
                          ),
                        ),
                  Text(
                    lable,
                    style: lableFont.copyWith(
                      color: colorText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        onPressed: () {
          if (isEnabled) {
            onSaved();
          }
        },
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String lable;
  final Null Function() onTap;
  final Color color;

  const ButtonText({
    super.key,
    required this.lable,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          lable,
          style: footFont.copyWith(
            decoration: TextDecoration.underline,
            color: color,
          ),
        ),
      ),
    );
  }
}
