
import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  final countdown = 30.obs;
  final isButtonEnabled = false.obs;
  late Timer _timer;

  void startTimer() {
    countdown.value = 30;
    isButtonEnabled.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        isButtonEnabled.value = true;
      }
    });
  }

  void restartTimer() {
    _timer.cancel();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
