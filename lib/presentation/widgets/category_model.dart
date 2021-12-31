import 'package:flutter/material.dart';
import 'package:news_app/core/config/custom_text_style.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/cubit/tab_category/tab_category_cubit.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final bool isActive;

  CategoryCard({
    required this.category,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          context.read<TabCategoryCubit>().changeTab(category: category);
        }
      },
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: FadeInImage(
              placeholder: AssetImage("assets/images/placeholder.jpg"),
              image: NetworkImage(category.imageUrl ?? ""),
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (isActive) ? Colors.black54 : Colors.black26,
            ),
            child: Text(
              category.category ?? "-",
              style: CustomTextStyle.body2.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
