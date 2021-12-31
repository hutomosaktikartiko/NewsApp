import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/models/category_model.dart';

part 'tab_category_state.dart';

class TabCategoryCubit extends Cubit<TabCategoryState> {
  TabCategoryCubit() : super(TabCategoryState(category: mockListCategories.first));

  void changeTab({
    required CategoryModel category,
  }) {
    emit(
      TabCategoryState(category: category),
    );
  }
}
