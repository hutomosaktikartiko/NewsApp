part of 'models.dart';

class CategoryModel extends Equatable {
  final String categoryName;
  final String imageURl;

  CategoryModel({this.categoryName, this.imageURl});

  @override
  List<Object> get props => [categoryName, imageURl];
}

List<CategoryModel> listCategories = [
  CategoryModel(
      categoryName: "Business",
      imageURl:
          "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80"),
  CategoryModel(
      categoryName: "Entertainment",
      imageURl:
          "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
  CategoryModel(
      categoryName: "Health",
      imageURl:
          "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
  CategoryModel(
      categoryName: "Science",
      imageURl:
          "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
  CategoryModel(
      categoryName: "Sports",
      imageURl:
          "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
  CategoryModel(
      categoryName: "Technology",
      imageURl:
          "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
];
