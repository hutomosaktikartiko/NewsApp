import 'package:flutter/material.dart';
import 'package:news_app/core/config/size_config.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/presentation/widgets/news_card.dart';

class Loaded extends StatelessWidget {
  const Loaded({
    Key? key,
    required this.listNews,
  }) : super(key: key);

  final List<NewsModel> listNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: listNews.length,
      itemBuilder: (_, index) => NewsCard(
        news: listNews[index],
      ),
    );
  }
}
