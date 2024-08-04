
import 'dart:convert';

import 'package:fitness/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController bday = TextEditingController();

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
    );
    if(pickedDate != null){
      setState(() {
        bday.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _submitData() async{
    print("check Point 1");
    final response = await http.post(
      Uri.parse('http://192.168.27.240/fitness/register.php'),
      body: {
        'name': name.text.trim(),
        'email': email.text.trim(),
        'phone': phone.text.trim(),
        'address': address.text.trim(),
        'bday': bday.text.trim(),
      }
    );
    if(response.statusCode == 200){
      print("Check Point 2");
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if(responseBody['success']){
        print("Check point 3");
        Fluttertoast.showToast(msg: "Registered Successfully");
        Get.to(HomePage());
      }
      else{
        Fluttertoast.showToast(msg: "Error! Not Registered. Try Again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  label: const Text('Name'),
                  hintText: "Enter your Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 1
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2
                    )
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                  )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: "Enter your Email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                    label: const Text('Contact'),
                    hintText: "Enter your Mobile No.",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: address,
                decoration: InputDecoration(
                    label: const Text('Address'),
                    hintText: "Enter your Adress",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    )
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: bday,
                    decoration: InputDecoration(
                        label: const Text('BirthDate'),
                        hintText: "Enter your BirthDate",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            )
                        )
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8.0),

                child: ElevatedButton(
                    onPressed: (){
                      _submitData();
                      Get.to(HomePage());
                    },
                    child: Text("Submit",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),

                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


