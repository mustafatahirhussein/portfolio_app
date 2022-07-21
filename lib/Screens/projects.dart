import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/portfolio_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(
      fontSize: 18,
      color: Color(0xffffffff),
    );

    // return CarouselSlider(
    //     items: [1, 2, 3, 4, 5].map((i) {
    //       return Builder(
    //         builder: (BuildContext context) {
    //           return Container(
    //               width: MediaQuery.of(context).size.width,
    //               margin: const EdgeInsets.symmetric(horizontal: 5.0),
    //               decoration: const BoxDecoration(
    //                   color: Colors.amber
    //               ),
    //               child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
    //           );
    //           },
    //       );
    //     }).toList(),
    //     options: CarouselOptions(
    //       height: 200,
    //       aspectRatio: 16 / 9,
    //       viewportFraction: 0.8,
    //       initialPage: 0,
    //       enableInfiniteScroll: true,
    //       reverse: true,
    //       autoPlay: false,
    //       autoPlayInterval: const Duration(seconds: 3),
    //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //       autoPlayCurve: Curves.fastOutSlowIn,
    //       enlargeCenterPage: true,
    //       onPageChanged: (v, a) {},
    //       scrollDirection: Axis.horizontal,
    //     ));

    return GetBuilder<PortfolioController>(
      builder: (c) => ListView(
        controller: c.controller,
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("My Projects", style: style),
          ),
          CarouselSlider.builder(
            itemCount: 8,
            itemBuilder: (context, _, index) {
              return buildView(context);
            },
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (val, _) => c.newIndex(val),
            ),
          ),
          buildIndicator(context, c),
        ],
      ),
    );
  }

  Widget buildView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
          image: NetworkImage(
              "https://cdn.99images.com/photos/wallpapers/nature-landscapes/big-beautiful-nature%20android-iphone-desktop-hd-backgrounds-wallpapers-1080p-4k-onvhg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIndicator(BuildContext context, PortfolioController c) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedSmoothIndicator(
        count: 8,
        activeIndex: c.index,
        effect: WormEffect(),
      ),
    );
  }
}
