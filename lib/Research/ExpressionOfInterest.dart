import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:usp_mobileapp/main.dart';

class SendApplication extends StatelessWidget {
  SendApplication(this.area);
  String area;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        centerTitle: true,
        title: Text("Expression of Interest, " + area),
      ),
      body: const MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var Qualification = TextEditingController();
  var Work = TextEditingController();
  var id = TextEditingController();
  var GPA = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: name,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: Qualification,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.pages_outlined),
              labelText: 'Current Qualification *',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: Work,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.work),
              hintText: 'What feild have you worked in and for how many years?',
              labelText: 'Work Experience *',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: id,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.person_add_alt),
              labelText: 'Student ID *',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: GPA,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.calculate),
              hintText: 'What is you GPA',
              labelText: 'GPA *',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  senddata();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> senddata() async {
    String area = "Testing";
    final String BaseURL = 'http://127.0.0.1:8000/api/expersioninterests/';
    final Uri url = Uri.parse(BaseURL);
    var response = await http.post(url,
        body: ({
          'stud_name': name.text,
          'stud_id': id.text,
          'qualification': Qualification.text,
          'experience': Work.text,
          'gpa': GPA.text,
          'area': area
        }));

    print(response.statusCode);
    // if (response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(' Data Sent')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Processing Failed')),
    //   );
    // }
  }
}

// Future<String> senddata(name, qualification, work, id, gpa) async {
//   String area = "Testing";
//   final String BaseURL = 'http://127.0.0.1:8000/api/expersioninterests/';
//   final Uri url = Uri.parse(BaseURL);
//   try {
//     final response = await http.post(url, body: {
//       'stud_name': name,
//       'stud_id': id,
//       'qualification': qualification,
//       'experience': work,
//       'gpa': gpa,
//       'area': area
//     });
//     if (response.statusCode == 201) {
//       return "Msg Sent";
//     } else {
//       return "Msg Failed";
//     }
//   } catch (err) {
//     print(err);
//     return "Msg Failed";
//   }
// }
