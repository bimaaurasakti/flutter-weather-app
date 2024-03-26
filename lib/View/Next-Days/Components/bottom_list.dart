import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModel/Controller/days_controller.dart';

class BottomList extends StatelessWidget {

  final controller = Get.put(DaysController());

  BottomList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var dataLength = controller.homeController.model.value!.days!.length;
    return Positioned(
      bottom: 0,
      child: Container(
        height: size.height * 0.2,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26, 
              offset: Offset(1, 1),
              blurRadius: 30,
              spreadRadius: 4,
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
          child: OverflowBox(
            minWidth: 0.0,
            minHeight: 0.0,
            child: ListView.builder(
              itemCount: controller.homeController.model.value!.days!.length,
              itemBuilder: (context, index) {
                return Obx(() => Card(
                  margin: EdgeInsets.only(
                    top: index == 0 ? 30 : 0,
                    bottom: index == dataLength - 1 ? 10 : 20,
                    left: 40,
                    right: 40,
                  ),
                  elevation: 10,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 2
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.getDate(index),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: controller.getMinTemp(index),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(
                                text: '/',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: controller.getMaxTemp(index),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          controller.getImage(index),
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}