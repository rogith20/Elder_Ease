import 'dart:async';
import 'package:elder_ease/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLongPressed = false;
  Timer? longPressTimer;
  Timer? imageTimer;

  void handleLongPress() async {
    // Change the state to indicate a long-press
    setState(() {
      isLongPressed = true;
    });

    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Initiate a phone call using the flutter_phone_direct_caller package
    const phoneNumber = '+91-7598973176';
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } on PlatformException {
      // Handle any exceptions that may occur
      print('Error calling phone number');
    }

    // Reset the isLongPressed state
    setState(() {
      isLongPressed = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        leading: const Icon(Icons.monitor_heart_rounded),
        title: const Text('Elder Care+',style: TextStyle(fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black26, // Set the background color
                  borderRadius: BorderRadius.circular(20), // Adjust the radius for roundness
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Reminders',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // Set the font size for the heading
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white, // Add a divider line
                      ),
                      ListTile(
                        title: Text('Take Medication'),
                        subtitle: Text('Daily at 8:00 AM'),
                        leading: Icon(Icons.medication),
                      ),
                      ListTile(
                        title: Text('Doctor Appointment'),
                        subtitle: Text('Tomorrow at 2:30 PM'),
                        leading: Icon(Icons.calendar_today),
                      ),
                      ListTile(
                        title: Text('Exercise'),
                        subtitle: Text('Every Monday, Wednesday, and Friday at 9:00 AM'),
                        leading: Icon(Icons.directions_run),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTapDown: (details) {
                  // Start a timer for 3 seconds (adjust as needed)
                  longPressTimer = Timer(const Duration(seconds: 3), () {
                    handleLongPress();
                  });
                },
                onTapUp: (details) {
                  // If the user releases the tap before the timer finishes, cancel both timers
                  longPressTimer?.cancel();
                  imageTimer?.cancel();
                },
                child: Container(
                  width: 300, // Adjust the width to fit your design
                  height: 300, // Adjust the height to fit your design
                  child: isLongPressed
                      ? Image.asset(
                      'assets/SOS_button_2.png') // Alternate image during long-press
                      : Image.asset('assets/SOS_button_1.png'), // Original image
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: 600,
                child: const Categories()
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the timers to prevent memory leaks when the widget is disposed.
    longPressTimer?.cancel();
    imageTimer?.cancel();
    super.dispose();
  }
}