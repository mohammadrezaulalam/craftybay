import 'package:get/get.dart';

import '../../data/models/product_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class NewProductController extends GetxController{
  bool _getNewProductsInProgress = false;

  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';
  
  bool get getNewProductsInProgress => _getNewProductsInProgress;
  
  ProductModel get newProductModel => _newProductModel;
  
  String get errorMessage => _errorMessage;


  Future<bool> getNewProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByRemark('new'));

    _getNewProductsInProgress = false;
    if(response.isSuccess){
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _errorMessage = 'New product fetching failed.';
      update();
      return false;
    }
  }

}