import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/read_wishlist_controller.dart';
import '../utilities/app_colors.dart';
import '../widgets/wishlist_product_card.dart';

class WishListScreen extends StatefulWidget {
  final int? categoryId;
  final ProductModel? productModel;
  const WishListScreen({super.key, this.categoryId, this.productModel});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<ReadWishListController>().getWishListProducts();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text('Wishlist', style: TextStyle(color: Colors.black),),
        ),
        body: GetBuilder<ReadWishListController>(
          builder: (wishListController) {
            if(wishListController.getWishListProductsInProgress){
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor,),
              );
            }
            if(wishListController.wishListProductModel.data?.isEmpty ?? true){
              return const Center(
                child: Text(
                  'No Product Found!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: wishListController.wishListProductModel.data?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ), itemBuilder: (context, index){
                return FittedBox(
                      child: WishListProductCard(
                        wishListData: wishListController.wishListProductModel.data![index],
                      ),
                    );
                  }),
            );
          }
        ),
      ),
    );
  }
}
