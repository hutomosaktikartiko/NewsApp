import 'package:flutter/material.dart';

import '../../core/config/custom_text_style.dart';
import '../../core/config/size_config.dart';
import '../../core/utils/screen_navigator.dart';
import '../../data/models/news_model.dart';
import '../screens/news_detail/news_detail_screen.dart';

class NewsSaveCard extends StatelessWidget {
  final NewsModel news;
  NewsSaveCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ScreenNavigator.startScreen(
        context,
        NewsDetailScreen(news: news),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: FadeInImage(
              width:
                  (SizeConfig.screenWidth - 2 * SizeConfig.defaultMargin / 2) /
                      4,
              height:
                  (SizeConfig.screenWidth - 2 * SizeConfig.defaultMargin / 2) /
                      4,
              fit: BoxFit.cover,
              placeholder: AssetImage("assets/images/placeholder.jpg"),
              image: NetworkImage(news.urlToImage ?? ""),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: (SizeConfig.screenWidth -
                        2 * SizeConfig.defaultMargin -
                        100),
                    child: Text(
                      news.title ?? "-",
                      style: CustomTextStyle.body1,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      news.author ?? "-",
                      style: CustomTextStyle.body2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
