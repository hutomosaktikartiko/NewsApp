part of 'widgets.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final Function onTap;

  NewsCard(this.news, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: (news.urlToImage == null || news.urlToImage == "")
                    ? Image.asset("assets/placeholder.jpg")
                    : Image.network(
                        news.urlToImage,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            height: (MediaQuery.of(context).size.width -
                                    2 * defaultMargin) /
                                2,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            ),
                          );
                        },
                      )),
            SizedBox(height: 8),
            Text(
              news.title,
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              news.description ?? "",
              style: blackTextFont.copyWith(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
