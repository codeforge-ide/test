import 'package:flutter/material.dart';
import 'dart:ui'; // Needed for ImageFilter

void main() {
  runApp(const TradeCipherApp());
}

class TradeCipherApp extends StatelessWidget {
  const TradeCipherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TradeCipher',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A), // Even darker bg
        cardColor: const Color(0xFF181818), // Darker card bg
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(
            0xFF181818,
          ).withAlpha((255 * 0.8).round()), // Slightly transparent
          elevation: 8, // More elevation
          titleTextStyle: TextStyle(
            color: Colors.greenAccent[100], // Lighter green accent
            fontSize: 22,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.greenAccent[400],
          ), // Brighter green
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(
            0xFF181818,
          ).withAlpha((255 * 0.9).round()), // Slightly transparent
          selectedItemColor: Colors.greenAccent[400], // Brighter green
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          elevation: 15, // More elevation
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.grey[200]),
          bodyMedium: TextStyle(color: Colors.grey[400]),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: const [
              Shadow(
                blurRadius: 5.0,
                color: Colors.black38,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
            shadows: const [
              Shadow(
                blurRadius: 4.0,
                color: Colors.black26,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          headlineMedium: TextStyle(
            // For balance display
            color: Colors.greenAccent[100],
            fontWeight: FontWeight.bold,
            fontSize: 30,
            shadows: const [
              Shadow(
                blurRadius: 8.0,
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
          accentColor: Colors.greenAccent[400], // Explicit accent
        ).copyWith(
          secondary: Colors.greenAccent[400], // Brighter green accent
          surface: const Color(0xFF181818), // Card/Surface color
          onSurface: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent[700], // Darker, richer green
            foregroundColor: Colors.black87, // Text on button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            elevation: 8, // Button shadow
            shadowColor: Colors.greenAccent.withAlpha((255 * 0.5).round()),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 10, // Default higher elevation for cards
          shadowColor: Colors.black.withOpacity(0.7), // Darker shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // More rounded
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.greenAccent[400], // Default icon color
          size: 24,
        ),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MarketsPage(),
    TradePage(),
    FuturesPage(),
    WalletPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use a Stack to potentially add background effects later if needed
    return Scaffold(
      // Extend body behind AppBar for potential blur effects
      // extendBodyBehindAppBar: true,
      body: IndexedStack(
        // Use IndexedStack to keep state of pages
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.candlestick_chart_outlined), // Outlined version
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_rounded),
            label: 'Trade',
          ), // Rounded
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded), // Rounded
            label: 'Futures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded), // Rounded
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Placeholder Pages (Keep simple for now)
class MarketsPage extends StatelessWidget {
  const MarketsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Markets')),
      body: const Center(child: Text('Markets Page - Asset Listings Go Here')),
    );
  }
}

class TradePage extends StatelessWidget {
  const TradePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trade')),
      body: const Center(
        child: Text('Trade Page - Trading Interface Goes Here'),
      ),
    );
  }
}

class FuturesPage extends StatelessWidget {
  const FuturesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Futures')),
      body: const Center(
        child: Text('Futures Page - Futures Trading Goes Here'),
      ),
    );
  }
}

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: const Center(
        child: Text('Wallet Page - Balances and Transactions Go Here'),
      ),
    );
  }
}

