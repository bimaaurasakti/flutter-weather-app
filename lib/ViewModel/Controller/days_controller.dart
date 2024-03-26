import 'package:get/get.dart';
import 'package:weather_app/Utilities/utilities.dart';
import 'package:weather_app/ViewModel/Controller/home_controller.dart';

import '../../Model/data_model.dart';
import '../../Resources/Images/image_assets.dart';

class DaysController extends GetxController {
  Rx<int> currentDay = 0.obs;
  final homeController = Get.put(HomeController());
  late Rx<Days> day;

  DaysController() {
    day = homeController.model.value!.days![0].obs;
  }

  setDay(int index) {
    day.value = homeController.model.value!.days![index];
    currentDay.value = index;
  }

  String getImage(int index) {
    return Utilities.imageMap[homeController.model.value!.days![index].conditions] == null
        ? ImageAssets.nightStatRain
        : Utilities.imageMap[homeController.model.value!.days![index].conditions]!;
  }

  String getMonth(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDate(date);
  }

  String getMonthDay(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDay(date);
  }

  String getDate(int index) {
    DateTime date = DateTime.parse(homeController.model.value!.days![index].datetime.toString());
    return Utilities.formatDate(date);
  }

  String getMinTemp(int index) {
    return '${homeController.model.value!.days![index].tempmin!.toInt()}°';
  }

  String getMaxTemp(int index) {
    return '${homeController.model.value!.days![index].tempmax!.toInt()}°';
  }

  bool compareDay(int day) => day == currentDay.value;
}
