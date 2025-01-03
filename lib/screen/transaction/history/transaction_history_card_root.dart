import 'package:app_mademin/components/molecules/shimmer/shimmer_invoice_card.dart';
import 'package:app_mademin/models/trtransaction_model.dart';
import 'package:app_mademin/providers/trtransaction_provider.dart';
import 'package:app_mademin/screen/transaction/history/transaction_history_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionHistoryCardRoot extends StatefulWidget {
  final String invoiceId;

  const TransactionHistoryCardRoot({
    super.key,
    required this.invoiceId,
  });

  @override
  State<TransactionHistoryCardRoot> createState() =>
      _TransactionHistoryCardRootState();
}

class _TransactionHistoryCardRootState
    extends State<TransactionHistoryCardRoot> {
  // initial
  bool isLoading = false;
  bool isError = false;
  TrTransactionmo? transactionmo;

  void fetch() async {
    //
    setState(() {
      isLoading = true;
    });

    var res = await Provider.of<TrTransactionProvider>(context, listen: false)
        .fetchByInvoiceId(widget.invoiceId);

    if (res.statusCode == "200") {
      setState(() {
        transactionmo = res.value;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (isLoading) {
      page = const ShimmerInvoiceCard();
    } else {
      page = TransactionHistoryCard(trTransactionmo: transactionmo!);
    }

    return page;
  }
}
