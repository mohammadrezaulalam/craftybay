import 'package:craftybay/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../state_holders/auth_controller.dart';
import '../utilities/image_assets.dart';
import 'auth/email_verification_screen.dart';
import 'main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }
  
  void goToNextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Get.offAll(() => (AuthController.isLoggedIn)
            ? const MainBottomNavScreen()
            : const EmailVerificationScreen()),
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: SvgPicture.asset(ImageAssets.craftyBayLogoSVG, width: 100,)),
          const Spacer(),
          const CircularProgressIndicator(color: AppColors.primaryColor,),
          const SizedBox(height: 15),
          const Text('Version 1.0.0'),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
