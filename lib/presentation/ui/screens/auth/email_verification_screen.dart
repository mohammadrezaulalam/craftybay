
import 'package:craftybay/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../state_holders/email_verification_controller.dart';
import '../../utilities/image_assets.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();

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
                  const SizedBox(height: 80),
                  Center(
                    child: ImageAssets.authLogo,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 26),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please Enter Your Email Address',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Email Address',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (String? value){
                      // bool emailValid = RegExp(
                      //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //     .hasMatch(value.toString());
                      if(value?.isEmpty ?? true){
                        return 'This Field is Mandatory';
                      }
                      /*else if(!emailValid){
                        return 'Please Enter a Valid Email';
                      }*/
                      else if(value!.isEmail == false){
                        return 'Please Enter a Valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<EmailVerificationController>(
                      builder: (controller) {
                        if(controller.emailVerificationInProgress){
                          return const Center(
                            child: CircularProgressIndicator(color: AppColors.primaryColor,),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              verifyEmail(controller);
                            }

                          },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor, // Background color
                            ),
                          child: const Text('Next'),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response = await controller.verifyEmail(_emailTEController.text.trim());
    if(response){
      Get.to(() => OTPVerificationScreen(email: _emailTEController.text.trim()));
    }else{
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(controller.message),
          ),
        );
      }
    }
  }
}
