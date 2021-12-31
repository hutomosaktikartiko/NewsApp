import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/custom_text_style.dart';
import '../../../../../core/config/size_config.dart';
import '../../../../../data/models/category_model.dart';
import '../../../../cubit/cubits.dart';
import '../../../../cubit/tab_category/tab_category_cubit.dart';
import '../../../../widgets/category_model.dart';
import 'states/empty.dart';
import 'states/error.dart';
import 'states/loaded.dart';
import 'states/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getListNewsTopHeadlinesByCategory(
        category: context.read<TabCategoryCubit>().state.category);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
              child: Text(
                "Kategori",
                style: CustomTextStyle.subHeading1.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<TabCategoryCubit, TabCategoryState>(
              listener: (context, state) {
                context.read<NewsCubit>().getListNewsTopHeadlinesByCategory(
                    category: state.category);
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mockListCategories
                        .asMap()
                        .map(
                          (key, value) => MapEntry(
                            key,
                            Padding(
                              padding: EdgeInsets.only(
                                left:
                                    (key == 0) ? SizeConfig.defaultMargin : 10,
                                right: key == mockListCategories.length - 1
                                    ? SizeConfig.defaultMargin
                                    : 0,
                              ),
                              child: CategoryCard(
                                category: value,
                                isActive: state.category == value,
                              ),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoaded) {
                    if (state.listNews.length > 0) {
                      return Loaded(
                        listNews: state.listNews,
                      );
                    } else {
                      return Empty();
                    }
                  } else if (state is NewsLoadingFailure) {
                    return Error(
                      message: state.message,
                    );
                  } else {
                    return Loading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
