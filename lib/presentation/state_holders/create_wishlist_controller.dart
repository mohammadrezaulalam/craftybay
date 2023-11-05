
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateWishListController extends GetxController{

  bool _inProgress = false;
  String _message = '';

  bool get inProgress => _inProgress;
  String get message => _message;


  Future<bool> createWishList(int id) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createWishList(id) );
    _inProgress = false;
    update();
    if(response.isSuccess){

      print('WishList Created....');
      return true;
    }else{
      _message = 'WishList Creation Failed.';
      return false;
    }

  }

}




