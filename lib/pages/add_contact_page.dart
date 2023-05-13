import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resurces/GLobal.dart';
import '../resurces/app_theme.dart';
import '../resurces/text_color.dart';

class add_contact_page extends StatefulWidget {
  const add_contact_page({Key? key}) : super(key: key);

  @override
  State<add_contact_page> createState() => _add_contact_pageState();
}

class _add_contact_pageState extends State<add_contact_page> {
  final _picker = ImagePicker();
  File? image;

  GlobalKey<FormState> add_contact_key = GlobalKey<FormState>();

  TextStyle labelStyle = const TextStyle(color: Colors.black, fontSize: 18);
  TextStyle hintStyle = const TextStyle(color: Colors.grey, fontSize: 18);

  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController phone_num_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // theme: ThemeData.light(),
      darkTheme: AppTheme.darkTheme,
      // darkTheme: ThemeData.dark(),
      themeMode: (AppTheme.isDark) ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,
                  color: (AppTheme.isDark) ? Colors.black : Colors.white)),
          title: Text(
            "Add",
            style: TextStyle(
                color: (AppTheme.isDark) ? Colors.black : Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (add_contact_key.currentState!.validate()) {
                    add_contact_key.currentState!.save();
                    Contact c1 = Contact(
                        first_name: firstName,
                        last_name: lastName,
                        email: email,
                        phone_num: phoneNumber,
                        image: image);

                    setState(() {
                      Global.allContacts.add(c1);
                    });
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
                icon: Icon(Icons.check,
                    color: (AppTheme.isDark) ? Colors.black : Colors.white)),
          ],
        ),
        body: Column(
          children: [
            /* SizedBox(
              height: 40,
            ),*/
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Expanded(
                flex: 2,
                child: Stack(children: [
                  Positioned(
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            (image != null) ? FileImage(image!) : null,
                        child: (image != null)
                            ? const Text("")
                            : const Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: 10,
                    child: FloatingActionButton(
                      elevation: 0,
                      mini: true,
                      onPressed: () async {
                        XFile? pickedImage =
                            await _picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          image = File(pickedImage!.path);
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Form(
                  key: add_contact_key,
                  child: Container(
                    // height: 100,
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //first name
                        Text(
                          "First name",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your first name first";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              firstName = val;
                            });
                          },
                          controller: first_name_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "First name",
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        // last name

                        Text(
                          "Last name",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your last name fist.....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              lastName = val;
                            });
                          },
                          controller: last_name_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "Last name",
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        //phone number

                        Text(
                          "Phone number",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your phone number first...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              phoneNumber = val;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          controller: phone_num_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "+91 98765 34521",
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        // Email

                        Text(
                          "Email",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your email first...";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: email_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "username@gmail.com",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
