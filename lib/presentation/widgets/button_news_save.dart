import 'package:flutter/material.dart';
import 'package:news_app/core/config/custom_color.dart';
import 'package:news_app/data/models/api_return_value.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/presentation/cubit/news_favorite/news_favorite_cubit.dart';
import 'package:news_app/presentation/widgets/custom_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonNewsSave extends StatelessWidget {
  const ButtonNewsSave({
    Key? key,
    required this.isNewsSaved,
    required this.news,
  }) : super(key: key);

  final bool isNewsSaved;
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: Icon(
        (isNewsSaved) ? Icons.favorite : Icons.favorite_border,
      ),
      onPressed: () async {
        if (isNewsSaved) {
          // Unsave news
          ApiReturnValue<bool> result =
              context.read<NewsFavoriteCubit>().deleteNews(news: news);
          if (result.isSuccess) {
            CustomDialogs.showToast(
              message: result.message,
              context: context,
              backgroundColor: UniversalColor.green4,
            );
          } else {
            CustomDialogs.showToast(
              message: result.message,
              context: context,
              backgroundColor: UniversalColor.red,
            );
          }
        } else {
          // Save News
          ApiReturnValue<bool> result =
              context.read<NewsFavoriteCubit>().saveNews(news: news);
          if (result.isSuccess) {
            CustomDialogs.showToast(
              message: result.message,
              context: context,
              backgroundColor: UniversalColor.green4,
            );
          } else {
            CustomDialogs.showToast(
              message: result.message,
              context: context,
              backgroundColor: UniversalColor.red,
            );
          }
        }
      },
    );
  }
}
