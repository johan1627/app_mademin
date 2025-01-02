import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/shimmer/shimmer_invoice_card.dart';
import 'package:app_mademin/providers/trinvoice_provider.dart';
import 'package:app_mademin/screen/transaction/invoice/home/comp_invoice_card.dart';
import 'package:app_mademin/screen/transaction/invoice/home/comp_invoice_empty.dart';
import 'package:app_mademin/screen/transaction/invoice/home/invoice_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompSectionInvoiceLast extends StatefulWidget {
  const CompSectionInvoiceLast({super.key});

  @override
  State<CompSectionInvoiceLast> createState() => _CompSectionInvoiceLastState();
}

class _CompSectionInvoiceLastState extends State<CompSectionInvoiceLast> {
  // initial
  List<dynamic> itemInvoiceDatas = [];

  Future<void> onFetchInvoiceDatas() async {
    var res = await Provider.of<TrInvoiceProvider>(context, listen: false)
        .fetchByAuth([0], 1);

    if (res.statusCode == "200") {
      setState(() {
        itemInvoiceDatas.addAll(res.value!);
      });
    }
  }

  Future<List<dynamic>> items() async {
    var res = await Provider.of<TrInvoiceProvider>(context, listen: false)
        .fetchByAuth([0], 1);

    if (res.statusCode == "200") {
      return res.value!;
    } else {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    onFetchInvoiceDatas();
    items();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Tagihan",
                      style: footFont.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        // Go to
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const InvoiceHomePage(),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Lihat semua",
                          style: smallFont.copyWith(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // List
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => onFetchInvoiceDatas(),
                child: FutureBuilder<List<dynamic>>(
                  future: items(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: const [
                            ShimmerInvoiceCard(),
                            ShimmerInvoiceCard(),
                            ShimmerInvoiceCard(),
                          ],
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          //
                          return const CompInvoiceEmpty();
                        } else if (snapshot.data!.isNotEmpty) {
                          //
                          var dataa = snapshot.data!;

                          // lenght top 10 Latest Items
                          int length;
                          if (dataa.length <= 10) {
                            length = dataa.length;
                          } else if (dataa.length > 10) {
                            length = 10;
                          } else {
                            length = 0;
                          }

                          return ListView.builder(
                            itemCount: length,
                            itemBuilder: (context, i) {
                              return CompInvoiceCard(
                                trInvoicemo: dataa[i],
                              );
                            },
                          );
                        } else {
                          //
                          return const CompInvoiceEmpty();
                        }
                      } else {
                        return const CompInvoiceEmpty();
                      }
                    } else {
                      return const CompInvoiceEmpty();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
