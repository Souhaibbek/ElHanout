
import 'package:elhanout/logic/controller/layoutcontroller.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);
  final LayoutController controller = Get.find<LayoutController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: TextUtils(text: controller.titles[controller.currentIndex.value],
            color: Get.isDarkMode ? pinkClr : mainColor,fontSize: 24,fontWeight: FontWeight.bold,),
            actions: [
              IconButton(
                onPressed: () {
                },
                icon: Image.asset('assets/images/shop.png'),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            items: controller.items,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          ),
        );
      }),
    );
  }
}
