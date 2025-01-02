import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/invoice_payment.dart';
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

    var paymentAt = function.dateformat1(trInvoicemo.paymentAt!);
    var dueAt = function.dateformat5(trInvoicemo.dueAt!);

    Widget datee;
    if (trInvoicemo.statusmo!.id == 1) {
      datee = Row(
        children: [
          Text(
            "Tgl. Bayar: ",
            style: footFont,
          ),
          Text(
            paymentAt,
            style: footFont,
          ),
        ],
      );
    } else {
      datee = Row(
        children: [
          Text(
            "Jatuh tempo: ",
            style: footFont,
          ),
          Text(
            dueAt,
            style: footFont,
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      height: 110,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "${trInvoicemo.paymentGroupmo!.description}",
                    overflow: TextOverflow.ellipsis,
                    style: footFont.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "${trInvoicemo.paymentDescription}",
                    overflow: TextOverflow.ellipsis,
                    style: footFont,
                  ),
                ),
                datee,
                ButtonText(
                  lable: "Bayar Tagihan",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => InvoicePaymentPage(
                        trInvoicemo: trInvoicemo,
                      ),
                    ));
                  },
                  color: blackFlat,
                ),
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
