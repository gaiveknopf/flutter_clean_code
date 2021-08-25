import 'package:get/get.dart';

mixin NavegationManager {
  void handleNavigation(Stream<String> stream, {bool clear = false}) {
    stream.listen((page) {
      if (page?.isNotEmpty == true) {
        clear ? Get.offAllNamed(page) : Get.toNamed(page);
      }
    });
  }
}
