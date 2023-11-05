import 'package:get/get.dart';

import '../../data/models/product_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductListController extends GetxController{
  bool _getProductsInProgress = false;
  ProductModel _productModel = ProductModel();

  ProductModel get productModel => _productModel;

  String _message = '';

  bool get getProductsInProgress => _getProductsInProgress;
  String get message => _message;

  Future<bool> getProductsByCategory(int categoryId) async {
    _getProductsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByCategory(categoryId));
    _getProductsInProgress = false;

    if(response.isSuccess){
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _message = 'Product list data fetch failed.';
      update();
      return false;
    }

  }

  void setProducts(ProductModel productModel) {
    _productModel = productModel;
    update();
  }

}