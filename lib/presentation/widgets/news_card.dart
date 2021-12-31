import 'package:flutter/material.dart';
import 'package:news_app/core/config/custom_text_style.dart';
import 'package:news_app/core/config/size_config.dart';
import 'package:news_app/core/utils/screen_navigator.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/presentation/screens/news_detail/news_detail_screen.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  NewsCard({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ScreenNavigator.startScreen(
        context,
        NewsDetailScreen(news: news),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                height: SizeConfig.screenWidth / 2,
                fit: BoxFit.cover,
                width: SizeConfig.screenWidth,
                placeholder: AssetImage("assets/images/placeholder.jpg"),
                image: NetworkImage(news.urlToImage ?? ""),
              ),
            ),
            SizedBox(height: 8),
            Text(
              news.title ?? "-",
              style: CustomTextStyle.body1.copyWith(color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              news.description ?? "-",
              style: CustomTextStyle.body2.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
