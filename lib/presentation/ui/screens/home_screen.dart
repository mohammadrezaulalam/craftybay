import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay/presentation/ui/utilities/app_colors.dart';
import 'package:craftybay/presentation/ui/utilities/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/auth_controller.dart';
import '../../state_holders/category_controller.dart';
import '../../state_holders/home_slider_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/popular_product_controller.dart';
import '../../state_holders/read_profile_data_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../utilities/image_assets.dart';
import '../widgets/category_card.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/home/section_header.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAssets.navLogo,
            const Spacer(),
            const SizedBox(width: 8),

            CircularIconButton(
              icon: Icons.person,
              onTap: (){
                Get.find<ReadProfileDataController>().readProfileData();
              },
            ),

            const SizedBox(width: 8),
            CircularIconButton(
              icon: Icons.phone,
              onTap: () async {
                await AuthController.clear();
              },
            ),
            const SizedBox(width: 8),
            CircularIconButton(
              icon: Icons.notifications_on_outlined,
              onTap: (){},
            ),
            const SizedBox(width: 8),
            CircularIconButton(
              icon: Icons.light_mode_outlined,
              onTap: () {
                ThemeService().changeThemeMode();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GetBuilder<HomeSlidersController>(
                builder: (homeSliderController) {
                  if(homeSliderController.getHomeSlidersInProgress){
                    return const SizedBox(
                      height: 180,
                      child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),
                    );
                  }
                  return HomeSlider(
                    sliders: homeSliderController.sliderModel.data ?? [],
                  );
                }
              ),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  //Get.to(const CategoryListScreen());
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoriesInProgress){
                      return const SizedBox(
                        //height: 90,
                        child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),
                      );
                    }
                    return ListView.builder(
                      itemCount: categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          categoryData: categoryController.categoryModel.data![index],
                          onTap: (){
                            Get.to( () => ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!));
                          },
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to( () =>
                    ProductListScreen(
                      productModel:
                      Get.find<PopularProductController>().popularProductModel,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                    if(popularProductController.getPopularProductsInProgress){
                      return const SizedBox(
                        //height: 90,
                        child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularProductController.popularProductModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: popularProductController.popularProductModel.data![index],
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(
                    ProductListScreen(
                      productModel:
                      Get.find<SpecialProductController>().specialProductModel,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                    if(specialProductController.getSpecialProductsInProgress){
                      return const SizedBox(
                        child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: specialProductController.specialProductModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: specialProductController.specialProductModel.data![index],
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(
                    ProductListScreen(
                      productModel:
                          Get.find<NewProductController>().newProductModel,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<NewProductController>(
                    builder: (newProductController) {
                      if(newProductController.getNewProductsInProgress){
                        return const SizedBox(
                          child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProductController.newProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: newProductController.newProductModel.data![index],
                          );
                        },
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







