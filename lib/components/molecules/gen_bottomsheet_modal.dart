import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/models/payment_method_model.dart';
import 'package:flutter/material.dart';

class BottomSheetModalFunction {
  // for payment
  void showForPaymentMethod(
    BuildContext context,
    List<PaymentMethodmo> items,
    List<Widget> channelCodeList,
  ) async {
    // Show the bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${items[i].paymentMethod}",
                      style: h4.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      children: channelCodeList,
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
  // end for payment
}
