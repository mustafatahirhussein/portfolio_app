import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  int? _index;
  int get index => _index!;

  dynamic newIndex(int newIndex) {
    _index = newIndex;
    update();
  }

  ///Scroll Controller
  ScrollController? _controller;
  ScrollController get controller => _controller!;

  dynamic scrollTo(double newIndex) {
    _controller!.jumpTo(newIndex);
    update();
  }

  @override
  onInit() {
    super.onInit();
    _index = 0;
    _controller = ScrollController();

    _controller!.addListener(() => listenScrolling());
  }

  listenScrolling() {
    if(_controller!.position.atEdge){
      final pixels = _controller!.position.pixels == 0;

      if(pixels){
        print("reached start");
      }
      else {
        print("reached end");
      }
    }
  }
}
