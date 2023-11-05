import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/presentation/state_holders/product_list_controller.dart';
import 'package:craftybay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/app_colors.dart';

class ProductListScreen extends StatefulWidget {
  final int? categoryId;
  final ProductModel? productModel;
  const ProductListScreen({super.key, this.categoryId, this.productModel});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
List<String> demList = ['a', 'b', 'c'];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.categoryId != null){
        Get.find<ProductListController>().getProductsByCategory(widget.categoryId!);
      }else if(widget.productModel != null){
        Get.find<ProductListController>().setProducts(widget.productModel!);
      }

    });
    super.initState();
  }

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
          'Product List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          if(productListController.getProductsInProgress){
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor,),
            );
          }
          if(productListController.productModel.data?.isEmpty ?? true){
            return const Center(
              child: Text(
              'No Product Found!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,),
            ),
          );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GridView.builder(
              itemCount: productListController.productModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                child: ProductCard(
                  product: productListController.productModel.data![index],
                ),
              );
            },
            ),
          );
        }
      ),
    );
  }
}
