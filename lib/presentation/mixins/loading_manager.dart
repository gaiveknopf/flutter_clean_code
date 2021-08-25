import 'package:get/get.dart';

mixin LoadingManager on GetxController {
  final _isLoading = RxBool(false);
  Stream<bool> get isLoadingStream => _isLoading.stream;
  set isLoading(bool value) => _isLoading.value = value;
}
