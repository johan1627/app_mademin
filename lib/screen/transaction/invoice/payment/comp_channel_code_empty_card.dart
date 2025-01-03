import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompChannelCodeEmptyCard extends StatelessWidget {
  const CompChannelCodeEmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: greyColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: greyColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bayar dengan",
                      style: h4.copyWith(
                        fontWeight: FontWeight.w600,
                        color: blackFlat,
                      ),
                    ),
                    Text(
                      "Pilih pembayaran",
                      style: footFont.copyWith(
                        color: redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: greyDarkColor,
            )
          ],
        ),
      ),
    );
  }
}
