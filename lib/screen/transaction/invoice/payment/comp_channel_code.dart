import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompChannelCode extends StatelessWidget {
  final String channelCode;
  final String channelCodeUrl;

  const CompChannelCode({
    super.key,
    required this.channelCode,
    required this.channelCodeUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: whiteFlat,
          border: Border.all(color: greyColor),
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
                border: Border.all(color: Colors.transparent),
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
