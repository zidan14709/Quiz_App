import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs
import 'package:share_plus/share_plus.dart'; // For sharing content

import 'quiz_screen.dart'; // Import your quiz screen directly

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalTimeInSeconds;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalTimeInSeconds,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Time: ${totalTimeInSeconds}s',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const QuizScreen(), // Replace QuizScreen with your actual quiz screen widget
                  ),
                );
              },
              child: const Text('Start Again'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    _launchEmail();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {
                    _shareOnFacebook();
                  },
                ),
                // IconButton(
                //   icon: Icon(Icons.linkedin),
                //   onPressed: () {
                //     _shareOnLinkedin();
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '', // Add the recipient's email address here
      queryParameters: {
        'subject': 'Quiz Result',
        'body': 'My quiz result: Score - $score, Time - ${totalTimeInSeconds}s',
      },
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void _shareOnFacebook() {
    Share.share(
        'My quiz result: Score - $score, Time - ${totalTimeInSeconds}s');
  }

  void _shareOnInstagram() {
    Share.share(
        'My quiz result: Score - $score, Time - ${totalTimeInSeconds}s');
  }
}
