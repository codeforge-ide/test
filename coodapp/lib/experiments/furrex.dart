import 'package:flutter/material.dart';
import 'dart:ui'; // Needed for potential blur effects if desired later, but sticking to basics first.

void main() {
  runApp(const FurrexApp());
}

// Primary Green Color
const Color primaryGreen = Color(0xFF1E8449); // A shade of green
const Color lightGreen = Color(0xFF2ECC71);
const Color darkBackground = Color(0xFF121212);
const Color cardBackground = Color(
  0xFF1E1E1E,
); // Slightly lighter than dark background
const Color glassEffectColor = Color.fromRGBO(
  255,
  255,
  255,
  0.1,
); // Subtle white transparency

class FurrexApp extends StatelessWidget {
  const FurrexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furrex Bank',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryGreen,
        scaffoldBackgroundColor: darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: primaryGreen,
          secondary: lightGreen,
          background: darkBackground,
          surface: cardBackground,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
        fontFamily:
            'Poppins', // Example font, ensure it's added to pubspec.yaml if used
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: cardBackground.withOpacity(0.8),
          selectedItemColor: primaryGreen,
          unselectedItemColor: Colors.grey[500],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          type: BottomNavigationBarType.fixed, // Ensures all labels are visible
          elevation: 10, // Add some elevation for a floating feel
        ),
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeTab(),
    const Center(
      child: Text('Send Page', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text('Cards Page', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text('Trade Page', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text('Settings Page', style: TextStyle(color: Colors.white)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Stack to potentially layer background effects if needed
      body: Stack(
        children: [
          // Optional: Add a subtle background gradient or image here
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [darkBackground, Colors.black.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: IndexedStack(
              // Use IndexedStack to keep state of inactive tabs
              index: _selectedIndex,
              children: _widgetOptions,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        // Clip the corners for a modern look
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BackdropFilter(
          // Apply a blur effect for glassmorphism
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.send_rounded),
                label: 'Send',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_rounded),
                label: 'Cards',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.candlestick_chart_rounded),
                label: 'Trade',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

// --- Home Tab ---
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Use ListView for scrollable content
      padding: const EdgeInsets.all(16.0),
      children: const [
        WelcomeSection(),
        SizedBox(height: 25),
        BalanceWidget(),
        SizedBox(height: 30),
        QuickActions(),
        SizedBox(height: 30),
        RecentTransactions(),
      ],
    );
  }
}

// --- Welcome Section ---
class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back,',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Nath Favour', // Replace with actual user name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: primaryGreen.withOpacity(0.2),
          child: const Icon(
            Icons.person_outline,
            color: primaryGreen,
            size: 30,
          ),
          // Replace with user avatar if available
          // backgroundImage: NetworkImage('user_avatar_url'),
        ),
      ],
    );
  }
}

// --- Balance Widget ---
class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryGreen, lightGreen.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: primaryGreen.withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Balance',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              Icon(
                Icons.visibility_off_outlined,
                color: Colors.white70,
                size: 20,
              ), // Toggle visibility icon
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '\$15,840.50', // Replace with actual balance
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                '+ \$1,200 this month', // Replace with actual change
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- Quick Actions ---
class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionItem(context, Icons.send_rounded, 'Send'),
            _buildActionItem(context, Icons.receipt_long_rounded, 'Pay Bills'),
            _buildActionItem(context, Icons.add_card_rounded, 'Add Card'),
            _buildActionItem(context, Icons.swap_horiz_rounded, 'Transfer'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: cardBackground,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: primaryGreen, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

// --- Recent Transactions ---
class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  // Dummy data
  final List<Map<String, dynamic>> transactions = const [
    {
      'icon': Icons.shopping_bag_outlined,
      'title': 'Shopping',
      'subtitle': 'Apple Store',
      'amount': '- \$1199.00',
      'color': Colors.orange,
    },
    {
      'icon': Icons.fastfood_outlined,
      'title': 'Food',
      'subtitle': 'McDonald\'s',
      'amount': '- \$15.50',
      'color': Colors.red,
    },
    {
      'icon': Icons.receipt_outlined,
      'title': 'Salary',
      'subtitle': 'Company Inc.',
      'amount': '+ \$5000.00',
      'color': Colors.green,
    },
    {
      'icon': Icons.movie_filter_outlined,
      'title': 'Entertainment',
      'subtitle': 'Netflix',
      'amount': '- \$12.99',
      'color': Colors.purple,
    },
    {
      'icon': Icons.train_outlined,
      'title': 'Transport',
      'subtitle': 'Metro Ticket',
      'amount': '- \$5.00',
      'color': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Transactions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children:
                transactions
                    .map((tx) => _buildTransactionItem(context, tx))
                    .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(BuildContext context, Map<String, dynamic> tx) {
    final bool isIncome = (tx['amount'] as String).startsWith('+');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: (tx['color'] as Color).withOpacity(0.15),
            child: Icon(
              tx['icon'] as IconData,
              color: tx['color'] as Color,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx['title'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  tx['subtitle'] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            tx['amount'] as String,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isIncome ? lightGreen : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
