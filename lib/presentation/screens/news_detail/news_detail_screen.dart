import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/config/size_config.dart';
import '../../../core/utils/screen_navigator.dart';
import '../../../data/models/news_model.dart';
import '../../cubit/cubits.dart';
import '../../cubit/news_favorite/news_favorite_cubit.dart';
import '../../widgets/button_news_save.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    Key? key,
    required this.news,
  }) : super(key: key);

  final NewsModel news;

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsFavoriteCubit, NewsFavoriteState>(
      builder: (context, newsFavoriteState) {
        print(newsFavoriteState.listNews.length);
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  WebView(
                    initialUrl: widget.news.url,
                    onWebViewCreated: (WebViewController webViewController) {
                      _completer.complete(webViewController);
                    },
                  ),
                  //icon back
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: SizeConfig.defaultMargin),
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.5)),
                    child: GestureDetector(
                      onTap: () => ScreenNavigator.closeScreen(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: ButtonNewsSave(
            isNewsSaved: newsFavoriteState.listNews.contains(widget.news),
            news: widget.news,
          ),
        );
      },
    );
  }
}
