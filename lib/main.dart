import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/Resources/portfolio_theme.dart';
import 'package:my_portfolio/Screens/portfolio.dart';
import 'package:my_portfolio/controller/bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: true,
      theme: PortfolioTheme.portfolioTheme(),
      home: Portfolio(),
    );
  }
}
