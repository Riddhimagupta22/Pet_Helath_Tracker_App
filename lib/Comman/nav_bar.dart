import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Dashboard/View/homepage.dart';

import '../Modules/Pet Profile/view/pet_profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PageController _pageViewController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    Placeholder(),
    PetProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconSize = screenWidth * 0.065;
    final navbarHeight = screenWidth * 0.16;
    final fontSize = screenWidth * 0.025;

    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: navbarHeight,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFF0EFEF), width: 1)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(240, 169, 115, 1),
          iconSize: iconSize,
          selectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _pageViewController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'Assets/Icon/Icon.png',
                height: iconSize,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'Assets/Icon/cat.png',
                height: iconSize,
                color: Colors.white,
              ),
              label: 'Pet Mart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'Assets/Icon/paw.png',
                height: iconSize,
                color: Colors.white,
              ),
              label: 'Pet',
            ),
          ],
        ),
      ),
    );
  }
}
