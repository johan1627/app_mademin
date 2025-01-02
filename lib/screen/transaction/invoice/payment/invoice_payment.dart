import 'package:app_mademin/components/molecules/gencreate.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:app_mademin/providers/trtransaction_provider.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_invoice_detail_card.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_invoice_method_payment.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_payment_total_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoicePaymentPage extends StatefulWidget {
  final TrInvoicemo trInvoicemo;

  const InvoicePaymentPage({
    super.key,
    required this.trInvoicemo,
  });

  @override
  State<InvoicePaymentPage> createState() => _InvoicePaymentPageState();
}

class _InvoicePaymentPageState extends State<InvoicePaymentPage> {
  Future<bool> _back() async {
    // clear state
    TrTransactionProvider trTransactionProvider =
        Provider.of<TrTransactionProvider>(context, listen: false);

    trTransactionProvider.channelCode = "";
    trTransactionProvider.channelCodeImgPath = "";

    //
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrTransactionProvider>(
      builder: (context, value, _) => GeneralCreatePages(
        title: "Pembayaran",
        subtitle: "Selesaikan pembayaran tagihan Anda",
        onBack: _back,
        body: Column(
          children: [
            CompInvoiceDetailCard(trInvoicemo: widget.trInvoicemo),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CompInvoiceMethodPayment(),
                  CompPaymentTotalCard(
                    isVisible: value.channelCode == "" ? false : true,
                    invoiceAmount: widget.trInvoicemo.ramount!,
                    feeAmount: 0,
                    transferAmount: widget.trInvoicemo.ramount!,
                  ),
                ],
              ),
            ),
          ],
        ),
        onSaved: () {
          // onSubmit();
        },
        isEnableBtn: value.channelCode == "" ? false : true,
        isLoading: false,
        btnType: "third",
        btnIcon: Icons.verified_user_outlined,
        btnLable: "Bayar Sekarang",
      ),
    );
  }
}
