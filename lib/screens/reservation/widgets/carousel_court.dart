import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:court_reservation/shared/widgets/widgets.dart';

import '../../../core/constants/color.constant.dart';

class CarouselCourt extends StatelessWidget {
  final VoidCallback onFavorite;
  final bool isFavorite;

  const CarouselCourt({
    super.key,
    required this.carouselImagesPath,
    required this.onFavorite,
    required this.isFavorite,
  });

  final List<String> carouselImagesPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselImages(imagesPath: carouselImagesPath),
        Positioned(
            top: 30,
            left: 32,
            child: CustomButtonBack(onTap: () => Navigator.pop(context))),
        Positioned(
            top: 24,
            right: 22,
            child: GestureDetector(
              onTap: onFavorite,
              child: Icon(
                size: 30.0,
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: ColorConstant.whiteFC,
              ),
            )),
      ],
    );
  }
}

class CarouselImages extends StatefulWidget {
  final List<String> imagesPath;

  CarouselImages({Key? key, required this.imagesPath}) : super(key: key);

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  final CarouselSliderController controller = CarouselSliderController();
  double kPosition = 0.0;

  void handleChangeDotIndicator(double index) {
    controller.jumpToPage(index.toInt());
    kPosition = index;
    setState(() {});
  }

  void handlePageChange(int index, CarouselPageChangedReason reason) {
    kPosition = index.toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: 269.0,
            viewportFraction: 1.0,
            onPageChanged: handlePageChange,
          ),
          items: widget.imagesPath.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  'assets/images/${imagePath}.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  // opacity: const AlwaysStoppedAnimation(.7),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 19,
          child: DotsIndicator(
            dotsCount: widget.imagesPath.length,
            position: kPosition,
            onTap: handleChangeDotIndicator,
            decorator: DotsDecorator(
              activeColor: ColorConstant.greenAA,
              size: const Size.square(16.0),
              activeSize: const Size.square(16.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
        )
      ],
    );
  }
}
