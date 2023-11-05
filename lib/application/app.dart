import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:craftybay/application/state_holder_binder.dart';
import 'package:craftybay/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay/presentation/ui/utilities/theme/theme_service.dart';
import 'package:craftybay/presentation/ui/utilities/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  bool themeModeValue = false;

  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityStates(result);
  }

  void checkInternetConnectivityStatus(){
    _connectivityStatusStream = Connectivity().onConnectivityChanged.listen((status) {
      handleConnectivityStates(status);
    });
  }

  void handleConnectivityStates(ConnectivityResult status){
    if(status != ConnectivityResult.mobile && status != ConnectivityResult.wifi){
      Get.showSnackbar(
        const GetSnackBar(
          title: 'No Internet',
          message: 'Please Check Your Internet Connection',
        ),
      );
    }else{
      if(Get.isSnackbarOpen){
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      title: 'Crafty Bay',
      home: const SplashScreen(),
      initialBinding: StateHolderBinder(),
      // theme: ThemeData(
      //   primarySwatch:
      //       MaterialColor(AppColors.primaryColor.value, AppColors().color),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       padding: const EdgeInsets.symmetric(vertical: 13),
      //       textStyle: const TextStyle(
      //           fontSize: 16, letterSpacing: 0.5, fontWeight: FontWeight.w600),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(6),
      //       ),
      //     ),
      //   ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     contentPadding: EdgeInsets.symmetric(horizontal: 16),
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //     disabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   //colorScheme: const ColorScheme.dark(),
      //   brightness: Brightness.dark,
      //   primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       padding: const EdgeInsets.symmetric(vertical: 13),
      //       textStyle: const TextStyle(
      //           fontSize: 16, letterSpacing: 0.5, fontWeight: FontWeight.w600),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(6),
      //       ),
      //     ),
      //   ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     contentPadding: EdgeInsets.symmetric(horizontal: 16),
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //     disabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //   ),
      // ),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }

  @override
  void dispose() {
    _connectivityStatusStream.cancel();
    super.dispose();
  }

}
