import 'package:craftybay/presentation/ui/screens/webview_screen.dart';
import 'package:craftybay/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/payment_method.dart';
import '../../state_holders/create_invoice_controller.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  //bool isCompleted = false;

  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (controller) {
          if(controller.inProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // if(!isCompleted){
          //   return const Center(
          //     child: Text('Please Complete Your Profile First'),
          //   );
          // }
          
          return ListView.separated(
            itemCount: controller.invoiceCreateResponseModel?.paymentMethod?.length ?? 0,
              itemBuilder: (context, index){
              final PaymentMethod paymentMethod = controller.invoiceCreateResponseModel!.paymentMethod![index];
              return ListTile(
                leading: Image.network(paymentMethod.logo ?? '', width: 65,),
                title: Text(paymentMethod.name ?? ''),
                onTap: (){
                  Get.off( () => WebViewScreen(paymentUrl: paymentMethod.redirectGatewayURL!));
                },
              );
              },
              separatorBuilder: (_, __) => const Divider(),
          );
        }
      ),
    );
  }
}
