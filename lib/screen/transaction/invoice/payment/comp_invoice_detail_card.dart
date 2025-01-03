import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:flutter/material.dart';

class CompInvoiceDetailCard extends StatelessWidget {
  final TrInvoicemo trInvoicemo;

  const CompInvoiceDetailCard({
    super.key,
    required this.trInvoicemo,
  });

  @override
  Widget build(BuildContext context) {
    // import
    GeneralFunction function = GeneralFunction();

    var dueAt = function.dateformat4(trInvoicemo.dueAt!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Text(
            "Informasi",
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
                        Text("Tgl. jatuh tempo :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(dueAt,
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
                        Text("No. Tagihan :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      function.copyToClipboard(
                                          trInvoicemo.invNumber!, context);
                                    },
                                    child: const Icon(Icons.copy, size: 14.0)),
                                const SizedBox(width: 4.0),
                                Text(trInvoicemo.invNumber!,
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
                        Text("Perumahan :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(trInvoicemo.housemo!.tenantmo!.name!,
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end))
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rumah :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(trInvoicemo.housemo!.houseAddress!,
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end))
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tagihan :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                                trInvoicemo.paymentGroupmo!.description!,
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end))
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Catatan :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(trInvoicemo.paymentDescription!,
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end))
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nominal :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                                "IDR. ${function.formatRupiah(trInvoicemo.ramount.toString())}",
                                style: lableFont,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end))
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status :", style: footFont),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(trInvoicemo.statusmo!.name!,
                                style: lableFont.copyWith(
                                  color: trInvoicemo.statusColor,
                                  fontWeight: FontWeight.w600,
                                ),
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
