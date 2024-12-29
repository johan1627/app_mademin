import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/assets-06.png',
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Oopps.. terdapat kesalahan aplikasi,\nBantu kami menelusuri ...',
                  style: lableFont.copyWith(color: blackFlat),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                ButtonWide(
                  isLoading: false,
                  isEnabled: true,
                  type: "primary",
                  lable: "Kembali nanti",
                  onSaved: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
