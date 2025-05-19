import 'package:blog_sys/component/temps.dart';
import 'package:blog_sys/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textstyle = Theme.of(context).textTheme;
    var sizeBody = MediaQuery.of(context).size.width / 12;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: Get.height/9.90,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(

                color: Colors.black,
                blurRadius: 10.0
              )
            ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.home_sharp,size: 30,)),
                  IconButton(onPressed: (){}, icon:  const Icon(Icons.article_rounded,size: 30,)),
                  Container(
                    height: Get.height/15,
                    width: Get.height/15,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(100)
              
                    ),
                    child: const Icon(Icons.add,size: 40,color: Colors.white,),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded,size: 30,)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.menu,size: 30,)),
                  
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
                      child: Text('Hi, Kaspian', style: textstyle.titleMedium),//username
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
                      padding: EdgeInsets.only(left: index == 0 ? sizeBody : 20),
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
                                    image: AssetImage(Assets.images.graphic.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                           Text('name',style: textstyle.bodySmall,),//Names Sellers
          
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35,),
              //list subject articles  
              SizedBox(
                height: Get.height/2.97,
                
                child: ListView.builder(
                  itemCount: 5, //test
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: index==0? sizeBody:15),
                      child: Stack(
                        children: [
                          Container(
                            height: Get.height/2.97,
                            width: Get.width/1.58,
                            decoration:  BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(Assets.images.motherBoard.path),
                                fit: BoxFit.fill,
                          
                              ),
                              
                              
                          
                            ),
                            foregroundDecoration:  BoxDecoration(
                              gradient: const LinearGradient(
                                colors: ColorsConst.topSubjectArticles,
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            
                          ),
                          Padding(
                          padding:  EdgeInsets.only(top: Get.width/2,left: 20 ),
                          child: Text('Technology',style: textstyle.bodyMedium,),//Names topSubjectArticles
                        ),
                        ],
                      ),
                    );
          
                    
                  },                
                ),
          
              )
            ],
          ),
        ),
      ),
    );
  }
}
