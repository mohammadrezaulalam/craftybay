
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../state_holders/complete_profile_controller.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/image_assets.dart';
import '../home_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _customerNameTEController = TextEditingController();
  final TextEditingController _customerAddressTEController = TextEditingController();
  final TextEditingController _customerCityTEController = TextEditingController();
  final TextEditingController _customerStateTEController = TextEditingController();
  final TextEditingController _customerPostCodeTEController = TextEditingController();
  final TextEditingController _customerCountryTEController = TextEditingController();
  final TextEditingController _customerPhoneTEController = TextEditingController();
  final TextEditingController _customerFaxTEController = TextEditingController();
  final TextEditingController _shippingNameTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController = TextEditingController();
  final TextEditingController _shippingCityTEController = TextEditingController();
  final TextEditingController _shippingStateTEController = TextEditingController();
  final TextEditingController _shippingPostCodeTEController = TextEditingController();
  final TextEditingController _shippingCountryTEController = TextEditingController();
  final TextEditingController _shippingPhoneTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: ImageAssets.authLogo,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Complete Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 26),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get Started with Your Details',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _customerNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerAddressTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Address',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer City',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your City";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer State',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your State";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerPostCodeTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Postcode',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Postcode";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Country',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Country";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerPhoneTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Phone',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Phone";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _customerFaxTEController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Fax',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Fax";
                      }
                      return null;
                    },
                  ),
                  //Shipping Details
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _shippingNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping Name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _shippingAddressTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping Address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _shippingCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping City',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping City";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _shippingStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping State',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping State";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _shippingPostCodeTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Postcode',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping Postcode";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _shippingCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Country',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping Country";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:16),
                  TextFormField(
                    controller: _shippingPhoneTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Phone',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Shipping Phone";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CompleteProfileController>(
                        builder: (completeProfileController) {
                          if(completeProfileController.completeProfileInProgress){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () async {
                              if(!_formKey.currentState!.validate()){
                                return;
                              }
                              final result =
                              await completeProfileController.completeProfile(
                                  _customerNameTEController.text.trim(),
                                  _customerAddressTEController.text.trim(),
                                  _customerCityTEController.text.trim(),
                                  _customerStateTEController.text.trim(),
                                  int.parse(_customerPostCodeTEController.text
                                      .trim()),
                                  _customerCountryTEController.text.trim(),
                                  int.parse(
                                      _customerPhoneTEController.text.trim()),
                                  int.parse(
                                      _customerFaxTEController.text.trim()),
                                  _shippingNameTEController.text.trim(),
                                  _shippingAddressTEController.text.trim(),
                                  _shippingCityTEController.text.trim(),
                                  _shippingStateTEController.text.trim(),
                                  int.parse(_shippingPostCodeTEController.text
                                      .trim()),
                                  _shippingCountryTEController.text.trim(),
                                  int.parse(
                                      _shippingPhoneTEController.text.trim()));
                              if(result){
                                Get.snackbar(
                                  'Profile Completed',
                                  'Your Profile Completed Successfully!',
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                                );
                                Get.to(const HomeScreen());
                              }

                            },
                            child: const Text('Complete'),
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
