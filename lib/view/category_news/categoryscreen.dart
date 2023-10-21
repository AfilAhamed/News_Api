import 'package:flutter/material.dart';
import 'package:news_api/helpers/category_images.dart';

import '../../model/article_model.dart/articlemodel.dart';
import '../../services/category_new.dart';
import '../home_sceen/widget/widget.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _loading = true;

  List<ArticleModel> articlnews = [];

  getCategoryNews() async {
    CategoryNews newsServices = CategoryNews();
    await newsServices.getNewss(widget.category);
    articlnews = newsServices.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text.rich(TextSpan(children: <InlineSpan>[
          TextSpan(
            text: 'Flutter ',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: 'News',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          )
        ])),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ) //categories
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: articlnews.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl:
                                    articlnews[index].urlToImage.toString(),
                                title: articlnews[index].title.toString(),
                                description:
                                    articlnews[index].description.toString(),
                                url: articlnews[index].url.toString(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
