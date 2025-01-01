import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/shimmer/comp_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerInvoiceCard extends StatelessWidget {
  const ShimmerInvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: whiteFlat,
        border: Border.all(color: greyColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CompShimmer(width: 80.0),
                CompShimmer(width: 200.0),
                CompShimmer(width: 110.0),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                CompShimmer(width: 80.0),
                SizedBox(height: 4.0),
                CompShimmer(width: 60.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
