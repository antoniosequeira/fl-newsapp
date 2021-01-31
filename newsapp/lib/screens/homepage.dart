import 'package:flutter/material.dart';
import 'package:newsapp/models/category.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search))
        ],
        centerTitle: true,
        title: Text(
          'DailyNews', 
          style: TextStyle(fontSize: 25)
          ),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          //Category
          SizedBox(height: 10,),
          Text(
            'Category', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 30
          )),
          Container(
            height: 135,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorieslist.categories.length,
              itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryCard(
                  imgUrl: categorieslist.categories[index].imageAssetUrl,
                  categoryName: categorieslist.categories[index].categoryname ,),
              );
              },
            ),
          ),
          //Newslist
          SizedBox(height: 10,),
          Text(
            'Latest News', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 30
            )
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imgUrl, categoryName;

  CategoryCard({this.imgUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            height: 200,
            width: 180,
          ),
        ),
        Container(
          height: 200,
          width: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            )

          ),
        )
      ],
      
    );
  }
}