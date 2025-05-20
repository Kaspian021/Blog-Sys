
import 'dart:developer';

import 'package:blog_sys/component/get_names_url.dart';
import 'package:blog_sys/component/service.dart';
import 'package:blog_sys/model/model_home_new_articles.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isloading= false.obs;
  RxBool isLogin= false.obs;
  RxList<ModelHomeNewArticles> listArticlesNews= RxList();

  @override
  void onInit() {
    newsArticlesList();
    super.onInit();
  }

  newsArticlesList()async{
    isloading.value= true;
    try {
      final response= await  ServiceApi().getApi(GetNamesUrl.newsArticlesURl);

      if(response.statusCode==200){

      for(var element in response.data){
        listArticlesNews.add(ModelHomeNewArticles.fromJson(element));
        log(listArticlesNews[0].image!);
      }
      
    }
    } catch (e) {
      log('Error: $e');
    }
    isloading.value= false;
  }

}