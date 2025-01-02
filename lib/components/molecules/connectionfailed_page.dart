import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectionFailedPage extends StatelessWidget {
  const ConnectionFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: accentColor,
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/empty-10.png',
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Oopps.. kendala jaringan internet,\nperiksa koneksi internet kamu',
                  style: lableFont.copyWith(color: blackFlat),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                ButtonWide(
                  isLoading: false,
                  isEnabled: true,
                  type: "primary",
                  lable: "Coba nanti",
                  onSaved: () {
                    SystemNavigator.pop();
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
