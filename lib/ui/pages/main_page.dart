part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: <Widget>[NewsPage(), NewsSavePage()],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          context.bloc<PageBloc>().add(GoToNewsBySearch());
        },
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: mainColor,
          unselectedItemColor: Color(0xFFE5E5E5),
          currentIndex: selectedIndex,
          selectedLabelStyle:
              GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w600),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Berita Terbaru",
                icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(
                      MdiIcons.newspaperVariantOutline,
                    ))),
            BottomNavigationBarItem(
                label: "Berita Tersimpan",
                icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(MdiIcons.briefcaseCheckOutline))),
          ]),
    );
  }
}
