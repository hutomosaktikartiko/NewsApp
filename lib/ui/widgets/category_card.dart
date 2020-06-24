part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final Function onTap;

  CategoryCard(this.categoryModel, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: categoryModel.imageURl,
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
              color: Colors.black26,
            ),
            child: Text(categoryModel.categoryName,
                style: whiteTextFont.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
