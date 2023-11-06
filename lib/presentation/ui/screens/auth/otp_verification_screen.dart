
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holders/email_verification_controller.dart';
import '../../../state_holders/otp_verification_controller.dart';
import '../../../state_holders/read_profile_data_controller.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/image_assets.dart';
import '../../utilities/timer_controller.dart';
import '../main_bottom_nav_screen.dart';
import 'complete_profile_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;
  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TimerController timerController = Get.put(TimerController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _otpTEController = TextEditingController();

  @override
  void initState() {
    timerController.startTimer();
    super.initState();
  }

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
                    'Enter OTP Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 26),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A 4 Digit OTP Code has been Sent',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  PinCodeTextField(
                    controller: _otpTEController,
                    validator: (String? value){
                      if((value?.isEmpty ?? true) || value!.length < 6){
                        return "Enter 6 Digit OTP";
                      }
                      return null;
                    },
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(color: Colors.black),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: AppColors.primaryColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OtpVerificationController>(
                      builder: (controller) {
                        if(controller.otpVerificationInProgress){
                          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              verifyOtp(controller);
                            }
                            //Get.to(const CompleteProfileScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor, // Background color
                          ),
                          child: const Text('Next'),
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 30),
                  //Added by Me to Show Timer and Resend Button Start
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'The Code will expire in ',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          //SizedBox(width: 3),
                          Obx(() {
                            return Text(
                              '${timerController.countdown.value}s',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                                fontSize: 17,
                              ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 15),
                      //const Text('Resend Code') :
                      Obx(
                        () => InkWell(
                          onTap: timerController.isButtonEnabled.value
                              ? () {
                                  if (timerController.isButtonEnabled.value) {
                                    timerController.restartTimer();
                                    Get.find<EmailVerificationController>().verifyEmail(widget.email);
                                    //verifyOtp(controller);
                                  }
                                  print('Button Pressed...');
                                }
                              : null,
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                              color: !timerController.isButtonEnabled.value
                                  ? Colors.grey.shade400
                                  : AppColors.primaryColor,
                              fontWeight: !timerController.isButtonEnabled.value
                                  ? FontWeight.w400
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response = await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if(response){
      if( await Get.find<ReadProfileDataController>().readProfileData() == false){
        Get.to( () => const CompleteProfileScreen());
      }else{
        Get.to( () => const MainBottomNavScreen());
      }
    }else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Enter The Correct OTP.'),
          ),
        );
      }
    }
  }

}
