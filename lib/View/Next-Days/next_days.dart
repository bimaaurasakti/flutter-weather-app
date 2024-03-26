import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/View/Next-Days/Components/bottom_list.dart';
import 'package:weather_app/View/Next-Days/Components/center_card.dart';
import 'package:weather_app/View/Next-Days/Components/custom_app_bar.dart';
import 'package:weather_app/View/Next-Days/Components/day_list.dart';
import 'package:weather_app/ViewModel/Controller/days_controller.dart';

class NextDays extends StatelessWidget {

  final controller = Get.put(DaysController());

  NextDays({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const CustomAppBar(),
                  DayList(),
                ],
              ),
              CenterCard(),
              BottomList(),
            ],
          ),
        ),
      ),
    );
  }
}