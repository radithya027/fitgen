import 'dart:async';
import 'dart:math';

import 'package:fitgen/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HeartRateMonitor extends StatefulWidget {
  @override
  _HeartRateMonitorState createState() => _HeartRateMonitorState();
}

class _HeartRateMonitorState extends State<HeartRateMonitor> {
  late Timer _timer;
  int _bpm = 0; // BPM awal
  bool _isRunning = false; // Status lari
  bool _favoriteClicked = false;
  bool _timerClicked = false;
  bool _shareClicked = false;
  double _processIndicatorValue =
      0.5; // Nilai awal untuk line process indicator
  

  @override
  void initState() {
    super.initState();
    _startHeartRateSimulation();
    _startAccelerometer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Fungsi untuk memulai simulasi denyut jantung
  void _startHeartRateSimulation() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // Simulasi data denyut jantung
      if (_isRunning) {
        setState(() {
          _bpm = _generateRandomBPM();
          _updateProcessIndicator(); // Perbarui nilai line process indicator
        });
      }
    });
  }

  // Fungsi untuk menghasilkan BPM acak
  int _generateRandomBPM() {
    // Menghasilkan angka acak antara 60 dan 100 (simulasi denyut jantung normal)
    return 60 + (Random().nextInt(40));
  }

  // Fungsi untuk memulai mendengarkan accelerometer
  void _startAccelerometer() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Deteksi gerakan: misalnya, jika percepatan sumbu z melebihi nilai tertentu
      if (event.z > 4.0) {
        // Meningkatkan BPM saat terdeteksi gerakan
        setState(() {
          _bpm += 4; // Misalnya, meningkatkan BPM sebesar 10
          _updateProcessIndicator(); // Perbarui nilai line process indicator
        });
      }
    });
  }

  // Fungsi untuk memperbarui nilai line process indicator
  void _updateProcessIndicator() {
    // Menghitung nilai line process indicator sesuai dengan nilai BPM
    _processIndicatorValue = (_bpm - 0) /
        20; // Mengubah rentang BPM menjadi rentang nilai line process indicator (0.0 - 1.0)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.directions_run),
            SizedBox(width: 10),
            Text(
              'Running',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    strokeWidth: 15,
                    value:
                        _processIndicatorValue, // Nilai line process indicator
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(theme.icon),
                  ),
                ),
                Text('$_bpm BPM',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _favoriteClicked = true;
                      _timerClicked = false;
                      _shareClicked = false;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _favoriteClicked ? theme.icon : theme.boxcolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: _favoriteClicked ? theme.boxcolor : theme.avatar4,
                      size: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _favoriteClicked = false;
                      _timerClicked = true;
                      _shareClicked = false;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _timerClicked ? theme.icon : theme.boxcolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.timer_sharp,
                      color: _timerClicked ? theme.boxcolor : theme.avatar4,
                      size: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _favoriteClicked = false;
                      _timerClicked = false;
                      _shareClicked = true;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _shareClicked ? theme.icon : theme.boxcolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.share,
                      color: _shareClicked ? theme.boxcolor : theme.avatar4,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _isRunning = !_isRunning;
                  });
                },
                icon: Icon(_isRunning ? Icons.stop : Icons.play_arrow),
                label: SizedBox.shrink(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRunning ? theme.textColor : theme.textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
