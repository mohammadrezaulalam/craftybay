import 'package:craftybay/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../data/models/cart_list_model.dart';
import '../../state_holders/category_controller.dart';
import '../../state_holders/home_slider_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/popular_product_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../utilities/app_colors.dart';
import 'cart_screen.dart';
import 'category_list_screen.dart';
import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  late final CartData cartData;

  MainBottomNavController mainBottomNavController = Get.put(MainBottomNavController());
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSlidersController>().getHomeSliders();
      Get.find<CategoryController>().getCategories();
      Get.find<PopularProductController>().getPopularProducts();
      Get.find<SpecialProductController>().getSpecialProducts();
      Get.find<NewProductController>().getNewProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentSelectedIndex,
            onTap: controller.changeScreen,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            elevation: 4,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.basketShopping),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gift),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      }
    );
  }
}
