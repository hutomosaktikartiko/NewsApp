import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/config/custom_color.dart';
import '../../../../../../data/models/api_return_value.dart';
import '../../../../../../data/models/news_model.dart';
import '../../../../../cubit/cubits.dart';
import '../../../../../widgets/custom_dialog.dart';
import '../../../../../widgets/news_save_card.dart';
import '../widgets/dismissible_background.dart';

class Loaded extends StatelessWidget {
  const Loaded({
    Key? key,
    required this.listNews,
  }) : super(key: key);

  final List<NewsModel> listNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: listNews.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Dismissible(
          key: ValueKey(listNews[index]),
          direction: DismissDirection.endToStart,
          confirmDismiss: (_) =>
              onConfirmDimiss(context: context, index: index),
          background: DimissibleBackground(),
          child: NewsSaveCard(
            news: listNews[index],
          ),
        ),
      ),
    );
  }

  Future<bool?> onConfirmDimiss({
    required BuildContext context,
    required int index,
  }) async {
    final bool result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Perhatian"),
        content: Text("Apakah anda yakin akan menghapus berita ini?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Iya"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Tidak"),
          ),
        ],
      ),
    );

    if (result) {
      ApiReturnValue<bool> result =
          context.read<NewsFavoriteCubit>().deleteNews(news: listNews[index]);

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
      return result.isSuccess;
    }
  }
}
