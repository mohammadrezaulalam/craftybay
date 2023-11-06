import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/read_user_profile_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';


class ReadProfileDataController extends GetxController{
  bool _readProfileDataInProgress = false;
  ReadUserProfileModel _readUserProfileModel = ReadUserProfileModel();
  String _message = '';

  bool get readProfileDataInProgress => _readProfileDataInProgress;

  ReadUserProfileModel get readUserProfileModel => _readUserProfileModel;

  String get message => _message;

  Future<bool> readProfileData() async {
    _readProfileDataInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileDataInProgress = false;


    if(response.isSuccess && response.responseJson!['data'] != null){
       //return response.responseJson!['data'].toString();
      _readUserProfileModel = ReadUserProfileModel.fromJson(response.responseJson!);
      final resData = response.responseJson!['data'].toString();
      print(resData);
      //print(_readUserProfileModel.data?.cusName);
      update();
      return true;
    }else{
      _message = 'Profile Data Fetching Failed.';
      return false;//'Profile Data Fetching Failed.';

    }



  }

}