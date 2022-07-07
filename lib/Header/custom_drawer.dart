import 'package:flutter/material.dart';
import 'package:my_portfolio/Header/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomText(string: "Home", style: style),
            CustomText(string: "About Me", style: style),
            CustomText(string: "Projects", style: style),
            CustomText(string: "Contact", style: style),
            CustomText(string: "Newsletter", style: style),
          ],
        ),
      ),
    );
  }
}
