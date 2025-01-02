import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompInvoiceMethodPayment extends StatelessWidget {
  const CompInvoiceMethodPayment({super.key});

  @override
  Widget build(BuildContext context) {
    //
    bool? selectedPaymentMethod;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          // title
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Metode Pembayaran",
                  style: h4.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("Lihat Semua",
                    style: footFont.copyWith(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    )),
              ],
            ),
          ),
          //
          Container(
              decoration: BoxDecoration(
                color: whiteFlat,
                border: Border.all(color: greyColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("OVO",
                        style: h3.copyWith(fontWeight: FontWeight.w600)),
                    Radio<bool>(
                        value: true,
                        groupValue: selectedPaymentMethod,
                        onChanged: (e) {
                          //
                        }),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
