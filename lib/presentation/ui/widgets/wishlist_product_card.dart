import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/wishlist_data.dart';
import '../../state_holders/read_wishlist_controller.dart';
import '../screens/product_details_screen.dart';
import '../utilities/app_colors.dart';

class WishListProductCard extends StatelessWidget {
  const WishListProductCard({
    super.key, required this.wishListData,
  });


  final WishListData wishListData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        Get.to( () =>
          ProductDetailsScreen(
            productId: wishListData.id!,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 160,
          //width: MediaQuery.of(context).size.width/1,
          child: Column(
            children: [
              Container(
                height: 110,
                //height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8),),
                  color: AppColors.primaryColor.withOpacity(0.1),
                  image: DecorationImage(
                    image: NetworkImage(wishListData.product?.image ?? ''),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      wishListData.product?.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${wishListData.product?.price ?? 0}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.star_border, size: 19, color: Colors.amber,),
                            Text(
                              '${wishListData.product?.star ?? 0}',
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
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
                              onTap: (){
                                Get.find<ReadWishListController>().removeFromWishList(wishListData.product?.id ?? 0);
                                //print(wishListData.product?.id ?? 0);
                              },
                              child: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.white,
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