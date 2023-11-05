import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';


class ReadProfileDataController extends GetxController{
  bool _readProfileDataInProgress = false;
  String _message = '';

  bool get readProfileDataInProgress => _readProfileDataInProgress;
  String get message => _message;

  Future<bool> readProfileData() async {
    _readProfileDataInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileDataInProgress = false;
    update();

    if(response.isSuccess && response.responseJson!['data'] == null){
       //return response.responseJson!['data'].toString();
      return true;
    }else{
      _message = 'Email Verification Failed.';
      return false;

    }



  }

}