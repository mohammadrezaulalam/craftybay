import 'package:get/get.dart';

import '../../data/models/product_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class SpecialProductController extends GetxController{
  bool _getSpecialProductsInProgress = false;
  ProductModel _specialProductModel = ProductModel();

  String _errorMessage = '';
  
  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;
  
  ProductModel get specialProductModel => _specialProductModel;
  
  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProducts() async {
    _getSpecialProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByRemark('special'));

    _getSpecialProductsInProgress = false;
    if(response.isSuccess){
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _errorMessage = 'Special product fetching failed.';
      update();
      return false;
    }
  }

}