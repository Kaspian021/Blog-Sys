
import 'package:blog_sys/controller/Main_Screens/home_controller.dart';
import 'package:blog_sys/view/Screens/Main_Screens/Articles/article_screen.dart';
import 'package:blog_sys/view/Screens/Main_Screens/Home/drawer_widget.dart';
import 'package:blog_sys/view/Screens/Main_Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  final box = GetStorage();

  final controller = Get.find<HomeController>();

  final GlobalKey<ScaffoldState> _keyGlobal = GlobalKey();

  int _selectPage= 0;

  @override
  Widget build(BuildContext context) {
    var textstyle = Theme.of(context).textTheme;
    var sizeBody = MediaQuery.of(context).size.width / 12;
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 20,
        key: _keyGlobal,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: true,
        backgroundColor: Colors.white,
        drawerScrimColor: Colors.black,
        //Drawer programm
        endDrawer: DrawerBlogSys(textstyle: textstyle),

        //bottomNavigationBar
        bottomNavigationBar: BottomNavigationBlogSys(keyGlobal: _keyGlobal, currentPage:(current) {
          
          setState(() {
            _selectPage= current;
          });

        }, ),

        body: IndexedStack(
          index: _selectPage,

          children: [
            HomePage(
              sizeBody: sizeBody,
              controller: controller,
              box: box,
              textstyle: textstyle,
            ),
             ArticleScreen(),
            
          ],
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class BottomNavigationBlogSys extends StatefulWidget {
  const BottomNavigationBlogSys({
    super.key,
    required GlobalKey<ScaffoldState> keyGlobal,
    required this.currentPage
  }) : _keyGlobal = keyGlobal;

  final Function(int current) currentPage;

  final GlobalKey<ScaffoldState> _keyGlobal;

  @override
  State<BottomNavigationBlogSys> createState() => _BottomNavigationBlogSysState();
}

class _BottomNavigationBlogSysState extends State<BottomNavigationBlogSys> {

  int colorIcon= 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  onPressed: () {
                    setState(() {
                      widget.currentPage(0);
                    colorIcon=0;
                    });
                  },
                  icon:  Icon(Icons.home_sharp, size: 30,color: colorIcon==0? Colors.blue: Colors.black,),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.currentPage(1);
                    colorIcon=1;
                    });
                  },
                  icon:  Icon(Icons.article_rounded, size: 30,color: colorIcon==1? Colors.blue: Colors.black,),
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
                  onPressed: () {
                    setState(() {
                      
                      widget.currentPage(2);
                    colorIcon=2;
                    });
                  },
                  icon:  Icon(Icons.search_rounded, size: 30,color: colorIcon==2? Colors.blue: Colors.black,),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget._keyGlobal.currentState!.openDrawer();
                      
                    });
                    
                  },
                  icon: const Icon(Icons.menu, size: 30,color: Colors.black,),
                ),
              ],
            ),
          
        ],
      ),
    );
  }
}
