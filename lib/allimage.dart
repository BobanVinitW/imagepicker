

import 'package:flutter/material.dart';
import 'package:g_task1/pictures.dart';

class Home extends StatefulWidget {
  final List<Wallpaper> wallpapersList;

  const Home({Key? key, required this.wallpapersList}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final categories = List<String>.empty(growable: true);
  final categoryImages = List<String>.empty(growable: true);
  final desc = List<String>.empty(growable: true);
  @override
  void initState() {
    super.initState();

    widget.wallpapersList.forEach(
          (wallpaper) {
        var category = wallpaper.title;

        if (!categories.contains(category)) {
          categories.add(category);
          categoryImages.add(wallpaper.url);
          desc.add(wallpaper.desc);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryImages.length,
      itemBuilder: (BuildContext context, int index) {
        return InkResponse(
          child: ListTile(
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(categoryImages.elementAt(index),
            ),),
            title: Text(categories.elementAt(index),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            subtitle: Text(desc.elementAt(index),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),

          ),
        );
      }, //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //crossAxisCount: 1
    //),
    );
  }
}