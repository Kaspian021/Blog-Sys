

import 'package:blog_sys/component/elements.dart';
import 'package:blog_sys/component/service.dart';
import 'package:blog_sys/component/temps.dart';
import 'package:blog_sys/controller/Home/home_controller.dart';
import 'package:blog_sys/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final box = GetStorage();
  final controller = Get.find<HomeController>();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var textstyle = Theme.of(context).textTheme;
    var sizeBody = MediaQuery.of(context).size.width / 12;
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 20,
        key: _key,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: true,
        backgroundColor: Colors.white,
        drawerScrimColor: Colors.black,
        //Drawer programm
        endDrawer:  Directionality(
          textDirection: TextDirection.rtl,

          

          
          
          child: Column(
            
            children:  [
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      //go to Screen profile
                  
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.blue,width: 1),
                        boxShadow: const [
                          BoxShadow(
                            
                            color: Colors.white,
                            blurRadius: 7
                          )
                        ]
                        // image: DecorationImage(image: ) image Profile person
                      ),
                      child: const Icon(Icons.person,color: Colors.black,size: 50,),
                    ),
                  ),
                  Image.asset(Assets.images.logoBlog.path,scale: 2,color: Colors.white,),
                ],
              ),
              
              
              const SizedBox(height: 80,),
              Container(
                  width: Get.width/2.1,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(color: Colors.white,blurRadius: 10)
                    ],
                    border: Border.all(color: Colors.blue,width: 1,style: BorderStyle.solid)
                  ),
                  child: Row(
                    
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.person,size: 35,),
                      const SizedBox(width: 5,),
                      Text('Support',style: textstyle.bodyLarge,),
                      
                    ],
                  ),
                ),
              const SizedBox(height: 20,),
              const Divider(
                color: Colors.blueAccent,
                endIndent: 40,
                indent: 40,

              ),
              const SizedBox(height: 10,),
              Container(
                  width: Get.width/2.1,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(color: Colors.white,blurRadius: 10)
                    ],
                    border: Border.all(color: Colors.blue,width: 1,style: BorderStyle.solid)
                  ),
                  child: Row(
                    
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.person,size: 35,),
                      const SizedBox(width: 5,),
                      Text('Support',style: textstyle.bodyLarge,),
                      
                    ],
                  ),
                ),
              const SizedBox(height: 20,),
              const Divider(
                color: Colors.blueAccent,
                endIndent: 40,
                indent: 40,

              ),
              const SizedBox(height: 20,),
              Container(
                  width: Get.width/2.1,
                  height: 40,
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(color: Colors.white,blurRadius: 10)
                    ],
                    border: Border.all(color: Colors.blue,width: 1,style: BorderStyle.solid)
                  ),
                  child: Row(
                    
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.person,size: 35,),
                      const SizedBox(width: 5,),
                      Text('Support',style: textstyle.bodyLarge,),
                      
                    ],
                  ),
                ),
              
            ],
          ),

        ),

        //bottomNavigationBar
        bottomNavigationBar: Container(
          height: Get.height / 9.90,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10.0)],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home_sharp, size: 30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.article_rounded, size: 30),
                  ),
                  Container(
                    height: Get.height / 15,
                    width: Get.height / 15,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.add, size: 40, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded, size: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                      
                    },
                    icon: const Icon(Icons.menu, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              //appbar
              Padding(
                padding: EdgeInsets.fromLTRB(
                  sizeBody,
                  Get.height / 20,
                  sizeBody,
                  10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Hi, ${!controller.isLogin.value ? box.read(SaveToken.userName) : null}',
                        style: textstyle.titleMedium,
                      ), //username
                    ),
                    const Icon(Icons.notifications_active_outlined),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Top seller relativ to the Articles
              Padding(
                padding: EdgeInsets.only(left: sizeBody),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Top Seller's", style: textstyle.bodyLarge),
                ),
              ),
              const SizedBox(height: 10),
              //list_Sellers
              SizedBox(
                height: Get.height / 7.5,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, //test
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? sizeBody : 20,
                        right: index == 9 ? sizeBody : 0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width / 5.54,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),

                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: Get.height / 160.94,
                                left: Get.width / 70.94,
                                bottom: Get.height / 160.94,
                                right: Get.width / 70.94,
                              ),
                              child: Container(
                                height: Get.height / 11.94,
                                width: Get.width / 6.94,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Assets.images.graphic.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'name',
                            style: textstyle.bodySmall,
                          ), //Names Sellers
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35),
              //list subject articles
              SizedBox(
                height: Get.height / 2.97,

                child: ListView.builder(
                  primary: false,

                  itemCount: 5, //test
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? sizeBody : 15,
                        right: index == 4 ? sizeBody : 10,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: Get.height / 2.97,
                            width: Get.width / 1.58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.images.motherBoard.path,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            foregroundDecoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: ColorsConst.topSubjectArticles,
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.width / 2,
                              left: 20,
                            ),
                            child: Text(
                              'Technology',
                              style: textstyle.bodyMedium,
                            ), //Names topSubjectArticles
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              //News Articles
              Padding(
                padding: EdgeInsets.only(left: sizeBody, right: sizeBody),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Latest News',
                        style: textstyle.headlineMedium,
                      ),
                    ),
                    const Text(
                      'More',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //list_News_Articles
              Obx(
                () => !controller.isloading.value ? Column(
                  children:
                      controller.listArticlesNews
                          .map((f) => _buildArticleItem(f, textstyle, sizeBody))//list_neverScroller with Column
                          .toList(),
                ):loading(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //Articles_New
  Widget _buildArticleItem(article, textstyle, sizeBody) {
    return  Padding(
        padding: EdgeInsets.only(
          left: sizeBody,
          right: sizeBody,
          bottom: sizeBody,
        ),
        child: Obx(
          ()=> !controller.isloading.value? Stack(
            children: [
              Container(
                height: Get.height / 4.5,
                width: Get.width/1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 10.0, color: Colors.black12),
                  ],
                  
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                
              ),
              CachedNetworkImage(
                imageBuilder: (context, imageProvider) {
                  
                  return Container(
                  width: Get.width/2.7,
                  height: Get.height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage(article.image), fit: BoxFit.cover,),
                  ),
                );
                }, imageUrl: article.image,
                errorWidget: (context, url, error) => const Icon(Icons.image),
                placeholder: (context, url) => loading(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    SizedBox(
                      width: Get.width/2.2,
                      
                      child: RichText(
                          text: TextSpan(
                            text: article.title,
                            
                          style: const TextStyle(fontSize: 13,color: Colors.black),
                          ),
                          overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.right,
                          
                        ),
                    ),
                  ],
                ),
              ),
              
            ],
          ): loading(),
        ),
      
    );
  }
}
