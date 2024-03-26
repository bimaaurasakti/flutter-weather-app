import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilities/utilities.dart';
import 'package:weather_app/View/Next-Days/Components/small_container_list.dart';
import 'package:weather_app/ViewModel/Controller/days_controller.dart';

class CenterCard extends StatelessWidget {

  final controller = Get.put(DaysController());

  CenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Obx(() => Positioned(
      top: size.height * 0.35,
      left: 20,
      right: 20,
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.blueAccent,
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.withOpacity(.3),
            Colors.blue.withOpacity(.8),
            Colors.blue.withOpacity(.5),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    controller.getImage(controller.currentDay.value),
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Text(
                        '${controller.day.value.temp!.toInt().toString()}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Feels like ${controller.day.value.feelslike!.toInt().toString()}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( 
                        controller.day.value.conditions!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text( 
                        Utilities.currentTime(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    ImageAssets.windwave,
                    height: 80,
                    width: 90,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              SmallContainerList(),
            ],
          ),
        ),
      ),
    ));
  }
}