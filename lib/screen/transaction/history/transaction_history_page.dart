import 'package:app_mademin/components/molecules/gen_read_page.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:app_mademin/screen/transaction/history/transaction_history_card_root.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_invoice_detail_card.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  final TrInvoicemo trInvoicemo;

  const TransactionHistoryPage({
    super.key,
    required this.trInvoicemo,
  });

  @override
  Widget build(BuildContext context) {
    Future<bool> back() async {
      Navigator.of(context).pop();
      return true;
    }

    return GeneralReadPages(
      title: "Transaksi",
      subtitle: "Rincian Pembayaran",
      dotmenu: const SizedBox(),
      body: Column(
        children: [
          CompInvoiceDetailCard(trInvoicemo: trInvoicemo),
          const SizedBox(height: 10.0),
          TransactionHistoryCardRoot(invoiceId: trInvoicemo.uuid!),
        ],
      ),
      onBack: back,
    );
  }
}
