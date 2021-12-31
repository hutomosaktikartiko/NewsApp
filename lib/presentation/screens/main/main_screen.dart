import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/core/config/custom_color.dart';
import 'package:news_app/core/config/custom_text_style.dart';
import 'package:news_app/core/utils/screen_navigator.dart';
import 'package:news_app/presentation/screens/main/pages/favorite/favorite_page.dart';
import 'package:news_app/presentation/screens/main/pages/home/home_page.dart';
import 'package:news_app/presentation/screens/news_search/news_search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int selectedIndex;
  late PageController pageController;

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
            children: <Widget>[
              HomePage(),
              FavoritePage(),
            ],
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
        onPressed: () => ScreenNavigator.startScreen(
          context,
          NewsSearchScreen(),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: CustomColor.main,
        unselectedItemColor: Color(0xFFE5E5E5),
        currentIndex: selectedIndex,
        selectedLabelStyle: CustomTextStyle.subHeading2,
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
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Berita Tersimpan",
            icon: Container(
              margin: EdgeInsets.only(bottom: 6),
              height: 20,
              child: Icon(MdiIcons.briefcaseCheckOutline),
            ),
          ),
        ],
      ),
    );
  }
}
