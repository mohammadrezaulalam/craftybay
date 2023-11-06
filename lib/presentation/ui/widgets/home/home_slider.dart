import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/slider_data.dart';
import '../../utilities/app_colors.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> sliders;
  const HomeSlider({super.key, required this.sliders});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _){
                _selectedSlider.value = page;
              }
          ),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: double.infinity,//MediaQuery.of(context).size.width / 1,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.network(
                        sliderData.image ?? '', height: double.infinity, width: double.infinity, fit: BoxFit.fitHeight,
                      ),
                      Positioned(
                        bottom: 6,
                        left: 6,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              sliderData.title ?? '',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context, value, _) {
          List<Widget> list = [];
          for(int i = 0; i<widget.sliders.length; i++){
            list.add(Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: value == i ? AppColors.primaryColor : null,
              ),
            ));
          }
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list
          );
        },),
      ],
    );
  }
}