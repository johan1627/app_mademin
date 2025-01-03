import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/models/trtransaction_model.dart';
import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatelessWidget {
  final TrTransactionmo trTransactionmo;

  const TransactionHistoryCard({
    super.key,
    required this.trTransactionmo,
  });

  @override
  Widget build(BuildContext context) {
    // import
    GeneralFunction function = GeneralFunction();

    var paymentAt = function.dateformat2(trTransactionmo.paymentAt!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Text(
            "Pembayaran",
            style: lableFont.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: greyColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tgl. bayar :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(paymentAt,
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end)),
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Metode Pembayaran :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(trTransactionmo.paymentTypemo!.name!,
                                    style: lableFont,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.end),
                              ],
                            ))
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Keterangan :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(trTransactionmo.paymentMethodmo!.name!,
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end))
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
