import 'package:flutter/material.dart';
import 'package:news_api/controller/categorycontroller.dart';
import 'package:provider/provider.dart';

import '../home_screen/widget/widget.dart';

class CategoryScreen extends StatefulWidget {
  final String categorys;

  const CategoryScreen({
    super.key,
    required this.categorys,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CategoryController>(context, listen: false);
    provider.getCategoryNews(widget.categorys);
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryController>(context);

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
      body: categoryProvider.loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(),
              ),
            ) //categories
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoryProvider.articlnews.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: categoryProvider
                                    .articlnews[index].urlToImage
                                    .toString(),
                                title: categoryProvider.articlnews[index].title
                                    .toString(),
                                description: categoryProvider
                                    .articlnews[index].description
                                    .toString(),
                                url: categoryProvider.articlnews[index].url
                                    .toString(),
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
