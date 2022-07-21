import 'package:get/get.dart';
import 'package:my_portfolio/controller/portfolio_controller.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PortfolioController>(() => PortfolioController());
  }

}