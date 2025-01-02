import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/models/payment_method_model.dart';
import 'package:app_mademin/providers/payment_method_provider.dart';
import 'package:app_mademin/providers/trtransaction_provider.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_channel_code.dart';
import 'package:app_mademin/screen/transaction/invoice/payment/comp_channel_code_empty_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompInvoiceMethodPayment extends StatefulWidget {
  const CompInvoiceMethodPayment({super.key});

  @override
  State<CompInvoiceMethodPayment> createState() =>
      _CompInvoiceMethodPaymentState();
}

class _CompInvoiceMethodPaymentState extends State<CompInvoiceMethodPayment> {
  // initial
  bool? selectedPaymentMethod;
  List<PaymentMethodmo>? items;
  List<Widget> itemsChannelCode = [];

  void fetchData() async {
    var res = await Provider.of<PaymentMethodProvider>(context, listen: false)
        .optionPaymentMethod("PKZKWZ5HUFUOMLG7QJ3BSYX7OTCANWZZ");

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
                child: CompChannelCode(
                  channelCode: "${channelCodes[i].channelCode}",
                  channelCodeUrl:
                      "$domain${channelCodes[i].channelCodeImgPath}",
                ),
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
                  style: h4.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showBottomSheetWithData(context);
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
                      showBottomSheetWithData(context);
                    },
                    child: const CompChannelCodeEmptyCard(),
                  )
                : CompChannelCode(
                    channelCode: value.channelCode,
                    channelCodeUrl: value.channelCodeImgPath,
                  ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetWithData(BuildContext context) async {
    // Show the bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${items![i].paymentMethod}",
                      style: h4.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Text("${itemsChannelCode.length}"),
                    Column(
                      children: itemsChannelCode,
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
