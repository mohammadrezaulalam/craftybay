import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/category_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_card.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  
  
  
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
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
          ),
          title: const Text('Category', style: TextStyle(color: Colors.black),),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategories();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                if(categoryController.getCategoriesInProgress){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return GridView.builder(itemCount: categoryController.categoryModel.data?.length ?? 0, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ), itemBuilder: (context, index){
                  return FittedBox(
                    child: CategoryCard(
                      categoryData: categoryController.categoryModel.data![index],
                      onTap: (){
                        Get.to( () => ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!),);
                      },
                    ),
                  );
                },
              );
            }
            ),
          ),
        ),
      ),
    );
  }
}
