import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:your_app_name/home_body.dart';
import 'package:your_app_name/screens/explore_screen.dart';
import 'package:your_app_name/screens/report_screen.dart';
import 'package:your_app_name/screens/support.dart';
import 'package:your_app_name/screens/support_screen.dart';
import 'package:your_app_name/screens/updates_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}
/*
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
  backgroundColor: Colors.white, // Background color for the navigation
  color: Colors.black,           // Color for the icons when inactive
  activeColor: Colors.blue,      // Color for the icons when active
  gap: 8,                        // Space between the items
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding inside each button
  tabs: [
    GButton(
      icon: Icons.circle,  // Placeholder icon to satisfy non-null requirement
      iconColor: Colors.transparent, // Make the placeholder icon invisible
      leading: Image.asset(
        "assets/images/Explore.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Explore',
    ),
    GButton(
      icon: Icons.circle,  // Placeholder icon for the support tab
      iconColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/support.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Support',
    ),
    GButton(
      icon: Icons.circle,  // Placeholder icon for the updates tab
      iconColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/updates.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Updates',
    ),
    GButton(
      icon: Icons.circle,  // Placeholder icon for the report tab
      iconColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/report.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Report',
    ),
  ],
)


    );
  }
}*/
/*class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //index of current page
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [
    ExploreScreen(),
    SupportPage(),
    UpdatesScreen(),
    ReportScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 212, 246, 167),
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          showSelectedLabels: true, // Add this line
          showUnselectedLabels: true, // Add this line
          selectedItemColor:
              Colors.black, // Change selected label color to black
          unselectedItemColor: Colors.black,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/Explore.png", height: 20, // Explicit height
                  width: 20, // Explicit width
                ),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/support.png",
                  height: 20, // Explicit height
                  width: 20,
                  color: const Color.fromARGB(102, 0, 0, 0), // Explicit width
                ),
                label: 'Support'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/updates.png",
                  height: 20, // Explicit height
                  width: 20, // Explicit width
                ),
                label: 'Updates'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/report.png",
                  height: 20, // Explicit height
                  width: 20, // Explicit width
                ),
                label: 'Report'),
          ]),
    );
  }
}*/

