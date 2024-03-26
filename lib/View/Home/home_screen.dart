import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/View/Home/Components/hour_list.dart';
import 'package:weather_app/View/Home/Components/location.dart';
import 'package:weather_app/View/Next-Days/next_days.dart';

import 'Components/container_list.dart';
import 'Components/custom_app_bar.dart';
import 'Components/info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  const CustomAppBar(),
                  Location(),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  ContainerList(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NextDays());
                        },
                        child: const Text(
                          'Next 14 Days >',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            HourList(),
          ],
        ),
      ),
    );
  }
}