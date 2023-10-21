import 'package:flutter/material.dart';
import 'package:news_api/helpers/category_images.dart';
import 'package:news_api/model/article_model.dart/articlemodel.dart';
import 'package:news_api/model/category_model.dart/categorymodel.dart';
import 'package:news_api/services/news_services.dart';
import 'package:news_api/view/home_sceen/widget/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoriess = <CategoryModel>[];

  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getNews() async {
    NewsServices newsServices = NewsServices();
    await newsServices.getNews();
    articles = newsServices.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriess = categories;
    getNews();
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
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      height: 70,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            categoryName: categories[index].categoryName,
                            imageUrl: categories[index].imageUrl,
                          );
                        },
                      ),
                    ), //blog

                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage.toString(),
                            title: articles[index].title.toString(),
                            description: articles[index].description.toString(),
                            url: articles[index].url.toString(),
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
