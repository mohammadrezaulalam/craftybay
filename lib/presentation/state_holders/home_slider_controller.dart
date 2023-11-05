import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/slider_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class HomeSlidersController extends GetxController{
  bool _getHomeSlidersInProgress = false;
  SliderModel _sliderModel = SliderModel();

  SliderModel get sliderModel => _sliderModel;

  final String _message = '';
  
  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;
  String get message => _message;
  
  Future<bool> getHomeSliders() async {
    _getHomeSlidersInProgress = true;
    update();
    
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getHomeSliders);
    _getHomeSlidersInProgress = false;

    if(response.isSuccess){
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      update();
      return false;
    }
    
  }
  
}