import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedPage = 1.obs;

  void changePage(int page) {
    selectedPage.value = page;
  }
}

