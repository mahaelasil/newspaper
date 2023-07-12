// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/controller/news_controller.dart';
import 'package:newspaperapp/view/bottom_navigation_bar/health.dart';
import 'package:newspaperapp/view/bottom_navigation_bar/science.dart';
import 'package:newspaperapp/view/bottom_navigation_bar/sports.dart';
import 'package:newspaperapp/view/bottom_navigation_bar/technology.dart';
class HomePage extends GetWidget{
  HomePage({super.key});
  @override
  NewsController controller=Get.put(NewsController());
List<Widget>screens=[
  Sports(),
  Science(),
  Health(),
Technology(),
];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
backgroundColor: Colors.cyan,
  bottomNavigationBar: GetX<NewsController>(builder: (controller)=>BottomNavigationBar(
      selectedItemColor: Colors.red,
      currentIndex:controller.currentIndex.value ,
      onTap: (value){
        controller.currentIndex.value=value;
      },
      items: const [

        BottomNavigationBarItem(label: "Sports",
            icon: Icon(Icons.sports)),
        BottomNavigationBarItem(label: "Science",
            icon: Icon(Icons.science)),
        BottomNavigationBarItem(label: "Health",
            icon: Icon(Icons.health_and_safety)),
BottomNavigationBarItem(label: "Technology",
    icon: Icon(Icons.military_tech))
      ]),),
    body: GetX<NewsController>(builder: (controller)=>screens[controller.currentIndex.value]),
  );
  }

}