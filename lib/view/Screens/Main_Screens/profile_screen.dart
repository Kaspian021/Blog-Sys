import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    var textStyle= Theme.of(context).textTheme;
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('profile',style: textStyle.bodyLarge,),
              PullDownButton(itemBuilder: (context) => [

                PullDownMenuItem(onTap: (){}, title: 'Chenge UserName',itemTheme: PullDownMenuItemTheme(textStyle: textStyle.bodyMedium),)
              ]
                 
              , buttonBuilder: (context, showMenu) => CupertinoButton(onPressed: showMenu, child: const Icon(CupertinoIcons.ellipsis)),)
            ],
          )
        ],
      ),
    ));
  }
}