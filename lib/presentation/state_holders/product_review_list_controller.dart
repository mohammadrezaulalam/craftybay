import 'dart:developer';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_review_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';



class ProductReviewListController extends GetxController{
  bool _getProductReviewListInProgress = false;

  ProductReviewListModel _productReviewListModel = ProductReviewListModel();
  String _errorMessage = '';

  bool get getProductReviewListInProgress => _getProductReviewListInProgress;

  ProductReviewListModel get productReviewListModel => _productReviewListModel;

  String get errorMessage => _errorMessage;

  Future<bool> getProductReviewList(int id) async {
    _getProductReviewListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.productReviewList(id));

    _getProductReviewListInProgress = false;
    if(response.isSuccess){
      _productReviewListModel = ProductReviewListModel.fromJson(response.responseJson ?? {});
      update();
      log(_productReviewListModel.toString());
      return true;
    }else{
      _errorMessage = 'Product Reviews fetching failed.';
      update();
      return false;
    }
  }


}