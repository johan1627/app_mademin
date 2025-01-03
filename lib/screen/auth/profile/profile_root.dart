import 'package:app_mademin/components/atoms/gen_loading_page.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/profile/profile_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileRoot extends StatefulWidget {
  const ProfileRoot({super.key});

  @override
  State<ProfileRoot> createState() => _ProfileRootState();
}

class _ProfileRootState extends State<ProfileRoot> {
  // initial
  bool isLoading = false;
  bool isError = false;
  Authmo? authmo;

  void init() async {
    setState(() {
      isLoading = true;
    });
    //
    var res =
        await Provider.of<AuthProvider>(context, listen: false).fetchAuth();

    if (res.statusCode == "200") {
      setState(() {
        authmo = res.value;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (isLoading) {
      page = const LoadingSimple(
        lable: "Memuat data...",
      );
    } else {
      page = ProfileHomePage(authmo: authmo!);
    }

    return page;
  }
}
