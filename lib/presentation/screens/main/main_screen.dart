import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/config/custom_color.dart';
import '../../../core/config/custom_text_style.dart';
import '../../../core/utils/screen_navigator.dart';
import '../news_search/news_search_screen.dart';
import 'pages/favorite/favorite_page.dart';
import 'pages/home/home_page.dart';

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
        selectedLabelStyle: CustomTextStyle.body1,
        unselectedLabelStyle: CustomTextStyle.body1,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: [
          buildBottomNavigationBarItem(
            label: "Berita Terbaru",
            iconData: MdiIcons.newspaperVariantOutline,
          ),
          buildBottomNavigationBarItem(
            label: "Berita Tersimpan",
            iconData: MdiIcons.briefcaseCheckOutline,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String label,
    required IconData iconData,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        margin: EdgeInsets.only(bottom: 6),
        height: 20,
        child: Icon(iconData),
      ),
    );
  }
}