// --- HomePage Enhancements ---

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a custom AppBar for more control if needed, or rely on theme
      appBar: AppBar(
        title: const Text('TradeCipher'),
        // backgroundColor: Colors.transparent, // Make AppBar transparent if using extendBodyBehindAppBar
        // elevation: 0, // Remove AppBar shadow if using custom background/blur
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active_outlined,
            ), // Active icon
            onPressed: () {},
            tooltip: 'Notifications',
          ),
          IconButton(
            icon: const Icon(Icons.account_circle), // Filled icon
            onPressed: () {},
            tooltip: 'Profile',
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Optional: Add a subtle gradient background
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      body: ListView(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Theme.of(context).scaffoldBackgroundColor,
        //       Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        //     ],
        //   ),
        // ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildOverviewCard(context),
            const SizedBox(height: 25),
            _buildQuickActionsGrid(context), // New actions grid
            const SizedBox(height: 25),
            _buildSectionHeader(context, '🔥 Hot Assets'),
            const SizedBox(height: 10),
            _buildAssetList(context), // Pass context
            const SizedBox(height: 25),
            _buildSectionHeader(context, '📈 Top Movers'),
            const SizedBox(height: 10),
            _buildTopMoversList(context), // Pass context
            const SizedBox(height: 25),
            _buildSectionHeader(context, '📰 Market News'),
            const SizedBox(height: 10),
            _buildNewsCard(context),
            const SizedBox(height: 20), // Add some bottom padding
          ],
        ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.greenAccent[100], // Lighter green accent for headers
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context) {
    // Use Container for more decoration options
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // More rounded
        gradient: LinearGradient(
          // Subtle gradient
          begin: Alignment.topLeft,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).cardColor.withAlpha((255 * 0.9).round()),
            Theme.of(context).cardColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 18,
            spreadRadius: 2,
            offset: const Offset(4, 6),
          ),
          ),
          BoxShadow(
            // Highlight shadow (optional, subtle)
            color: Colors.green.withAlpha((255 * 0.1).round()),
            blurRadius: 20,
            spreadRadius: -5,
            offset: const Offset(-4, -4),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Portfolio Value', // Changed text
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500], // Lighter grey
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$12,345.67', // Keep example data
              style:
                  Theme.of(
                    context,
                  ).textTheme.headlineMedium, // Use themed style
            ),
            const SizedBox(height: 8),
            // Add P/L example
            Row(
              children: [
                Text(
                  '24h Change: ',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                Text(
                  '+\$152.30 (+1.25%)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.greenAccent[400], // Use bright green
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Use ElevatedButton for main actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward_rounded, size: 18),
                  icon: const Icon(Icons.arrow_upward_rounded, size: 18),
                  label: const Text('Deposit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[700]?.withAlpha((255 * 0.8).round()),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                  icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                  label: const Text('Withdraw'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[700]?.withAlpha(
                      (255 * 0.8).round(),
                    ), // Different color
                    foregroundColor: Colors.white,
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // New Grid for more actions
  Widget _buildQuickActionsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4, // 4 items per row
      shrinkWrap: true, // Important inside ListView
      physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      children: [
        _buildActionChip(
          context,
          Icons.swap_horiz_rounded,
          'Trade',
          Colors.orangeAccent,
        ),
        _buildActionChip(
          context,
          Icons.people_alt_rounded,
          'P2P',
          Colors.lightBlueAccent,
        ),
        _buildActionChip(
          context,
          Icons.savings_rounded,
          'Earn',
          Colors.purpleAccent,
        ),
        _buildActionChip(
          context,
          Icons.credit_card_rounded,
          'Card',
          Colors.redAccent,
        ),
        // Add more actions if needed
      ],
    );
  }

  Widget _buildActionChip(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
  ) {
    return Container(
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).cardColor.withAlpha((255 * 0.7).round()), // Slightly transparent bg
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Material(
        // For InkWell effect
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  // color: color.withOpacity(0.15), // Subtle background color
                  shape: BoxShape.circle,
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    // Gradient effect on icon bg
                    colors: [color.withAlpha((255 * 0.3).round()), color.withAlpha((255 * 0.05).round())],
                    radius: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[300], // Lighter text
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssetList(BuildContext context) { // Accept context
    // Wrap in a container for potential background/padding
    return Column(
      children: [
        _buildAssetRow(
          context, // Pass context
          context, // Pass context
          'BTC',
          'Bitcoin',
          '\$65,432.10',
          '+1.50%', // Example change
          Colors.greenAccent[400]!,
        ), // Use brighter green
        _buildAssetRow(
          context, // Pass context
          'ETH',
          'Ethereum',
          '\$3,456.78',
          '-0.80%', // Example change
          Colors.redAccent[100]!,
        ), // Use lighter red
        _buildAssetRow(
          context, // Pass context
          'SOL',
          'Solana',
          '\$150.99',
          '+3.80%',
          Colors.greenAccent[400]!,
        ),
      ],
    );
  }

  Widget _buildTopMoversList(BuildContext context) { // Accept context
    // For simplicity, using Column like _buildAssetList
    return Column(
          context, // Pass context
          'ADA',
          'Cardano',
          '\$0.45',
          '+5.20%', // Example change
          Colors.greenAccent[400]!,
        ),
        _buildAssetRow(
          context, // Pass context
          'DOGE',
          'Dogecoin',
          '\$0.15',
          '+2.10%', // Example change
          Colors.greenAccent[400]!,
        ),
        _buildAssetRow(
          context, // Pass context
          'XRP',
          'Ripple',
          '\$0.52',
          '-1.10%', // Example change
          Colors.redAccent[100]!,
        ),
      ],
    );
  }

  // Removed duplicate/incorrect _buildAssetRow definition

  Widget _buildAssetRow(
    BuildContext context, // Added context
    String symbol,
    String name,
    String price,
    String name,
    String price,
    String change,
    Color changeColor,
  ) {
    // Use a Container for custom styling and shadow
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).cardColor,
            Theme.of(
              context,
            ).cardColor.withAlpha((255 * 0.8).round()), // Slightly transparent end
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Material(
        // For InkWell ripple effect
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            /* Navigate to asset detail */
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            child: Row(
                // Enhanced Leading Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withAlpha((255 * 0.5).round()),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade700, width: 1),
                  ),
                  ),
                  child: Text(
                    symbol.substring(0, 1),
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        symbol,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Price and Change (Trailing)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // Ensure price is white
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Change Percentage with background chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: changeColor.withAlpha((255 * 0.2).round()), // Background tint
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                      child: Text(
                        change,
                        style: TextStyle(
                          color: changeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context) {
    // Use Container for gradient and shadow
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).cardColor,
            Theme.of(context).cardColor.withAlpha((255 * 0.85).round()),
          ],
          stops: const [0.0, 1.0],
        ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Material(
        // For InkWell
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // Add an icon to the news
                  children: [
                    Icon(
                      Icons.article_outlined,
                      size: 18,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Market Update: Bitcoin Surges Past \$65k',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent[100], // Use accent color
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Analysts predict further gains as institutional interest grows, pushing the market cap towards new highs...', // Slightly longer text
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[400], // Slightly lighter grey
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Source: CryptoNews', // Add source example
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                    Text(
                      '2 hours ago',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
