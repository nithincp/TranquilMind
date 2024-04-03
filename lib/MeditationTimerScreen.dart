// MeditationTimerScreen.dart
import 'package:flutter/material.dart';
import 'dart:async';

class MeditationTimerScreen extends StatefulWidget {
  @override
  _MeditationTimerScreenState createState() => _MeditationTimerScreenState();
}

class _MeditationTimerScreenState extends State<MeditationTimerScreen> {
  int _selectedMinutes = 5; // Selected meditation duration in minutes
  int _secondsRemaining = 5 * 60; // Remaining seconds in the countdown
  Timer? _timer; // Timer object for countdown

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Meditation Duration',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updateDuration(-1); // Decrease duration
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20.0),
                Text(
                  '$_selectedMinutes minutes',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _updateDuration(1); // Increase duration
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _startTimer(); // Start countdown
              },
              child: Text('Start Meditation'),
            ),
            SizedBox(height: 20.0),
            Text(
              '$_secondsRemaining seconds remaining',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  void _updateDuration(int increment) {
    setState(() {
      _selectedMinutes += increment;
      if (_selectedMinutes < 1) {
        _selectedMinutes = 1; // Minimum duration is 1 minute
      }
    });
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the previous timer
    }

    setState(() {
      _secondsRemaining = _selectedMinutes * 60;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer!.cancel(); // Stop the timer when countdown reaches 0
          _playAlarm(); // Play the alarm sound
        }
      });
    });
  }

  void _playAlarm() {
    // Add logic to play soothing music
    // This is just a placeholder
    print('Playing soothing music...');
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
}
