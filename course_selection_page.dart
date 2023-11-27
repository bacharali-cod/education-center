import 'package:flutter/material.dart';
import 'display_all_info_page.dart';



class CourseSelectionPage extends StatefulWidget {
  final String fullName;
  var phoneNumber;
  final String major;
  final int age;

  CourseSelectionPage({
    required this.fullName,
    required this.phoneNumber,
    required this.major,
    required this.age,
  });

  @override
  _CourseSelectionPageState createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<CourseSelectionPage> {
  Map<String, List<String>> courseTeachers = {
    'Math': ['mohamad', 'ahmad'],
    'Science': ['elias', 'maroun'],
    'History': ['nabil', 'farah'],
    'English': ['nidal', 'ghassan'],
  };

  List<String> selectedCourses = [];
  Map<String, String?> selectedCourseTeachers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Selection'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'User Information:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.deepOrange),

            ),
            Text('Full Name: ${widget.fullName}'),
            Text('Phone Number: ${widget.phoneNumber}'),
            Text('Major: ${widget.major}'),
            Text('Age: ${widget.age}'),

            // ... (Same as before)
            SizedBox(height: 16.0),
            Text(
              'Select Courses:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color:Colors.deepOrange),
            ),
            SizedBox(height: 8.0),
            Column(
              children: courseTeachers.keys.map((course) {
                return CheckboxListTile(
                  title: Text(course),
                  value: selectedCourses.contains(course),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedCourses.add(course);
                      } else {
                        selectedCourses.remove(course);
                        selectedCourseTeachers.remove(course);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            Text(
              'Select Teachers:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.deepOrange),
            ),
            SizedBox(height: 8.0),
            Column(
              children: selectedCourses.map((course) {
                return DropdownButtonFormField<String>(
                  value: selectedCourseTeachers[course],
                  items: courseTeachers[course]?.map((teacher) {
                    return DropdownMenuItem<String>(
                      value: teacher,
                      child: Text(teacher),
                    );
                  }).toList(),
                  hint: Text('Select Teacher for $course'),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCourseTeachers[course] = value;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayAllInfoPage(
                      fullName: widget.fullName,
                      phoneNumber: widget.phoneNumber,
                      major: widget.major,
                      age: widget.age,
                      selectedCourses: selectedCourses,
                      selectedCourseTeachers: selectedCourseTeachers,
                    ),
                  ),
                );
              },
              child: Text('Confirm Selection'),
            ),
          ],
        ),
      ),
    );
  }
}

