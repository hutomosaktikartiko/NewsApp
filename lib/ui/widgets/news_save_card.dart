part of 'widgets.dart';

class NewsSaveCard extends StatelessWidget {
  final News news;
  final Function onTap;

  NewsSaveCard(this.news, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: 16, left: defaultMargin, right: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: (news.urlToImage == null || news.urlToImage == "")
                        ? AssetImage("assets/placeholder.jpg")
                        : NetworkImage(
                            news.urlToImage,
                          ),
                    fit: BoxFit.cover),
              ),
              width:
                  (MediaQuery.of(context).size.width - 2 * defaultMargin / 2) /
                      4,
              height:
                  (MediaQuery.of(context).size.width - 2 * defaultMargin / 2) /
                      4,
            ),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: (MediaQuery.of(context).size.width -
                        2 * defaultMargin -
                        100),
                    child: Text(
                      news.title,
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      news.name,
                      style: blackTextFont.copyWith(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
