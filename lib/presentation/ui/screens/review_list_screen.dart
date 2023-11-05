import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/product_review_list_controller.dart';
import '../../state_holders/read_profile_data_controller.dart';
import '../utilities/app_colors.dart';
import '../widgets/review_card.dart';
import 'auth/complete_profile_screen.dart';
import 'create_review_screen.dart';
import 'main_bottom_nav_screen.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductReviewListController>().getProductReviewList(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Get.offAll( () => const MainBottomNavScreen());
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: const Text('Reviews', style: TextStyle(color: Colors.black),),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<ProductReviewListController>().getProductReviewList(widget.productId);
        },
        child: Column(
                children: [
                  Expanded(
                    child: GetBuilder<ProductReviewListController>(
                      builder: (productReviewListController) {

                        if(productReviewListController.getProductReviewListInProgress){
                          return const Center(
                            child: CircularProgressIndicator(color: AppColors.primaryColor,),
                          );
                        }
                        return ListView.builder(
                          itemCount: productReviewListController.productReviewListModel.data?.length ?? 0,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return ReviewCard(
                              reviewData: productReviewListController.productReviewListModel.data![index],
                            );
                          },
                        );
                      }
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                        color: AppColors.primaryColor.withOpacity(0.1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('(123)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey.shade600,
                              ),),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            if(await Get.find<ReadProfileDataController>().readProfileData() == 'null'){
                              Get.to( () => const CompleteProfileScreen());
                            }else{
                              Get.to( () => CreateReviewScreen( productId:  widget.productId,));
                            }

                          },
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.add, size: 35, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

      ),
    );
  }
}




