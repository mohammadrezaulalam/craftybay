import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateProductReviewController extends GetxController{

  bool _inProgress = false;
  String _message = '';

  bool get inProgress => _inProgress;
  String get message => _message;

  Future<bool> createProductReview(int productId, int rating, String description) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.postRequest(Urls.createProductReview, {
      "description": description,
      "product_id": productId,
      "rating": rating
    });
    _inProgress = false;
    update();
    if(response.isSuccess){
      print('Rating Created....');
      return true;
    }else{
      _message = 'Rating Creation Failed.';
      return false;
    }

  }

}




