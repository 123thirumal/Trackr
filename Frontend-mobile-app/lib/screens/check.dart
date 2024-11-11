import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:another_telephony/telephony.dart';

List<SmsMessage> _messages = [];
@pragma('vm:entry-point')
Future<void> backgroundMessageHandler(SmsMessage message) async {
  print("Background Message Received: ${message.body}");
  // Add the message to the stream, this will notify the StreamBuilder
  _messages.insert(0, message);
}

class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
    checkPermissions();
    listenForIncomingMessages();
  }

  // Function to check SMS permissions
  void checkPermissions() async {
    var status = await Permission.sms.request();
    if (status.isGranted) {
      print("SMS Permission granted!");
    } else {
      print("SMS Permission denied!");
    }
  }

  // Function to listen for incoming messages
  void listenForIncomingMessages() {
    print('listening.......');
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        setState(() {
          _messages.insert(0, message);
        });
        print("Foreground Message Received: ${message.body}");
      },
      onBackgroundMessage: backgroundMessageHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Listener Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: checkPermissions,
              child: Text("Request SMS Permission"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: listenForIncomingMessages,
              child: Text("Listen"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                setState(() {});
              },
              child: Text("Refresh"),
            ),
            SizedBox(height: 20),
            _messages.isEmpty
                ? Text("No messages received.")
                : Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index].address ?? 'Unknown'),
                    subtitle: Text(_messages[index].body ?? 'No content'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