/*class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //index of current page
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [
    ExploreScreen(),
    SupportPage(),
    UpdatesScreen(),
    ReportScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
  backgroundColor: Colors.white, // Background color for the navigation
  color: Colors.black,           // Color for the icons when inactive
  activeColor: Colors.blue,      // Color for the icons when active
  gap: 8,                        // Space between the items
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding inside each button
  tabs: [
    GButton(
      icon: Icons.circle,  // Placeholder icon to satisfy non-null requirement
      iconColor: Colors.transparent, // Make the placeholder icon invisible
      leading: Image.asset(
        "assets/images/Explore.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Explore',
    ),
    GButton(
      icon: Icons.circle,  // Placeholder icon for the support tab
      iconColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/support.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Support',
    ),
    GButton(
      icon: Icons.circle,  // Placeholder icon for the updates tab
      iconColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/updates.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Updates',
    ),
    GButton(
      icon: Icons.circle,  // Placeholder icon for the report tab
      iconColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/report.png",
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
      text: 'Report',
    ),
  ],
)
    );
  }
}*/
/*class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the current page

  // Function to handle navigation
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages to navigate to
  final List<Widget> _pages = [
    ExploreScreen(),
    SupportPage(),
    UpdatesScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFFD4F6A7), // Background color for the navigation
        color: Colors.black,                // Color for the icons when inactive
        activeColor: Color(0xFF526732),           // Color for the icons when active
        gap: 8,                             // Space between the items
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Button padding
        selectedIndex: _selectedIndex,      // Current active index
        onTabChange: _navigateBottomBar,    // Handle tab change
        tabs: [
          GButton(
            icon: Icons.circle,  // Placeholder icon to satisfy non-null requirement
            iconColor: Colors.transparent, // Make the placeholder icon invisible
            leading: Image.asset(
              "assets/images/Explore.png",
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
            text: 'Explore',
            textStyle: TextStyle(color: Color(0xFF526732)), // Label color
          ),
          GButton(
            icon: Icons.circle,  // Placeholder icon for the support tab
            iconColor: Colors.transparent,
            leading: Image.asset(
              "assets/images/support.png",
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
            text: 'Support',
            textStyle: TextStyle(color: Color(0xFF526732)), // Label color
          ),
          GButton(
            icon: Icons.circle,  // Placeholder icon for the updates tab
            iconColor: Colors.transparent,
            leading: Image.asset(
              "assets/images/updates.png",
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
            text: 'Updates',
            textStyle: TextStyle(color: Color(0xFF526732)), // Label color
          ),
          GButton(
            icon: Icons.circle,  // Placeholder icon for the report tab
            iconColor: Colors.transparent,
            leading: Image.asset(
              "assets/images/report.png",
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
            text: 'Report',
            textStyle: TextStyle(color: Color(0xFF526732)), // Label color
          ),
        ],
      ),
    );
  }
}*/
/*class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the current page

  // Function to handle navigation
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages to navigate to
  final List<Widget> _pages = [
    ExploreScreen(),
    SupportPage(),
    UpdatesScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Container(
        
        margin: EdgeInsets.all(16), // Margin to give spacing around the bar
        decoration: BoxDecoration(
          color: Color(0xFFD4F6A7), // Background color
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, 5), // Add some shadow for a subtle floating effect
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0), // Padding inside the container
          child: GNav(
            color: Colors.black,           // Color for inactive icons
            activeColor: Colors.blue,      // Color for active icons
            gap: 8,                        // Space between items
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
            selectedIndex: _selectedIndex, // Current active index
            onTabChange: _navigateBottomBar, // Handle tab changes
            tabs: [
              GButton(
                icon: Icons.circle, // Placeholder icon
                iconColor: Colors.transparent, // Make icon invisible
                leading: Image.asset(
                  "assets/images/Explore.png",
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                text: 'Explore',
                textStyle: TextStyle(color: Color(0xFF526732)), // Label color
              ),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                leading: Image.asset(
                  "assets/images/support.png",
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                text: 'Support',
                textStyle: TextStyle(color: Color(0xFF526732)),
              ),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                leading: Image.asset(
                  "assets/images/updates.png",
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                text: 'Updates',
                textStyle: TextStyle(color: Color(0xFF526732)),
              ),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                leading: Image.asset(
                  "assets/images/report.png",
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                text: 'Report',
                textStyle: TextStyle(color: Color(0xFF526732)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the current page

  // Function to handle navigation
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages to navigate to
  final List<Widget> _pages = [
    ExploreScreen(),
    SupportPage(),
    UpdatesScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Extend body behind the navigation bar
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16), // Position bar slightly above the edge
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30), // Clip the container for rounded corners
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFD4F6A7), // Background color for navigation bar
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow for the floating effect
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: GNav(
              color: Colors.black,           // Color for inactive icons
              activeColor: Color(0xFF526732),      // Color for active icons
              gap: 8,                        // Space between items
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16), // Button padding
              selectedIndex: _selectedIndex, // Current active index
              onTabChange: _navigateBottomBar, // Handle tab changes
              tabs: [
                GButton(
                  icon: Icons.circle, // Placeholder icon
                  iconColor: Colors.transparent, // Make icon invisible
                  leading: Image.asset(
                    "assets/images/Explore.png",
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  text: 'Explore',
                  textStyle: TextStyle(color: Color(0xFF526732)), // Label color
                ),
                GButton(
                  icon: Icons.circle,
                  iconColor: Colors.transparent,
                  leading: Image.asset(
                    "assets/images/support.png",
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  text: 'Support',
                  textStyle: TextStyle(color: Color(0xFF526732)),
                ),
                GButton(
                  icon: Icons.circle,
                  iconColor: Colors.transparent,
                  leading: Image.asset(
                    "assets/images/updates.png",
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  text: 'Updates',
                  textStyle: TextStyle(color: Color(0xFF526732)),
                ),
                GButton(
                  icon: Icons.circle,
                  iconColor: Colors.transparent,
                  leading: Image.asset(
                    "assets/images/report.png",
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  text: 'Report',
                  textStyle: TextStyle(color: Color(0xFF526732)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}