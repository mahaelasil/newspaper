// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/controller/news_controller.dart';
import 'package:newspaperapp/model/news_model.dart';
class Science extends GetWidget{
  Science({super.key});
  @override
  NewsController controller=Get.put(NewsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(future: controller.getData("science"),
          builder:(context,AsyncSnapshot snapshot){
            Articles data=snapshot.data;
            if(snapshot.hasData){
              return ListView.builder(itemCount: data.articles.length,
                  itemBuilder: (context,int index){
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(data.articles[index].author.toString(),
                            style: const TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),),
                          Text(data.articles[index].title.toString(),
                            style: const TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),),
                          Text(data.articles[index].publishedAt.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.green,
                            ),),

                        ],
                      ),
                    );
                  });
            }
            else{
              return const Center(child:CircularProgressIndicator());
            }

          } ),
    );
  }

}