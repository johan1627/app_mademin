import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompInvoiceEmpty extends StatelessWidget {
  const CompInvoiceEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/img/temu-04.png',
          scale: 1.5,
        ),
        // const SizedBox(height: 10.0),
        Text(
          'Tagihan Lunas',
          style: h2.copyWith(
            color: blackFlat,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Terima kasih telah membayar tepat waktu',
          style: h4.copyWith(color: blackFlat),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
