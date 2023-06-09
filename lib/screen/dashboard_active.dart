import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:bam_ui/theme/bam.colors.dart';

import 'package:bam_ui/screen/dashboard/page.dart';
import 'package:bam_ui/screen/info/page.dart';
import 'package:bam_ui/screen/panggilan/page.dart';
import 'package:bam_ui/screen/servisan/page.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    ServisanScreen(),
    PanggilanScreen(),
    InfoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeScaleTransition(
              animation: primaryAnimation,
              child: child,
            );
          },
          child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: secondary_color.withOpacity(0.25),
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: black_color,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? accent_color : secondary_color,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.laptop_mac,
                  color: _selectedIndex == 1 ? accent_color : secondary_color,
                ),
                label: 'Servisan',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.call,
                  color: _selectedIndex == 2 ? accent_color : secondary_color,
                ),
                label: 'Panggilan',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.info,
                  color: _selectedIndex == 3 ? accent_color : secondary_color,
                ),
                label: 'Info',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: accent_color,
            unselectedItemColor: secondary_color,
            selectedLabelStyle: GoogleFonts.lato(fontWeight: FontWeight.w700),
            unselectedLabelStyle: GoogleFonts.lato(fontWeight: FontWeight.w700),
            onTap: _onItemTapped,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
