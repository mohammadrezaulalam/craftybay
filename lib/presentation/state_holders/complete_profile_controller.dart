import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController{

  bool _completeProfileInProgress = false;
  String _message = '';

  bool get completeProfileInProgress => _completeProfileInProgress;
  String get message => _message;

  Future<bool> completeProfile(
    String cusName,
    String cusAdd,
    String cusCity,
    String cusState,
    String cusPostcode,
    String cusCountry,
    String cusPhone,
    String cusFax,
    String shipName,
    String shipAdd,
    String shipCity,
    String shipState,
    String shipPostcode,
    String shipCountry,
    String shipPhone,
  ) async {
    _completeProfileInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.createProfile, {
      "cus_name": cusName,
      "cus_add": cusAdd,
      "cus_city": cusCity,
      "cus_state": cusState,
      "cus_postcode": cusPostcode,
      "cus_country": cusCountry,
      "cus_phone": cusPhone,
      "cus_fax": cusFax,
      "ship_name": shipName,
      "ship_add": shipAdd,
      "ship_city": shipCity,
      "ship_state": shipState,
      "ship_postcode": shipPostcode,
      "ship_country": shipCountry,
      "ship_phone": shipPhone
    });
    _completeProfileInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Profile Completion Failed.';
      return false;
    }
  }
}