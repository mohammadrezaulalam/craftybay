import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> imageList;
  const ProductImageSlider({super.key, required this.imageList});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 280.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (int page, _){
                _selectedSlider.value = page;
              }
          ),
          items: widget.imageList.map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        image: NetworkImage(i),
                      ),
                    ),
                    alignment: Alignment.center,
                  );
                },
              );
            },
          ).toList(),
        ),
        //const SizedBox(height: 16),
        Positioned(
          bottom: 15,
          right: 0,
          left: 0,
          child: ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context, value, _) {
            List<Widget> list = [];
            for(int i = 0; i < widget.imageList.length; i++){
              list.add(Container(
                width: 15,
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: value == i ? AppColors.primaryColor : Colors.white,
                ),
              ));
            }
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list
            );
          },),
        ),
      ],
    );
  }
}