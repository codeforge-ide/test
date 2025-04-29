import 'package:flutter/material.dart';
import 'dart:ui'; // Required for BackdropFilter

void main() {
  runApp(const DeepCoinApp());
}

class DeepCoinApp extends StatelessWidget {
  const DeepCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeepCoin',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.white.withOpacity(0.1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black.withOpacity(0.8),
          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: TextStyle(color: Colors.grey),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedAsset = 'BTC'; // Default asset

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _switchAsset(String newAsset) {
    setState(() {
      _selectedAsset = newAsset;
    });
    // In a real app, trigger data refresh for the selected asset
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows body content to go behind AppBar
      appBar: AppBar(
        title: const Text('DeepCoin'),
        flexibleSpace: ClipRect(
          // Clip the backdrop filter
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(
                0.3,
              ), // Semi-transparent background
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Optional: Add a background image or gradient here
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blueGrey.shade900, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main Content Area
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildAssetSwitcherAndChartPreview(),
                const SizedBox(height: 20),
                _buildGlassyCard(
                  title: 'AI Prediction',
                  content:
                      'BTC price expected to reach \$75,000 (Confidence: 85%)',
                  icon: Icons.auto_awesome,
                  iconColor: Colors.purpleAccent,
                ),
                const SizedBox(height: 16),
                _buildGlassyCard(
                  title: 'Portfolio Value',
                  content: '\$12,345.67 (+2.5% today)',
                  icon: Icons.account_balance_wallet,
                  iconColor: Colors.greenAccent,
                ),
                const SizedBox(height: 16),
                _buildGlassyCard(
                  title: 'Active Auto-Swaps',
                  content: 'ETH/USDT: TP @ \$4,200 | BTC/USDT: SL @ \$68,000',
                  icon: Icons.sync_alt,
                  iconColor: Colors.orangeAccent,
                ),
                const SizedBox(height: 16),
                _buildGlassyCard(
                  title: 'Market Movers',
                  content: 'SOL +15%, ADA +8%, DOGE -3%',
                  icon: Icons.trending_up,
                  iconColor: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRect(
        // Clip the backdrop filter
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.candlestick_chart), // Or Icons.show_chart
                label: 'Markets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome),
                label: 'AI Predict',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
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

  Widget _buildAssetSwitcherAndChartPreview() {
    // Placeholder for asset switcher and mini chart
    return Column(
      children: [
        // Asset Switcher (Conceptual)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                ['BTC', 'ETH', 'SOL', 'ADA', 'DOT', 'LINK']
                    .map(
                      (asset) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ChoiceChip(
                          label: Text(asset),
                          selected: _selectedAsset == asset,
                          onSelected: (_) => _switchAsset(asset),
                          selectedColor: Colors.tealAccent.withOpacity(0.8),
                          backgroundColor: Colors.white.withOpacity(0.1),
                          labelStyle: TextStyle(
                            color:
                                _selectedAsset == asset
                                    ? Colors.black
                                    : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
        const SizedBox(height: 16),
        // Mini Chart Preview (Conceptual)
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Center(
            child: Text(
              'Mini Chart for $_selectedAsset\n(Placeholder)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGlassyCard({
    required String title,
    required String content,
    required IconData icon,
    Color iconColor = Colors.tealAccent,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Glass effect
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.2), // Subtle border
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      content,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
