import 'package:flutter/material.dart';
import 'package:my_portfolio/Header/custom_drawer.dart';
import 'package:my_portfolio/Header/custom_text.dart';

class Portfolio extends StatelessWidget {
  Portfolio({Key? key}) : super(key: key);

  final sKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );

    return Scaffold(
      key: sKey,
      body: buildView(context, style),
      drawer: MediaQuery.of(context).size.width > 600
          ? Container()
          : CustomDrawer(),
    );
  }

  Widget buildView(BuildContext context, TextStyle style) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff00172D),
            Color(0xff00264D),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MediaQuery.of(context).size.width > 600
              ? buildHeaderTablet(context, style)
              : buildHeaderMobile(context, style),
        ],
      ),
    );
  }

  Widget buildHeaderMobile(BuildContext context, TextStyle style) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {
            if (sKey.currentState!.isDrawerOpen) {
              sKey.currentState!.openEndDrawer();
            } else {
              sKey.currentState!.openDrawer();
            }
          },
          icon: Icon(
            Icons.more_vert_outlined,
            color: Color(0xffffffff),
          )),
    );
  }

  Widget buildHeaderTablet(BuildContext context, TextStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.dark_mode_rounded,
          size: 50,
          color: Color(0xffffffff),
        ),
        Spacer(),
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              CustomText(string: "Home", style: style),
              CustomText(string: "About Me", style: style),
              CustomText(string: "Projects", style: style),
              CustomText(string: "Contact", style: style),
              CustomText(string: "Newsletter", style: style),
            ],
          ),
        ),
      ],
    );
  }
}
