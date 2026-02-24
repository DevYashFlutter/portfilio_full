import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final isScrolled = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        isScrolled.value = true;
      } else {
        isScrolled.value = false;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
