import 'package:app_mademin/components/atoms/gen_shadow.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class GeneralReadPages extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final Future<bool> Function() onBack;
  final Widget dotmenu;

  const GeneralReadPages({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.onBack,
    required this.dotmenu,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onBack,
          child: Stack(
            children: <Widget>[
              // Background Color
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: bgColorLight,
                  tileMode:
                      TileMode.clamp, // repeats the gradient over the canvas
                )),
              ),
              // Background Color Circle
              Container(
                margin: const EdgeInsets.only(top: 80.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteFlat,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              // App Bar
              Container(
                height: 70.0,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white70,
                            size: 18.0,
                          ),
                          onPressed: onBack,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              style: h3.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  subtitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: lableFont.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    dotmenu,
                  ],
                ),
              ),
              // Body
              Padding(
                padding: const EdgeInsets.only(
                  top: 90.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: 4.0,
                ),
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenReadWithTwoWidgetPages extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final Future<bool> Function() onBack;
  final Widget bottomWidget1;
  final Widget bottomWidget2;
  final Widget dotmenu;

  const GenReadWithTwoWidgetPages({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.onBack,
    required this.bottomWidget1,
    required this.bottomWidget2,
    required this.dotmenu,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onBack,
          child: Stack(
            children: <Widget>[
              // Background Color
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Color(0xff3949AB), // from Color
                    Color(0xff5C6BC0),
                    Color(0xffC5CAE9), // to Color
                  ],
                  tileMode:
                      TileMode.clamp, // repeats the gradient over the canvas
                )),
              ),
              // Background Color Circle
              Container(
                margin: const EdgeInsets.only(top: 80.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteFlat,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              // App Bar
              Container(
                height: 70.0,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white70,
                            size: 18.0,
                          ),
                          onPressed: onBack,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              style: h3.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  subtitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: lableFont.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    dotmenu
                  ],
                ),
              ),
              // Body
              Container(
                margin: const EdgeInsets.only(
                  top: 90.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: 60.0,
                ),
                child: body,
              ),
              // Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteFlat,
                    boxShadow: customShadowUp,
                  ),
                  height: 60.0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: bottomWidget1,
                      ),
                      Expanded(
                        flex: 3,
                        child: bottomWidget2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenReadWithOneWidgetPages extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final Future<bool> Function() onBack;
  final Widget dotmenu;
  final Widget bottomNavigationBar;

  const GenReadWithOneWidgetPages({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.onBack,
    required this.dotmenu,
    required this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onBack,
          child: Stack(
            children: <Widget>[
              // Background Color
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: bgColorLight,
                  tileMode:
                      TileMode.clamp, // repeats the gradient over the canvas
                )),
              ),
              // Background Color Circle
              Container(
                margin: const EdgeInsets.only(top: 80.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteFlat,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              // App Bar
              Container(
                height: 70.0,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white70,
                            size: 18.0,
                          ),
                          onPressed: onBack,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              style: h3.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  subtitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: lableFont.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    dotmenu,
                  ],
                ),
              ),
              // Body
              Padding(
                padding: const EdgeInsets.only(
                  top: 90.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: 4.0,
                ),
                child: body,
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
