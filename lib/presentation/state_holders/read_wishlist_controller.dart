import 'dart:developer';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_wishlist_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ReadWishListController extends GetxController{
  bool _getWishListProductsInProgress = false;

  ProductReviewListModel _wishListProductModel = ProductReviewListModel();
  String _errorMessage = '';

  bool get getWishListProductsInProgress => _getWishListProductsInProgress;

  ProductReviewListModel get wishListProductModel => _wishListProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getWishListProducts() async {
    _getWishListProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.productWishList);

    _getWishListProductsInProgress = false;
    if(response.isSuccess){
      _wishListProductModel = ProductReviewListModel.fromJson(response.responseJson ?? {});
      update();
      log(_wishListProductModel.toString());
      return true;
    }else{
      _errorMessage = 'Wishlist Products fetching failed.';
      update();
      return false;
    }
  }


  Future<bool> removeFromWishList(int id) async {
    _getWishListProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.removeWishList(id));
    _getWishListProductsInProgress = false;
    if (response.isSuccess) {
      _wishListProductModel.data?.removeWhere((element) => element.productId == id);
      update();
      return true;
    } else {
      _errorMessage = 'remove wishlist failed! Try again';
      return false;
    }
  }

}