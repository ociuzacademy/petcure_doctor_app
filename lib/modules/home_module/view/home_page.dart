import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/bookings_list_widget.dart';
import 'package:petcure_doctor_app/modules/home_module/widgets/profile_widget.dart';
import 'package:petcure_doctor_app/modules/login_module/view/login_page.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/view/treatment_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static route() => MaterialPageRoute(builder: (context) => HomePage());
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final PageController _pageController = PageController();

  late List<Widget> _appBodies;

  @override
  void initState() {
    _appBodies = [BookingsListWidget(), ProfileWidget()];
    super.initState();
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(context, LoginPage.route(), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Who'),
        titleTextStyle: const TextStyle(
          color: AppPalette.firstColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppPalette.secondColor,
          backgroundColor: AppPalette.thirdColor,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                color: AppPalette.thirdColor,
              ); // Icon color for selected item
            }
            return IconThemeData(
              color: AppPalette.firstColor,
            ); // Icon color for unselected items
          }),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                color: AppPalette.firstColor, // Text color for selected item
                fontWeight: FontWeight.bold,
              );
            }
            return const TextStyle(
              color: AppPalette.blackColor, // Text color for unselected items
              fontWeight: FontWeight.normal,
            );
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          selectedIndex: _currentPageIndex,
          // labelBehavior: ,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.vaccines), label: "Booking"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: _appBodies,
      ),
      drawer: Drawer(
        backgroundColor: AppPalette.thirdColor,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppPalette.firstColor),
              child: Text(
                'PetCure',
                style: TextStyle(
                  color: AppPalette.thirdColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history, color: AppPalette.firstColor),
              title: const Text(
                'Treatment History',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(context, TreatmentListPage.route());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppPalette.firstColor),
              title: const Text(
                'Log out',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
