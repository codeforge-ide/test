import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(CoodeckApp());

class CoodeckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'coodeck',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.pinkAccent,
        ),
      ),
      home: CoodeckHomePage(),
    );
  }
}

class CoodeckHomePage extends StatefulWidget {
  @override
  _CoodeckHomePageState createState() => _CoodeckHomePageState();
}

class _CoodeckHomePageState extends State<CoodeckHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeContent(),
    const Center(child: Text('Projects', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: GlassAppBar(),
          ),
          body: Center(child: _pages[_selectedIndex]),
          bottomNavigationBar: GlassBottomBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ],
    );
  }
}

class GlassAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withOpacity(0.2),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.white70, size: 28),
              Text(
                'coodeck',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.5),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Icon(Icons.favorite, color: Colors.pinkAccent, size: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlassBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  GlassBottomBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0.10),
          elevation: 0,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_special_rounded),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple.shade900,
                Colors.pink.shade700.withOpacity(0.7),
                Colors.black,
              ],
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: -60,
          child: BlurredCircle(
            color: Colors.deepPurpleAccent.withOpacity(0.3),
            size: 180,
          ),
        ),
        Positioned(
          bottom: 60,
          right: -40,
          child: BlurredCircle(
            color: Colors.pinkAccent.withOpacity(0.25),
            size: 140,
          ),
        ),
        Positioned(
          bottom: 180,
          left: 40,
          child: BlurredCircle(
            color: Colors.blueAccent.withOpacity(0.18),
            size: 100,
          ),
        ),
      ],
    );
  }
}

class BlurredCircle extends StatelessWidget {
  final Color color;
  final double size;
  BlurredCircle({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(width: size, height: size, color: color),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Changed to ListView for scrollable content
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28),
      children: [
        _buildWelcomeSection(context),
        SizedBox(height: 30),
        _buildQuickActionsSection(context),
        SizedBox(height: 30),
        _buildRecentProjectsSection(context),
        SizedBox(
          height: 80,
        ), // Add padding at the bottom for bottom nav overlap
      ],
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.waving_hand_rounded,
                color: Colors.yellow.shade700,
                size: 32,
              ),
              SizedBox(width: 12),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Ready to build something amazing today?',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 12),
          child: Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildActionCard(
                context,
                Icons.add_circle_outline_rounded,
                'New Project',
                Colors.greenAccent,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context,
                Icons.folder_open_rounded,
                'Open File',
                Colors.blueAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    IconData icon,
    String label,
    Color iconColor,
  ) {
    return GlassCard(
      child: Column(
        children: [
          Icon(icon, size: 48, color: iconColor),
          SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentProjectsSection(BuildContext context) {
    // Placeholder data - replace with actual project data later
    final recentProjects = [
      {
        'name': 'AIROX OS Concept',
        'icon': Icons.memory_rounded,
        'color': Colors.redAccent,
      },
      {
        'name': 'Flutter UI Kit',
        'icon': Icons.palette_rounded,
        'color': Colors.orangeAccent,
      },
      {
        'name': 'Backend API',
        'icon': Icons.dns_rounded,
        'color': Colors.tealAccent,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 12),
          child: Text(
            'Recent Projects',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        ...recentProjects
            .map(
              (project) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildRecentProjectItem(
                  context,
                  project['icon'] as IconData,
                  project['name'] as String,
                  project['color'] as Color,
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildRecentProjectItem(
    BuildContext context,
    IconData icon,
    String name,
    Color color,
  ) {
    return GlassCard(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white54,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withOpacity(0.12),
                blurRadius: 32,
                offset: Offset(0, 12),
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.18),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
