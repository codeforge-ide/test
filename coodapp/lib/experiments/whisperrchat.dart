import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:ui'; // No longer needed if blur is removed

void main() {
  runApp(const WhisperrChatApp());
}

class WhisperrChatApp extends StatelessWidget {
  const WhisperrChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the high-contrast light color scheme
    const primaryColor = Color(0xFF0D47A1); // Deep Blue for strong primary
    const primaryVariantColor = Color(0xFF002171); // Darker Blue
    const accentColor = Color(0xFFD81B60); // Strong Pink/Magenta Accent
    const backgroundColor = Colors.white; // Pure White background
    const surfaceColor = Colors.white; // White surface
    const errorColor = Color(0xFFB00020); // Standard Material Red Error
    const onPrimaryColor = Colors.white; // White text on deep blue
    const onSecondaryColor = Colors.white; // White text on pink/magenta
    const onBackgroundColor = Colors.black; // Black text on white background
    const onSurfaceColor = Colors.black; // Black text on white surface
    const onErrorColor = Colors.white; // White text on red error

    return MaterialApp(
      title: 'WhisperrChat',
      theme: ThemeData(
        brightness: Brightness.light, // Set to light mode
        primaryColor: primaryColor,
        primaryColorDark: primaryVariantColor,
        hintColor: accentColor, // Accent color
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: surfaceColor,
        cardColor: surfaceColor,

        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor, // Use primary color for AppBar
          elevation: 4.0, // Standard elevation
          shadowColor: Colors.black.withOpacity(0.3),
          systemOverlayStyle:
              SystemUiOverlayStyle.dark, // Dark status bar icons
          titleTextStyle: const TextStyle(
            color: onPrimaryColor, // White title on blue AppBar
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(
            color: onPrimaryColor, // White icons on blue AppBar
            size: 26,
          ),
        ),

        colorScheme: const ColorScheme(
          primary: primaryColor,
          primaryContainer: primaryVariantColor,
          secondary: accentColor,
          secondaryContainer: accentColor, // Adjust if needed
          surface: surfaceColor,
          background: backgroundColor,
          error: errorColor,
          onPrimary: onPrimaryColor,
          onSecondary: onSecondaryColor,
          onSurface: onSurfaceColor,
          onBackground: onBackgroundColor,
          onError: onErrorColor,
          brightness: Brightness.light, // Explicitly light
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: accentColor,
          foregroundColor: onSecondaryColor,
          elevation: 8.0, // Increased elevation for more shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // More curve
          ),
          splashColor: primaryColor.withOpacity(0.3),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: surfaceColor, // White background
          selectedItemColor: primaryColor, // Use primary for selected
          unselectedItemColor: Colors.black54, // Dark grey for unselected
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          elevation: 10.0, // Increased elevation for more shadow
        ),

        listTileTheme: const ListTileThemeData(
          iconColor: onSurfaceColor, // Black icons
          textColor: onSurfaceColor, // Black text
        ),

        textTheme: ThemeData.light().textTheme
            .apply(
              // Base light theme text and customize for contrast
              bodyColor: onBackgroundColor, // Black
              displayColor: onBackgroundColor, // Black
              fontFamily: 'Roboto',
            )
            .copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: onBackgroundColor, // Ensure black
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.bold, // Ensure titles are bold
                fontSize: 17,
                color: onBackgroundColor,
              ),
              bodyMedium: const TextStyle(
                fontSize: 15,
                height: 1.4,
                color: onBackgroundColor, // Ensure black
              ),
              bodySmall: TextStyle(
                fontSize: 12.5,
                color: onBackgroundColor.withOpacity(
                  0.7,
                ), // Slightly lighter black
              ),
            ),
        iconTheme: const IconThemeData(
          color: onSurfaceColor, // Black icons
          size: 24.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
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
    ChatsScreen(),
    Center(
      child: Text(
        'Groups Screen - Coming Soon!',
        style: TextStyle(color: Colors.black87), // Use dark text
      ),
    ),
    Center(
      child: Text(
        'Calls Screen - Coming Soon!',
        style: TextStyle(color: Colors.black87), // Use dark text
      ),
    ),
    Center(
      child: Text(
        'Settings Screen - Coming Soon!',
        style: TextStyle(color: Colors.black87), // Use dark text
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'WhisperrChat';
      case 1:
        return 'Groups';
      case 2:
        return 'Calls';
      case 3:
        return 'Settings';
      default:
        return 'WhisperrChat';
    }
  }

  IconData _getFabIcon() {
    switch (_selectedIndex) {
      case 0:
        return Icons.message_rounded;
      case 1:
        return Icons.group_add_rounded;
      case 2:
        return Icons.add_ic_call_rounded;
      case 3:
        return Icons.settings_suggest_rounded;
      default:
        return Icons.message_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        actions: [
          if (_selectedIndex == 0)
            IconButton(
              icon: const Icon(Icons.lock_outline_rounded),
              tooltip: 'Privacy Settings',
              onPressed: () {},
            ),
          if (_selectedIndex == 0)
            IconButton(
              icon: const Icon(Icons.search_rounded),
              tooltip: 'Search Chats',
              onPressed: () {},
            ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            tooltip: 'More Options',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_rounded),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Action for ${_getAppBarTitle()} tab!')),
          );
        },
        tooltip: 'New',
        child: Icon(_getFabIcon()),
      ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample chat data (no changes needed here)
    final List<Map<String, String>> chatList = [
      {
        "name": "Ben",
        "message": "we finally built the privacy of chat! ...",
        "time": "10:30 AM",
        "avatarUrl": "https://via.placeholder.com/150/92c952",
        "unread": "1",
      },
      {
        "name": "Vexeroo Group",
        "message": "Planning the next sprint.",
        "time": "10:05 AM",
        "avatarUrl": "https://via.placeholder.com/150/56a8c2",
        "unread": "5",
      },
      {
        "name": "Alice",
        "message": "Hey, how are you?",
        "time": "9:15 AM",
        "avatarUrl": "https://via.placeholder.com/150/771796",
        "unread": "3",
      },
      {
        "name": "David",
        "message": "See you tomorrow!",
        "time": "Yesterday",
        "avatarUrl": "https://via.placeholder.com/150/b0f7cc",
        "unread": "0",
      },
      {
        "name": "Bainaryglobe Group",
        "message": "Code review comments added.",
        "time": "Yesterday",
        "avatarUrl": "https://via.placeholder.com/150/810b14",
        "unread": "0",
      },
      {
        "name": "Project Group",
        "message": "Meeting at 2 PM today.",
        "time": "Yesterday",
        "avatarUrl": "https://via.placeholder.com/150/24f355",
        "unread": "0",
      },
      {
        "name": "Emmanuel",
        "message": "Got the files, thanks!",
        "time": "Sunday",
        "avatarUrl": "https://via.placeholder.com/150/1ee8a4",
        "unread": "0",
      },
      {
        "name": "Mom",
        "message": "Call me back when you can.",
        "time": "Sunday",
        "avatarUrl": "https://via.placeholder.com/150/d32776",
        "unread": "0",
      },
      {
        "name": "Coodeck Group",
        "message": "New design mockups available.",
        "time": "Saturday",
        "avatarUrl": "https://via.placeholder.com/150/66b7d2",
        "unread": "2",
      },
      {
        "name": "Secure Channel",
        "message": "End-to-end encrypted.",
        "time": "Friday",
        "avatarUrl": "https://via.placeholder.com/150/f66b97",
        "unread": "0",
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        final bool isBen = chat["name"] == "Ben";

        return ChatListItem(
          name: chat["name"]!,
          message: chat["message"]!,
          time: chat["time"]!,
          avatarUrl: chat["avatarUrl"]!,
          unreadCount: int.tryParse(chat["unread"]!) ?? 0,
          isSpecial: isBen,
        );
      },
    );
  }
}

