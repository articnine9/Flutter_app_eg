import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

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
    const MusicPage(),
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
                leading: const Icon(Icons.music_note_outlined),
                title: const Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _currentIndex = 1; // Navigate to Music
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
              label: "Music",
              icon: Icon(Icons.music_note),
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

// List of Cards with size
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

// Music Page Widget
class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

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
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.music_video)),
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(icon: Icon(Icons.grade)),
                Tab(icon: Icon(Icons.email)),
              ],
            ),
            title: const Text('Music Page'),
            backgroundColor: Colors.green,
          ),
          body: const TabBarView(
            children: [
              Center(
                  child: Icon(Icons.music_note,
                      size: 100, color: Color.fromARGB(255, 52, 127, 189))),
              Center(
                  child: Icon(Icons.music_video,
                      size: 100, color: Color.fromARGB(255, 30, 192, 103))),
              Center(
                  child: Icon(Icons.camera_alt,
                      size: 100, color: Color.fromARGB(255, 173, 91, 13))),
              Center(
                  child: Icon(Icons.grade,
                      size: 100, color: Color.fromARGB(255, 180, 13, 185))),
              Center(
                  child: Icon(Icons.email,
                      size: 100, color: Color.fromARGB(255, 228, 59, 17))),
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
                  'Submitted Name:$_submittedName',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Submitted Mail ID:$_submittedEmail',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )
        ],
      ),
    );
  }
}
