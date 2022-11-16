import 'package:get/state_manager.dart';

class HomeController {
  RxInt homeIndex = 0.obs;
  //change val...
  void changeVal(var value) {
    homeIndex.value = value;
  }
}
