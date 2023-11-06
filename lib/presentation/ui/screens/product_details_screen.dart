import 'package:craftybay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:craftybay/presentation/ui/screens/review_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_details.dart';
import '../../state_holders/add_to_cart_controller.dart';
import '../../state_holders/create_wishlist_controller.dart';
import '../../state_holders/product_details_controller.dart';
import '../../state_holders/read_wishlist_controller.dart';
import '../utilities/app_colors.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/home/product_image_slider.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  bool _isFavourite = false;

  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.getProductDetailsInProgress){
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor,),
            );
          }
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ProductImageSlider(
                            imageList: [
                              productDetailsController.productDetails.img1 ?? '',
                              productDetailsController.productDetails.img2 ?? '',
                              productDetailsController.productDetails.img3 ?? '',
                              productDetailsController.productDetails.img4 ?? ''
                            ],
                          ),
                          productDetailsAppBar,
                          ],
                        ),
                        productDetails(productDetailsController.productDetails, productDetailsController.availableColors),
                      ],
                    ),
                  ),
                ),
                addToCartBottomContainer(
                productDetailsController.productDetails,
                productDetailsController.availableColors,
                productDetailsController.availableSizes,
              ),
            ],
            ),
          );
        }
      ),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    //convertStringToColor(productDetails.color ?? '');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                ),
              ),
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 10,
                stepValue: 1,
                value: 1,
                onChange: (newValue) {
                  quantity = newValue;
                  //print(newValue);
                },
              ),
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star_border,
                    size: 15,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () async {
                  Get.to( () => ReviewListScreen( productId: widget.productId, ));
                },
                child: const Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Card(
                //color: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: () {
                      // final result = await Get.find<CreateWishListController>().createWishList(productDetails.product?.id ?? 0);
                      // if(result){
                      //   Get.snackbar(
                      //     'Added to WishList',
                      //     'This Product has been Added to Wishlist',
                      //     colorText: Colors.white,
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                      //   );
                      // }
                      _toggleFavourite();
                    },
                    child: Icon(
                      _isFavourite ? Icons.favorite : Icons.favorite_border,
                      size: 16,
                      color: Colors.red[500],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 30,
            child: SizePicker(
              initialSelected: 0,
              onSelected: (int selectedSize) {
                _selectedColorIndex = selectedSize;
              },
              sizes: productDetails.color?.split(',') ?? [],
            ),
          ),

          const SizedBox(height: 16),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 30,
            child: SizePicker(
              initialSelected: 0,
              onSelected: (int selectedSize) {
                _selectedSizeIndex = selectedSize;
              },
              sizes: productDetails.size?.split(',') ?? [],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Text(productDetails.product?.shortDes ?? ''),
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      title: const Text(
        'Product Details',
        style: TextStyle(color: Colors.black54),
      ),
      leading: const BackButton(
        color: Colors.black54,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container addToCartBottomContainer (ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          color: AppColors.primaryColor.withOpacity(0.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text('\$ ${details.product?.price ?? 0}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                if(addToCartController.addToCartInProgress){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () async {
                    final result = await addToCartController.addToCart(
                      details.id!,
                      colors[_selectedColorIndex].toString(),
                      sizes[_selectedSizeIndex],
                      quantity,

                  );
                    if(result){
                      Get.snackbar(
                        'Added to Cart',
                        'This Product has been Added to Cart',
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                      );
                    }

                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // Background color
                  ),
                  child: const Text('Add to Cart'),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFavourite() async {
    setState(() {});
    if(await Get.find<ReadProfileDataController>().readProfileData() == false){
      Get.to( () => const CompleteProfileScreen() );
    }else{
      if (!_isFavourite) {
        _isFavourite = true;


        final result = await Get.find<ReadWishListController>()
            .removeFromWishList(widget.productId ?? 0);
        if (result) {
          Get.snackbar(
            'WishList Deleted',
            'This Product has been Removed from Wishlist',
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.primaryColor.withOpacity(0.5),
          );
        }

      } else {
        _isFavourite = false;
        final result = await Get.find<CreateWishListController>()
            .createWishList(widget.productId ?? 0);
        if (result) {
          Get.snackbar(
            'Added to WishList',
            'This Product has been Added to Wishlist',
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.primaryColor.withOpacity(0.5),
          );
        }

      }
    }
  }
}