// Custom Widget for Chat List Item - Enhanced Visuals
class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final int unreadCount;
  final bool isSpecial;

  const ChatListItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.unreadCount = 0,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool hasUnread = unreadCount > 0;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ), // Increased margin
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // Solid white background
        borderRadius: BorderRadius.circular(16.0), // More curve
        border: Border.all(
          color:
              isSpecial
                  ? theme.hintColor.withOpacity(
                    0.8,
                  ) // Accent color border for special
                  : Colors.black.withOpacity(
                    0.15,
                  ), // Slightly darker subtle border
          width: isSpecial ? 2.5 : 1.5, // Thicker borders
        ),
        boxShadow: [
          // Enhanced shadow for 3D effect
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Darker shadow
            blurRadius: 8, // More diffusion (softer edges)
            spreadRadius: 1, // Slightly larger shadow area
            offset: const Offset(0, 4), // More pronounced offset downwards
          ),
          // Optional: Inner shadow or highlight for more depth (can be complex)
          // BoxShadow(
          //   color: Colors.white.withOpacity(0.5),
          //   blurRadius: 1,
          //   spreadRadius: -1, // Negative spread for inner effect
          //   offset: Offset(0, 1),
          // ),
        ],
      ),
      child: Material(
        // Keep Material for InkWell, clip behavior
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.0), // Match container radius
        clipBehavior: Clip.antiAlias, // Clip ink splash to rounded corners
        child: InkWell(
          splashColor: theme.primaryColor.withOpacity(
            0.15,
          ), // Slightly stronger splash
          highlightColor: theme.primaryColor.withOpacity(
            0.1,
          ), // Slightly stronger highlight
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Tapped on $name')));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0, // Increased padding
              vertical: 12.0, // Increased padding
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30, // Slightly larger avatar
                  backgroundImage: NetworkImage(avatarUrl),
                  backgroundColor: Colors.grey.shade300,
                ),
                const SizedBox(width: 14), // Increased spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold, // Ensure bold
                          fontSize: 17.5, // Slightly larger
                        ),
                      ),
                      const SizedBox(height: 5), // Increased spacing
                      Row(
                        children: [
                          if (isSpecial)
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Icon(
                                Icons.security_rounded,
                                size: 18, // Slightly larger icon
                                color: theme.hintColor, // Accent color
                              ),
                            ),
                          Expanded(
                            child: Text(
                              message,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color:
                                    isSpecial
                                        ? theme
                                            .hintColor // Accent color for special message
                                        : theme.colorScheme.onSurface
                                            .withOpacity(
                                              0.75,
                                            ), // Slightly darker grey
                                fontWeight:
                                    isSpecial
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                fontSize: 15.5, // Slightly larger
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10), // Increased spacing
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color:
                            hasUnread
                                ? theme
                                    .hintColor // Accent color for time if unread
                                : theme.colorScheme.onSurface.withOpacity(
                                  0.65,
                                ), // Slightly darker grey
                        fontWeight:
                            hasUnread ? FontWeight.bold : FontWeight.normal,
                        fontSize: 13, // Slightly larger
                      ),
                    ),
                    const SizedBox(height: 8), // Increased spacing
                    if (hasUnread)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8, // More padding
                          vertical: 4, // More padding
                        ),
                        decoration: BoxDecoration(
                          color: theme.hintColor, // Accent color background
                          borderRadius: BorderRadius.circular(12), // More curve
                          boxShadow: [
                            // Subtle shadow for the badge
                            BoxShadow(
                              color: theme.hintColor.withOpacity(0.5),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Text(
                          unreadCount.toString(),
                          style: TextStyle(
                            color:
                                theme
                                    .colorScheme
                                    .onSecondary, // White text on accent
                            fontSize: 12, // Slightly larger
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        height: 24,
                      ), // Adjust placeholder height to match badge size + padding
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
