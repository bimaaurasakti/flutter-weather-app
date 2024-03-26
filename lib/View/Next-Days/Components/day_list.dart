import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModel/Controller/days_controller.dart';

class DayList extends StatelessWidget {

  final controller = Get.put(DaysController());

  DayList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.homeController.model.value!.days!.length,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
              onTap: () => controller.setDay(index),
              child: Card(
                margin: EdgeInsets.only(right: index == controller.homeController.model.value!.days!.length - 1 ? 0 : 14),
                elevation: 10,
                color: Colors.white,
                shadowColor: controller.compareDay(index) ? Colors.blue : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.compareDay(index) ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        controller.getImage(index),
                        height: 40,
                      ),
                      Text(
                        controller.getMonthDay(index),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0
                        ),
                      ),
                      Text(
                        controller.getMonth(index),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
          },
        ),
      );
  }
}