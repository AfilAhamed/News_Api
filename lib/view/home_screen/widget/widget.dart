import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/view/article_news/articlescreen.dart';
import 'package:news_api/view/category_news/categoryscreen.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryTile(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(
                  categorys: categoryName.toString().toLowerCase()),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              width: 120,
              height: 60,
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.url});

  final String imageUrl, title, description, url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleScreen(blogUrl: url),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(
              height: 2,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
