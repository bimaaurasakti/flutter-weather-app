import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ViewModel/Controller/home_controller.dart';

class HourList extends StatelessWidget {
  HourList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.model.value!.days![0].hours!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.setHour(index),
            child: Obx(() => Card(
              elevation: 10,
              color: Colors.white,
              margin: const EdgeInsets.only(right: 14),
              shadowColor: controller.compareIndex(index) ? Colors.blue : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Obx(() => Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: controller.compareIndex(index)
                      ? Colors.blue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => Text(
                      controller.getHour(index),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )),
                    Obx(() => Image.asset(
                      controller.getImage(index),
                      height: 40, 
                      width: 40,
                    )),
                    Obx(() => Text(
                      controller.getTemp(index),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )),
                  ],
                ),
              )),
            )),
          );
        }
      ),
    );
  }
}
