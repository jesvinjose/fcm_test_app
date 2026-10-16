import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const FcmTestApp());
}

class FcmTestApp extends StatelessWidget {
  const FcmTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TokenPage(),
    );
  }
}

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  String token = 'Tap the button to get an FCM token.';
  bool loading = false;

  Future<void> getToken() async {
    setState(() {
      loading = true;
      token = 'Requesting permission and retrieving token...';
    });

    try {
      final settings = await FirebaseMessaging.instance.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        setState(() {
          token =
              'Notification permission denied. '
              'Please enable notifications in Android settings.';
        });
        return;
      }

      final result = await FirebaseMessaging.instance.getToken();

      setState(() {
        token = result ?? 'Firebase returned no token.';
      });
    } catch (error) {
      setState(() {
        token = 'Error: $error';
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FCM Token Test')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: loading ? null : getToken,
              child: Text(loading ? 'Please wait...' : 'Get FCM Token'),
            ),
            const SizedBox(height: 20),
            const Text(
              'FCM Registration Token:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectableText(token),
          ],
        ),
      ),
    );
  }
}
