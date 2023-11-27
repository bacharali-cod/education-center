import 'package:flutter/material.dart';
import 'course_selection_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _fullName = '';
  var _phoneNumber = '';
  String _selectedMajor = '';
  DateTime? _selectedDate;

  final List<String> majors = [
    'Computer Science',
    'Engineering',
    'Mathematics',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value ?? '';
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Select Major:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.deepOrange),
              ),
              Column(
                children: majors.map((major) {
                  return ListTile(
                    title: Text(major),
                    leading: Radio<String>(
                      value: major,
                      groupValue: _selectedMajor,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedMajor = value ?? '';
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? 'Select Age'
                      : 'Age: ${DateTime.now().difference(_selectedDate!).inDays ~/ 365}',
                ),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null && pickedDate != _selectedDate) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseSelectionPage(
                          fullName: _fullName,
                          phoneNumber: _phoneNumber,
                          major: _selectedMajor,
                          age: DateTime.now().difference(_selectedDate!).inDays ~/ 365,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
