import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/empty-08.png',
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Oopps.. terdapat kendala aplikasi,\ncoba beberapa saat lagi',
                  style: lableFont.copyWith(color: blackFlat),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                ButtonWide(
                  isEnabled: true,
                  isLoading: false,
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
