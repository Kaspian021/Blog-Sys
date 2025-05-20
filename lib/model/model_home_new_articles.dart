
import 'package:blog_sys/component/get_names_url.dart';

class ModelHomeNewArticles {

  String? title;
  String?  image;


  ModelHomeNewArticles({required this.title,required this.image});


  ModelHomeNewArticles.fromJson(Map<String,dynamic> element){

    title = element['title'];
    image = GetNamesUrl.baseAPI+ element['image'];

  }


}