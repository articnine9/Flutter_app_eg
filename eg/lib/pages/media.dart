import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                // Add app-specific logic here if needed
                _launchURL(url);
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
    final Uri uri = Uri.parse(url);
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
