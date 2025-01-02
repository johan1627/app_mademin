import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompPaymentTotalCard extends StatelessWidget {
  final int invoiceAmount;
  final int feeAmount;
  final int transferAmount;
  final bool isVisible;

  const CompPaymentTotalCard({
    super.key,
    required this.invoiceAmount,
    required this.feeAmount,
    required this.transferAmount,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    // import
    GeneralFunction function = GeneralFunction();

    return Visibility(
      visible: isVisible,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
            color: whiteFlat,
            border: Border.all(color: greyColor),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Detail Total Transfer",
                textAlign: TextAlign.center,
                style: h4.copyWith(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Jumlah tagihan",
                    style: lableFont.copyWith(
                      color: blackFlat,
                    ),
                  ),
                  Text(
                    "IDR. ${function.formatRupiah(invoiceAmount.toString())}",
                    style: lableFont.copyWith(
                      color: blackFlat,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biaya layanan",
                    style: lableFont.copyWith(
                      color: blackFlat,
                    ),
                  ),
                  Text(
                    "IDR. ${function.formatRupiah(feeAmount.toString())}",
                    style: lableFont.copyWith(
                      color: blackFlat,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total transfer",
                    style: lableFont.copyWith(
                      fontWeight: FontWeight.w600,
                      color: blackFlat,
                    ),
                  ),
                  Text(
                    "IDR. ${function.formatRupiah(transferAmount.toString())}",
                    style: lableFont.copyWith(
                      fontWeight: FontWeight.w600,
                      color: blackFlat,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
