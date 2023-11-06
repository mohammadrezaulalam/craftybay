import 'package:craftybay/presentation/ui/screens/review_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../state_holders/create_product_review_controller.dart';
import '../utilities/app_colors.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});
  final int productId;

  @override
  State<CreateReviewScreen> createState() =>
      _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  int productRating = 5;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionTEController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Create Review',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height:16),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    productRating = rating.toInt();
                    print(productRating);
                  },
                ),

                  const SizedBox(height:20),
                  TextFormField(
                    controller: _descriptionTEController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                        hintText: 'Write Review',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16)
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Review Content";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(!_formKey.currentState!.validate()){
                          return;
                        }
                        final result = await Get.find<CreateProductReviewController>().createProductReview(widget.productId, productRating, _descriptionTEController.text.trim());
                        if(result){
                          Get.to( () => ReviewListScreen(productId: widget.productId,),);
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor, // Background color
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
