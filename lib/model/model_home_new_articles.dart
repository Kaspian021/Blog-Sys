
import 'package:blog_sys/component/get_names_url.dart';

class ModelHomeNewArticles {

  String? title;
  String?  image;
  int?  view;


  ModelHomeNewArticles({required this.title,required this.image,required this.view,});


  ModelHomeNewArticles.fromJson(Map<String,dynamic> element){

    title = element['title'];
    view = int.parse(element['view']);
    image = GetNamesUrl.baseAPI+ element['image'];

  }


}