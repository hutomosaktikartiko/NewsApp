part of 'tab_category_cubit.dart';

class TabCategoryState extends Equatable {
  final CategoryModel category;

  TabCategoryState({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
