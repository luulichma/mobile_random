import 'dart:math';
import 'package:flutter/material.dart';
import 'day_container.dart'; 
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int ran = 0; 

  final List<Map<String, dynamic>> events = [
    {"time": "07:00", "session": "AM", "title": "CTDL & GT", "description": "Nguyễn Duy Phương"},
    {"time": "09:00", "session": "AM", "title": "Lí thuyết thông tin", "description": "Phạm Văn Sự"},
    {"time": "13:00", "session": "PM", "title": "Tư tưởng HCM", "description": "Phạm Thị Khánh"},
    {"time": "15:00", "session": "PM", "title": "Toán rời rạc 2", "description": "Nguyễn Tất Thắng"},
  ];

  void randomizeEvent() {
    setState(() {
      ran = Random().nextInt(events.length);
    });
  }

  Widget buildEventBox({required String time, required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 380,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 20)),
              Text("AM", style: const TextStyle(color: Colors.grey, fontSize: 15))
            ],
          ),
          const SizedBox(width: 30),
          Container(
            width: 10,
            height: 80,
            color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Lịch học trong tuần", style: TextStyle(color: Colors.white, fontSize: 30)),
            centerTitle: true,
            leading: const Icon(Icons.menu, color: Colors.white),
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SizedBox(width: 20),
                    DayContainer(day: '2', weekDay: 'Mon'),
                    SizedBox(width: 20),
                    DayContainer(day: '3', weekDay: 'Tue'),
                    SizedBox(width: 20),
                    DayContainer(day: '4', weekDay: 'Wed'),
                    SizedBox(width: 20),
                    DayContainer(day: '5', weekDay: 'Thu'),
                    SizedBox(width: 20),
                    DayContainer(day: '6', weekDay: 'Fri'),
                    SizedBox(width: 20),
                    DayContainer(day: '7', weekDay: 'Sat'),
                    SizedBox(width: 20),
                    DayContainer(day: 'CN', weekDay: 'Sun'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildEventBox(
                time: events[ran]["time"],
                title: events[ran]["title"],
                description: events[ran]["description"],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: randomizeEvent,
            child: const Icon(Icons.refresh, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
