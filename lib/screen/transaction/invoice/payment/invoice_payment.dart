import 'package:app_mademin/components/molecules/gencreate.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_invoice_detail_card.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_invoice_method_payment.dart';
import 'package:flutter/material.dart';

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
  //
  Future<bool> _back() async {
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralCreatePages(
      title: "Pembayaran",
      subtitle: "Selesaikan pembayaran tagihan Anda",
      onBack: _back,
      body: ListView(
        children: [
          CompInvoiceDetailCard(trInvoicemo: widget.trInvoicemo),
          const CompInvoiceMethodPayment(),
        ],
      ),
      onSaved: () {
        // onSubmit();
      },
      isEnableBtn: true,
      isLoading: false,
      btnType: "third",
      btnIcon: Icons.verified_user_outlined,
      btnLable: "Bayar Sekarang",
    );
  }
}
