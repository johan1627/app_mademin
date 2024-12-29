import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class ForceUpdatePage extends StatelessWidget {
  const ForceUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    // import class function
    GeneralFunction function = GeneralFunction();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/assets-03.png',
                  scale: 2.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Demi kenyamanan bertransaksi,\nUPDATE segera versi apps kamu.',
                  style: lableFont.copyWith(color: blackFlat),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                ButtonWide(
                  isLoading: false,
                  isEnabled: true,
                  type: "primary",
                  lable: "Update Sekarang",
                  onSaved: () {
                    // https://play.google.com/store/apps/details?id=com.app.mkasir
                    function.getLaunchUrl("play.google.com",
                        "/store/apps/details?id=com.app.mkasir");
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
