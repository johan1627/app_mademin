import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/gen_bottomsheet_modal.dart';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/models/payment_method_model.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:app_mademin/providers/payment_method_provider.dart';
import 'package:app_mademin/providers/trtransaction_provider.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_channel_code_empty_card.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_channel_code_option_card.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_channel_code_witharrow_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompInvoiceMethodPayment extends StatefulWidget {
  final TrInvoicemo trInvoicemo;

  const CompInvoiceMethodPayment({
    super.key,
    required this.trInvoicemo,
  });

  @override
  State<CompInvoiceMethodPayment> createState() =>
      _CompInvoiceMethodPaymentState();
}

class _CompInvoiceMethodPaymentState extends State<CompInvoiceMethodPayment> {
  // initial
  bool? selectedPaymentMethod;
  List<PaymentMethodmo>? items;
  List<Widget> itemsChannelCode = [];

  // import
  BottomSheetModalFunction bottomSheetModalFunction =
      BottomSheetModalFunction();

  void fetchData() async {
    var tenantId = widget.trInvoicemo.housemo!.tenantmo!.uuid!;

    var res = await Provider.of<PaymentMethodProvider>(context, listen: false)
        .optionPaymentMethod(tenantId);

    if (res.statusCode == "200") {
      // paymentMethods
      var paymentMethods = res.value!;
      for (var e = 0; e < paymentMethods.length; e++) {
        // channelCodes
        var channelCodes = paymentMethods[e].channelCode!;
        for (var i = 0; i < channelCodes.length; i++) {
          itemsChannelCode.add(
            Consumer<TrTransactionProvider>(
              builder: (context, value, child) => InkWell(
                onTap: () {
                  value.channelCode = channelCodes[i].channelCode.toString();
                  value.channelCodeImgPath =
                      "$domain${channelCodes[i].channelCodeImgPath}";

                  // print("${channelCodes[i].id}");
                  // print("${channelCodes[i].paymentProvider}");
                  // print("${channelCodes[i].paymentType}");
                  // print("${channelCodes[i].channelCodeImgPath}");
                  Navigator.of(context).pop();
                },
                child: CompChannelCodeOptionCard(
                    channelCode: "${channelCodes[i].channelCode}",
                    channelCodeUrl:
                        "$domain${channelCodes[i].channelCodeImgPath}",
                    isSelected: channelCodes[i].channelCode == value.channelCode
                        ? true
                        : false),
              ),
            ),
          );
        }
      }

      setState(() {
        items = res.value;
      });
    } else {
      setState(() {
        items = [];
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          // title
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Metode Pembayaran",
                  style: lableFont.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    bottomSheetModalFunction.showForPaymentMethod(
                      context,
                      items!,
                      itemsChannelCode,
                    );
                  },
                  child: Text("Lihat Semua",
                      style: footFont.copyWith(
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      )),
                ),
              ],
            ),
          ),
          //
          Consumer<TrTransactionProvider>(
            builder: (context, value, _) => value.channelCode == ""
                ? InkWell(
                    onTap: () {
                      bottomSheetModalFunction.showForPaymentMethod(
                        context,
                        items!,
                        itemsChannelCode,
                      );
                    },
                    child: const CompChannelCodeEmptyCard(),
                  )
                : InkWell(
                    onTap: () {
                      bottomSheetModalFunction.showForPaymentMethod(
                        context,
                        items!,
                        itemsChannelCode,
                      );
                    },
                    child: CompChannelCodeWithArrowCard(
                      channelCode: value.channelCode,
                      channelCodeUrl: value.channelCodeImgPath,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
