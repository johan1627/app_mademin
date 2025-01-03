import 'package:app_mademin/components/atoms/gen_badge_filter.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/search_empty.dart';
import 'package:app_mademin/providers/trinvoice_provider.dart';
import 'package:app_mademin/screen/transaction/invoice/home/comp_invoice_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceListBuilder extends StatefulWidget {
  const InvoiceListBuilder({super.key});

  @override
  State<InvoiceListBuilder> createState() => _InvoiceListBuilderState();
}

class _InvoiceListBuilderState extends State<InvoiceListBuilder> {
  // initial
  List<dynamic> itemInvoiceDatas = [];
  List<String> badgeItemString = [
    "Belum bayar",
    "Gagal",
    "Lunas",
  ];
  List<Widget> badgeItem = [];

  // filter for body
  int _currentPage = 1;
  int intStatus = 0;

  //
  final ScrollController _scrollController = ScrollController();
  bool hasMore = true;
  bool isLoading = false;

  Future<void> onFetchInvoiceDatas() async {
    if (isLoading) return;
    isLoading = true;

    var res = await Provider.of<TrInvoiceProvider>(context, listen: false)
        .fetchByAuth([intStatus], _currentPage);

    if (res.statusCode == "200") {
      setState(() {
        itemInvoiceDatas.addAll(res.value!);
      });

      var check = itemInvoiceDatas.length - (_currentPage * 10);

      if (check <= 0) {
        setState(() {
          hasMore = false;
        });
      } else {
        setState(() {
          hasMore = true;
        });
      }
    }

    isLoading = false;
  }

  void controllerr() {
    // ScrollController
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //
        setState(() {
          _currentPage = _currentPage + 1;
        });
        onFetchInvoiceDatas();
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        //
        setState(() {
          _currentPage = _currentPage - 1;
        });
        onFetchInvoiceDatas();
      }
    });
  }

  Future onRefresh() async {
    setState(() {
      isLoading = false;
      _currentPage = 1;
      itemInvoiceDatas.clear();
    });

    onFetchInvoiceDatas();
  }

  Future<void> onFetchBadge() async {
    for (var i = 0; i < badgeItemString.length; i++) {
      badgeItem.add(
        Consumer<TrInvoiceProvider>(
          builder: (context, trans, _) => GenBadgeFilter(
            onTap: () {
              // save to state
              trans.filtering = badgeItemString[i];

              // function selected
              filtered(badgeItemString[i]);

              //
              onRefresh();
            },
            lable: badgeItemString[i],
            selected: trans.filtering,
          ),
        ),
      );
    }
  }

  void filtered(String value) {
    int status = 0; // Belum bayar
    if (value == "Belum bayar") {
      status = 0;
    } else if (value == "Lunas") {
      status = 1;
    } else if (value == "Gagal") {
      status = 4;
    } else {
      status = 0;
    }

    setState(() {
      intStatus = status;
    });
  }

  @override
  void initState() {
    super.initState();
    onFetchInvoiceDatas();
    onFetchBadge();
    controllerr();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Badge
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                children: badgeItem,
              ),
            ),
          ),
        ),

        // List Menu
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: itemInvoiceDatas.length + 1,
                itemBuilder: (BuildContext context, int i) {
                  if (i == itemInvoiceDatas.length) {
                    if (isLoading) {
                      if (itemInvoiceDatas.isEmpty) {
                        return const CompSearchEmpty();
                      } else if (hasMore) {
                        return const CupertinoActivityIndicator();
                      } else {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: Text(
                            "No more data",
                            style: footFont,
                          ),
                        ));
                      }
                    } else {
                      if (hasMore) {
                        return const CupertinoActivityIndicator();
                      } else {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: Text(
                            "No more data",
                            style: footFont,
                          ),
                        ));
                      }
                    }
                  } else {
                    return CompInvoiceCard(
                      trInvoicemo: itemInvoiceDatas[i],
                    );
                  }
                }),
          ),
        ),
      ],
    );
  }
}
