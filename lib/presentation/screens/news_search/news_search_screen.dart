import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/custom_text_style.dart';
import 'package:news_app/core/config/size_config.dart';
import 'package:news_app/core/utils/screen_navigator.dart';
import 'package:news_app/core/utils/utils.dart';
import 'package:news_app/presentation/cubit/cubits.dart';
import 'states/empty.dart';
import 'states/loading.dart';
import 'states/loaded.dart';
import 'states/error.dart';

class NewsSearchScreen extends StatefulWidget {
  const NewsSearchScreen({Key? key}) : super(key: key);

  @override
  _NewsSearchScreenState createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NewsSearchCubit>().listNewsTopHeadlines();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 56,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => ScreenNavigator.closeScreen(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Cari Berita",
                        style: CustomTextStyle.subHeading1.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Cari berita",
                ),
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  Utils.hideKeyboard(context: context);

                  context.read<NewsSearchCubit>().listNewsTopHeadlinesSearch(
                      keyword: searchController.text);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Hasil pencarian...",
                style:
                    CustomTextStyle.subHeading2.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<NewsSearchCubit, NewsSearchState>(
                builder: (context, state) {
                  if (state is NewsSearchLoaded) {
                    if (state.listNews.length > 0) {
                      return Loaded(listNews: state.listNews);
                    } else {
                      return Empty();
                    }
                  } else if (state is NewsSearchLoadingFailure) {
                    return Error(
                      message: state.message,
                    );
                  } else {
                    return Loading();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
