import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product.dart';
import '../../state_holders/create_wishlist_controller.dart';
import '../../state_holders/read_wishlist_controller.dart';
import '../screens/product_details_screen.dart';
import '../utilities/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        Get.to( () =>
          ProductDetailsScreen(
            productId: product.id!,
          ),
        );
      },
      child: Card(
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 135,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8),),
                  color: AppColors.primaryColor.withOpacity(0.1),
                  image: DecorationImage(
                    image: NetworkImage(product.image ?? ''),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price ?? 0}',
                          style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.star_border, size: 15, color: Colors.amber,),
                            Text(
                              '${product.star ?? 0}',
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        Card(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () async {
                                final result = await Get.find<CreateWishListController>().createWishList(product.id ?? 0);
                                if(result){
                                  Get.snackbar(
                                    '',
                                    'This Product has been Added to Wishlist',
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                                  );
                                }
                              },
                              child: Icon(
                                Icons.favorite,
                                size: 13,
                                color: (product.id != Get.find<ReadWishListController>().wishListProductModel.data) ? Colors.white : Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}