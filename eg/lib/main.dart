import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String appTitle = 'Model App';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MediaPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _showExitDialog() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('I\'M SAD'),
            content: const Text('Do you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('CANCEL'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('ACCEPT'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('Do you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('CANCEL', style: TextStyle(color: Colors.green)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _showExitDialog,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("APP NAME"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.greenAccent[400],
          elevation: 50.0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu Icon',
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: _pages[_currentIndex],
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text("RORO", style: TextStyle(fontSize: 18)),
                    ),
                    Text("roro6554@gmail.com"),
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 165, 255, 137),
                      child: Text("A",
                          style: TextStyle(fontSize: 30.0, color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _currentIndex = 0; // Navigate to Home
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.mobile_friendly),
                title: const Text('Media'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _currentIndex = 1; // Navigate to Media
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _currentIndex = 2; // Navigate to Profile
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer first
                  _showLogoutDialog();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Media",
              icon: Icon(Icons.mobile_friendly),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

// List of Cards with size for grid gallery view
List<StaggeredGridTile> _cardTile = [
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(imagePath: 'assets/image1.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image2.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(imagePath: 'assets/image3.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image4.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 3,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image7.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image5.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(imagePath: 'assets/image6.jpg'),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(imagePath: 'assets/image8.jpg'),
  ),
];

// Home Page Widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model App"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 9.0,
          crossAxisSpacing: 9.0,
          children: _cardTile,
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final String imagePath;

  const BackGroundTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Media Page Widget
class MediaPage extends StatelessWidget {
  const MediaPage({super.key});
  void _showUrlDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Open Link'),
          content: const Text('How would you like to open this link?'),
          actions: [
            TextButton(
              onPressed: () {
                _launchURL(url);
                Navigator.of(context).pop();
              },
              child: const Text('Open in Browser'),
            ),
            TextButton(
              onPressed: () {
                // You can add app-specific logic here if needed
                _launchURL(
                    url); // For now, it opens in the browser as a fallback
                Navigator.of(context).pop();
              },
              child: const Text('Open in App'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Convert String to Uri
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Welcome'),
                content: const Text('Do you want to exit?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('CANCEL'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('ACCEPT'),
                  ),
                ],
              ),
            )) ??
            false;
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.youtube,
                      color: Colors.red), // YouTube
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.spotify,
                      color: Color(0xFF1DB954)), // Spotify
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.instagram,
                      color: Color(0xFFE1306C)), // Instagram
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.twitch,
                      color: Color(0xFF9146FF)), // Twitch
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.discord,
                      color: Color(0xFF7289DA)), // Discord
                ),
              ],
            ),
            title: const Text('Media Page'),
            backgroundColor: Colors.green,
          ),
          body: TabBarView(
            children: [
              GestureDetector(
                onTap: () => _showUrlDialog(context, 'https://www.youtube.com'),
                child: Center(
                    child: FaIcon(FontAwesomeIcons.youtube,
                        size: 100, color: Colors.red)),
              ),
              GestureDetector(
                onTap: () => _showUrlDialog(context, 'https://www.spotify.com'),
                child: Center(
                    child: FaIcon(FontAwesomeIcons.spotify,
                        size: 100, color: Color(0xFF1DB954))),
              ),
              GestureDetector(
                onTap: () =>
                    _showUrlDialog(context, 'https://www.instagram.com'),
                child: Center(
                    child: FaIcon(FontAwesomeIcons.instagram,
                        size: 100, color: Color(0xFFE1306C))),
              ),
              GestureDetector(
                onTap: () => _showUrlDialog(context, 'https://www.twitch.tv'),
                child: Center(
                    child: FaIcon(FontAwesomeIcons.twitch,
                        size: 100, color: Color(0xFF9146FF))),
              ),
              GestureDetector(
                onTap: () => _showUrlDialog(context, 'https://discord.com'),
                child: Center(
                    child: FaIcon(FontAwesomeIcons.discord,
                        size: 100, color: Color(0xFF7289DA))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;

  final Logger _logger = Logger('ProfilePage');
  String? _submittedName;
  String? _submittedEmail;

  @override
  void initState() {
    super.initState();
    _setupLogging();
  }

  Future<void> _setupLogging() async {
    Logger.root.level = Level.ALL;

    // Create a log file
    final directory = await getApplicationDocumentsDirectory();
    final logFile = File('${directory.path}/app.log');

    // Listen for log records and write them to the file
    Logger.root.onRecord.listen((record) async {
      await logFile.writeAsString(
        '${record.level.name}: ${record.time}: ${record.message}\n',
        mode: FileMode.append,
      );
    });
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    const String emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final RegExp emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Log the user input
      _logger.info('Name: $_name, Email: $_email');

      // Simulate form submission (e.g., API call)
      await _performSubmission();
      setState(() {
        _submittedName = _name;
        _submittedEmail = _email;
      });
      // Show a success message
      _showSuccessDialog();
    }
  }

  Future<void> _performSubmission() async {
    // Simulate a delay for form submission
    await Future.delayed(const Duration(seconds: 1));
    // Here you would typically handle the submission, e.g., save to a database or send to an API.
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Your information has been submitted!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _formKey.currentState?.reset();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: _validateName,
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: _validateEmail,
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (_submittedName != null && _submittedEmail != null)
            Column(
              children: [
                Text(
                  'Submitted Name: $_submittedName',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Submitted Mail ID: $_submittedEmail',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          const SizedBox(height: 20),
          const Text(
            'Connect with us:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          FlutterSocialButton(
            onTap: () {},
          ),
          const SizedBox(height: 2),
          FlutterSocialButton(
            onTap: () {},
            buttonType: ButtonType.facebook,
          ),
          const SizedBox(height: 2),
          FlutterSocialButton(
            onTap: () {},
            buttonType: ButtonType.google,
            iconColor: Colors.black,
          ),
          FlutterSocialButton(
            onTap: () {},
            buttonType: ButtonType.phone,
          ),
          const SizedBox(height: 2),
          FlutterSocialButton(
            onTap: () {},
            buttonType: ButtonType.whatsapp,
          ),
          const SizedBox(height: 2),
          const Divider(
            color: Colors.black,
            thickness: 2.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterSocialButton(
                onTap: () {},
                mini: true,
              ),
              FlutterSocialButton(
                onTap: () {},
                mini: true,
                buttonType: ButtonType.facebook,
              ),
              FlutterSocialButton(
                onTap: () {},
                mini: true,
                buttonType: ButtonType.google,
              ),
              FlutterSocialButton(
                onTap: () {},
                mini: true,
                buttonType: ButtonType.phone,
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
