part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        color: accentColor1,
      ),
      SafeArea(
          child: Container(
        color: Color(0xFFFF6F7F9),
      )),
      PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            bottomNavBarIndex = index;
          });
        },
        children: <Widget>[NewsPage(), NewsSavePage()],
      ),
      createCustomBottonNavBar(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 46,
          height: 46,
          margin: EdgeInsets.only(bottom: 42),
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.blue,
              child: SizedBox(
                width: 26,
                height: 26,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.bloc<PageBloc>().add(GoToNewsBySearch());
              }),
        ),
      )
    ]));
  }

  Widget createCustomBottonNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            constraints: BoxConstraints(maxHeight: 83, minHeight: 70),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: Color(0xFFE5E5E5),
                currentIndex: bottomNavBarIndex,
                selectedLabelStyle: GoogleFonts.raleway(
                    fontSize: 13, fontWeight: FontWeight.w600),
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
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
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
