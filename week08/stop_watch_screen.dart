import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:stop_watch/stop_watch_screen.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  Timer? _timer;

  int _time = 0;
  bool _isRunning = false;

  List<String> _laptimes = [];

  _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _laptimes.clear();
    _time = 0;
  }

  void _recodLapTime(String time) {
    _laptimes.insert(0, '${_laptimes.length + 1}번 $time');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time ~/ 100;
    String hundredth = '${_time % 100}'.padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            '스톱워치',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$sec',
                style: const TextStyle(fontSize: 90),
              ),
              Text(
                '$hundredth',
                style: const TextStyle(fontSize: 40),
              ),
            ],
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 200,
            height: 300,
            child: ListView(
              children: _laptimes
                  .map((e) => Center(
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  child: const Icon(Icons.refresh),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _clickButton();
                    });
                  },
                  child: _isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
              ),
              Container(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    setState(() {
                      _recodLapTime('$sec.$hundredth');
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
