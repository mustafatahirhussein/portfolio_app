import 'package:flutter/material.dart';
import 'package:my_portfolio/Header/custom_text.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );

    return Scaffold(
      body: buildView(context,style),
    );
  }

  Widget buildView(BuildContext context,TextStyle style) {
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
          MediaQuery.of(context).size.width > 650 ? buildHeaderTablet(context,style) : buildHeaderMobile(context, style),
        ],
      ),
    );
  }

  Widget buildHeaderMobile(BuildContext context,TextStyle style) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomText(string: "Home", style: style),
        CustomText(string: "About Me", style: style),
        CustomText(string: "Projects", style: style),
        CustomText(string: "Contact", style: style),
        CustomText(string: "Newsletter", style: style),


      ],
    );
  }

  Widget buildHeaderTablet(BuildContext context,TextStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [

        Icon(Icons.ac_unit_outlined,size: 70,color: Color(0xffffffff),),
        Spacer(),

        CustomText(string: "Home", style: style),
        CustomText(string: "About Me", style: style),
        CustomText(string: "Projects", style: style),
        CustomText(string: "Contact", style: style),
        CustomText(string: "Newsletter", style: style),

      ],
    );
  }
}
