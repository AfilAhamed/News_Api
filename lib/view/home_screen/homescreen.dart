import 'package:flutter/material.dart';
import 'package:news_api/controller/homescreencontroller.dart';
import 'package:news_api/helpers/category_images.dart';

import 'package:news_api/view/home_screen/widget/widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HomeControl>(context, listen: false);
    provider.getNews();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeControl>(context);

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
      body: homeProvider.loading
          ? const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    //categories section
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 70,
                      child: ListView.builder(
                        itemCount: imageCategories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            categoryName:
                                imageCategories[index].categoryName.toString(),
                            imageUrl:
                                imageCategories[index].imageUrl.toString(),
                          );
                        },
                      ),
                    ),
                    //blog article section
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeProvider.articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: homeProvider.articles[index].urlToImage
                                .toString(),
                            title:
                                homeProvider.articles[index].title.toString(),
                            description: homeProvider
                                .articles[index].description
                                .toString(),
                            url: homeProvider.articles[index].url.toString(),
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
