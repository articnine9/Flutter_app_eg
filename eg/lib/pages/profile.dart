import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_social_button/flutter_social_button.dart'; // Ensure you have this package

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

    final directory = await getApplicationDocumentsDirectory();
    final logFile = File('${directory.path}/app.log');

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
      _logger.info('Name: $_name, Email: $_email');
      await _performSubmission();
      setState(() {
        _submittedName = _name;
        _submittedEmail = _email;
      });
      _showSuccessDialog();
    }
  }

  Future<void> _performSubmission() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Your data has been submitted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
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
