import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompChannelCodeOptionCard extends StatelessWidget {
  final String channelCode;
  final String channelCodeUrl;
  final bool isSelected;

  const CompChannelCodeOptionCard({
    super.key,
    required this.channelCode,
    required this.channelCodeUrl,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    // initial
    Color color;
    double width;
    if (isSelected) {
      color = primaryColor;
      width = 2.0;
    } else {
      color = greyColor;
      width = 1.0;
    }

    //
    return Container(
      height: 90.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color, width: width), // greyColor, 2.0
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: greyLightColor,
                border:
                    Border.all(color: Colors.transparent), // Colors.transparent
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              width: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  channelCodeUrl, // "$domain${channelCodes[i].channelCodeImgPath}"
                  scale: 3.0,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              channelCode, // "${channelCodes[i].channelCode}"
              style: h4.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
