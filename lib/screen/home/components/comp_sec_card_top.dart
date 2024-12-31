import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/screen/transaction/invoice/invoice_home.dart';
import 'package:flutter/material.dart';

class CompSectionCardTop extends StatefulWidget {
  const CompSectionCardTop({super.key});

  @override
  State<CompSectionCardTop> createState() => _CompSectionCardTopState();
}

class _CompSectionCardTopState extends State<CompSectionCardTop> {
  // import
  GeneralFunction function = GeneralFunction();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: blackFlat.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 14.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Pendapatan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pesanan masuk",
                      style: footFont.copyWith(color: whiteFlat),
                    ),
                    Text(
                      "IDR ${function.formatRupiah(15000.toString())}",
                      style: lableFont.copyWith(color: whiteFlat),
                    ),
                  ],
                ),
                // Transaksi
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Go to
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const InvoiceHomePage(),
                        ));
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.storefront_outlined,
                            color: whiteFlat,
                            size: 34.0,
                          ),
                          Text("Invoice",
                              style: footFont.copyWith(
                                color: whiteFlat,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14.0),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
