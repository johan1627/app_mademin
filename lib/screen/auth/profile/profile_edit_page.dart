import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/atoms/gen_textfield.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/gencreate.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/profile/profile_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileEdit extends StatefulWidget {
  final Authmo authmo;

  const ProfileEdit({
    super.key,
    required this.authmo,
  });

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  // initial
  bool isLoading = false;
  bool isEnabledSaved = false;
  bool isVisibleHandphoneMsgErr = false;
  final _conName = TextEditingController();
  final _conHandphone = TextEditingController();

  // import class function
  GeneralFunction function = GeneralFunction();

  void initial() {
    setState(() {
      _conName.text = widget.authmo.name!;
      _conHandphone.text = widget.authmo.peoplemo!.handphone!;
    });
  }

  bool isValidName() {
    if (_conName.text != "") {
      return true;
    } else {
      return false;
    }
  }

  bool isValidHandphone() {
    if (_conHandphone.text != "") {
      var valid = function.isValidateMobileNumber(_conHandphone.text);
      if (valid) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  void isEnableBtn() {
    bool validName = isValidName();
    bool validHandphone = isValidHandphone();

    if (validName && validHandphone) {
      // button, error message
      setState(() {
        isEnabledSaved = true;
        isVisibleHandphoneMsgErr = false;
      });
    } else {
      // button
      setState(() {
        isEnabledSaved = false;
      });

      // error message
      // valid Handphone
      if (validHandphone == false) {
        if (_conHandphone.text.length > 2) {
          setState(() {
            isVisibleHandphoneMsgErr = true;
          });
        } else {
          setState(() {
            isVisibleHandphoneMsgErr = false;
          });
        }
      } else {
        setState(() {
          isVisibleHandphoneMsgErr = false;
        });
      }
    }
  }

  void onSubmit() async {
    setState(() {
      isLoading = true;
    });

    var name = _conName.text.toString();
    var handphone = _conHandphone.text.toString();

    var res = await Provider.of<AuthProvider>(context, listen: false)
        .update(widget.authmo.uuid!, name, handphone);

    if (res.statusCode == "200") {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProfileRoot(),
        ));

        function.snackBar(context, "Berhasil tersimpan", 4);
      }
    } else {
      var message = res.message;
      Get.snackbar("Authentification", message,
          backgroundColor: redColor,
          colorText: whiteFlat,
          margin: const EdgeInsets.only(top: 4.0));
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<bool> _back() async {
    Navigator.of(context).pop();
    return true;
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralCreatePages(
      title: "Kelola Akun",
      subtitle: "Ubah data akun",
      onBack: _back,
      body: ListView(
        children: [
          TextFieldCustom(
            lable: "Nama Anda",
            hintText: "Senna Aisyah",
            controller: _conName,
            keyboardType: TextInputType.text,
            length: 100,
            isPassword: false,
            onChanged: (value) {
              isEnableBtn();
            },
          ),
          TextFieldCustom(
            lable: "Nomor HP",
            hintText: "081234567890",
            controller: _conHandphone,
            keyboardType: TextInputType.phone,
            length: 12, // valid is length 12
            isPassword: false,
            onChanged: (value) {
              isEnableBtn();
            },
          ),
          Visibility(
            visible: isVisibleHandphoneMsgErr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Format Nomor HP belum benar",
                style: footFont.copyWith(color: redColor),
              ),
            ),
          ),
        ],
      ),
      onSaved: () {
        onSubmit();
      },
      isEnableBtn: isEnabledSaved,
      isLoading: isLoading,
      btnIcon: Icons.verified_user_outlined,
      btnLable: "Simpan",
    );
  }
}
