import 'package:app_mademin/components/molecules/gen_read_page.dart';
import 'package:app_mademin/screen/transaction/invoice/home/invoice_list.dart';
import 'package:flutter/material.dart';

class InvoiceHomePage extends StatefulWidget {
  const InvoiceHomePage({super.key});

  @override
  State<InvoiceHomePage> createState() => _InvoiceHomePageState();
}

class _InvoiceHomePageState extends State<InvoiceHomePage> {
  //
  List<dynamic> itemList = [];
  List<dynamic> filteredItemList = [];
  bool isEmptyCard = false;

  // function
  Future<bool> back() async {
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralReadPages(
      title: "Tagihan",
      subtitle: "Tagihan pembayaran",
      dotmenu: const SizedBox(),
      body: const InvoiceListBuilder(),
      onBack: back,
    );
  }
}
