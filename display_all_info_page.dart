import 'package:flutter/material.dart';

final Map<String, String> courseImages = {
  'Math': 'assets/math.jpg',
  'Science': 'assets/sciences.jpg',
  'History': 'assets/history.jpg',
  'English' : 'assets/english.jpg'

};


class DisplayAllInfoPage extends StatelessWidget {
  final String fullName;
  final String phoneNumber;
  final String major;
  final int age;
  final List<String> selectedCourses;
  final Map<String, String?> selectedCourseTeachers;

  DisplayAllInfoPage({
    required this.fullName,
    required this.phoneNumber,
    required this.major,
    required this.age,
    required this.selectedCourses,
    required this.selectedCourseTeachers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Registration Information:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.deepOrange),
            ),
            SizedBox(height: 8.0),
            Text('Full Name: $fullName'),
            Text('Phone Number: $phoneNumber'),
            Text('Major: $major'),
            Text('Age: $age'),
            SizedBox(height: 8.0),
            Text(
              'Selected Courses and Teachers:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.deepPurpleAccent),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: selectedCourses.map((course) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Course: $course',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color:Colors.deepOrange),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Teacher: ${selectedCourseTeachers[course] ?? 'No teacher selected'}',
                    ),
                    SizedBox(height: 5.0),
                    Image.asset( courseImages[course] ?? 'assets/Math.jpg',
                      width: 95,
                      height: 95,
                    ),
                    SizedBox(height: 5.0),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}