import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newspaperapp/model/news_model.dart';
class NewsController extends GetxController{
  RxInt currentIndex=0.obs;
getData(String cat)async{
  final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$cat&apiKey=29e0dec4c01d46e8abfd765af065d8e0");
 http.Response response= await http.get(url);
 if(response.statusCode==200){
  try{
    return Articles.fromJson(jsonDecode(response.body));
  }catch(e){
    Get.snackbar("error", e.toString());
  }
 }
}
}