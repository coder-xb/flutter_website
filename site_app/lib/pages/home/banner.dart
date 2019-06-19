import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  final List<String> banner = <String>[
    'assets/images/banners/1.jpeg',
    'assets/images/banners/2.jpeg',
    'assets/images/banners/3.jpeg',
    'assets/images/banners/4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width * 540 / 1080,
      child: Swiper(
        itemCount: banner.length,
        itemBuilder: (BuildContext context, int index) => Image.asset(
              banner[index],
              width: width,
              height: width * 540 / 1080,
              fit: BoxFit.cover,
            ),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        autoplayDelay: 3000,
      ),
    );
  }
}
