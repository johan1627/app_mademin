import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:flutter/material.dart';

class CompInvoiceCard extends StatelessWidget {
  final TrInvoicemo trInvoicemo;

  const CompInvoiceCard({
    super.key,
    required this.trInvoicemo,
  });

  @override
  Widget build(BuildContext context) {
    // import
    GeneralFunction function = GeneralFunction();

    var datetime = function.dateformat1(trInvoicemo.createdAt!);

    return Container(
      width: double.infinity,
      height: 80,
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
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: true,
                  child: Text(
                    "${trInvoicemo.paymentGroupmo!.description}",
                    style: footFont.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "INV ${trInvoicemo.invNumber}",
                  style: footFont,
                ),
                Text(
                  datetime,
                  style: footFont,
                ),
                // ButtonText(
                //   lable: "Lihat rincian",
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (BuildContext context) => HistoryDetailPage(
                //         transactionDatamo: transactionDatamo,
                //       ),
                //     ));
                //   },
                //   color: blackFlat,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "IDR. ${function.formatRupiah(trInvoicemo.ramount.toString())}",
                  style: lableFont.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${trInvoicemo.statusmo!.name}",
                  style: footFont.copyWith(
                    fontWeight: FontWeight.w500,
                    color: trInvoicemo.statusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
