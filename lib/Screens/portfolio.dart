import 'package:flutter/material.dart';
import 'package:my_portfolio/Footrer/footer.dart';
import 'package:my_portfolio/Header/custom_drawer.dart';
import 'package:my_portfolio/Header/custom_text.dart';
import 'package:my_portfolio/Screens/about_me.dart';
import 'package:my_portfolio/Screens/projects.dart';
import 'package:my_portfolio/Screens/work_history.dart';

class Portfolio extends StatelessWidget {
  Portfolio({Key? key}) : super(key: key);

  final sKey = GlobalKey<ScaffoldState>();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );

    return Scaffold(
      key: sKey,
      body: buildView(context, style),
      drawer: MediaQuery.of(context).size.width > 600
          ? Container()
          : const CustomDrawer(),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget buildView(BuildContext context, TextStyle style) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff00172D),
            Color(0xff00264D),
          ],
        ),
      ),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MediaQuery.of(context).size.width > 600
              ? buildHeaderWeb(context, style)
              : buildHeaderMobile(context, style),
        ],
      ),
    );
  }

  Widget buildHeaderMobile(BuildContext context, TextStyle style) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      controller: _controller,
      shrinkWrap: true,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              if (sKey.currentState!.isDrawerOpen) {
                sKey.currentState!.openEndDrawer();
              } else {
                sKey.currentState!.openDrawer();
              }
            },
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Color(0xffffffff),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const AboutMe(),
        const SizedBox(height: 50),
        const Projects(),
        const SizedBox(height: 100),

        const WorkHistory(),
      ],
    );
  }

  Widget buildHeaderWeb(BuildContext context, TextStyle style) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.dark_mode_rounded,
              size: 150,
              color: Color(0xffffffff),
            ),
            // Spacer(),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.end,
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
        ),


        const SizedBox(height: 20),
        const AboutMe(),
        const SizedBox(height: 50),
        const Projects(),
        const SizedBox(height: 50),

        const WorkHistory(),
      ],
    );
  }
}
