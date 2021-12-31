import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/custom_text_style.dart';
import '../../../../../core/config/size_config.dart';
import '../../../../cubit/news_favorite/news_favorite_cubit.dart';
import 'states/empty.dart';
import 'states/loaded.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Berita Tersimpan",
                style: CustomTextStyle.subHeading1.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<NewsFavoriteCubit, NewsFavoriteState>(
                builder: (context, state) {
                  if (state.listNews.length > 0) {
                    return Loaded(
                      listNews: state.listNews,
                    );
                  } else {
                    return Empty();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
