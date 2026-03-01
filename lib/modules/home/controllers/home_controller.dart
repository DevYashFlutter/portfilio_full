import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final isScrolled = false.obs;

  // Section Keys
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final techKey = GlobalKey();
  final projectKey = GlobalKey();
  final processKey = GlobalKey();
  final animationKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 800), curve: Curves.easeInOutCubic);
    }
  }

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
