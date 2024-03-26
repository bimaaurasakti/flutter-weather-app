import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilities/utilities.dart';

import '../../../ViewModel/Controller/home_controller.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 180,
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.withOpacity(.3),
              Colors.blue.withOpacity(.8),
              Colors.blue.withOpacity(.5),
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Image.asset(
                    controller.getImage(controller.currentIndex.value),
                    height: 80,
                    fit: BoxFit.fill,
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                        controller.getCondition(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      Text(
                        Utilities.currentTime(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.1),
                            ]
                          ).createShader(bounds);
                        },
                        child: Obx(() =>Text(
                          controller.getCurrentTemp(),
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600
                          )
                        )),
                      ),
                      Obx(() => 
                        Text(
                          'Feel like ${controller.getFeelLike()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageAssets.windwave,
                    height: 90,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}