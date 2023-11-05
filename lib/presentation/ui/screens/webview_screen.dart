import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../state_holders/cart_list_controller.dart';
import '../utilities/app_colors.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.paymentUrl});

  final String paymentUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  late final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {

          if(url.endsWith("tran_type=success")){
            //Get.back();
            Navigator.pop(context);
            Get.snackbar(
              'Payment Successful',
              'Your Order has been confirmed',
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.primaryColor.withOpacity(0.5),
            );

            Get.find<CartListController>().getCartList();

          }
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {

          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.paymentUrl));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
