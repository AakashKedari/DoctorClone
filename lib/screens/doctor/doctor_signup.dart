import 'dart:developer';
import 'package:doctor_clone/screens/doctor/doctor_home.dart';
import 'package:doctor_clone/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const.dart';

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({super.key});

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countDocuments();
  }


  Future<void> _countDocuments() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('doctors').get();

    log(querySnapshot.docs.length.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specializationController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    _experienceController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Perform sign up operation
      User? user = await FireAuth.registerUsingEmailPassword(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
          name: 'testDoctor');
      if (user != null) {
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setBool('isDoctor', true);
        Get.snackbar('Registration successful', '');
        // Get.showSnackbar(const GetSnackBar(title: 'Registration',message: 'Registration successful',));
        FirebaseFirestore.instance.collection('doctors').doc(user.uid).set({
          'name': _nameController.text,
          'specialization': _specializationController.text,
          'address': _addressController.text,
          'contact': _contactController.text,
          'experience': _experienceController.text,
          'email': _emailController.text,
        });
        Get.offAll(() => const DoctorHomePage());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Registration Failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text('Dentist Details'),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Stack(children: [
          Container(
            color: appBarColor,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    buildTextField(
                      controller: _nameController,
                      label: 'Name',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    buildDropdown(
                        controller: _specializationController,
                        label: "What's your Specialization",
                        icon: Icons.medical_services,
                        items: specializations,
                        validator: (value) {
                          return null;
                        })
                    // buildTextField(
                    //   controller: _specializationController,
                    //   label: 'Specialization',
                    //   icon: Icons.local_hospital,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your specialization';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    ,
                    const Gap(20),
                    buildTextField(
                      controller: _addressController,
                      label: 'Address',
                      icon: Icons.home,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    buildTextField(
                      controller: _contactController,
                      label: 'Contact',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length<10 || value.length>10) {
                          return 'Please enter valid contact number';
                        }
                        return null;
                      },
                    ),
                    buildTextField(
                      controller: _experienceController,
                      label: 'Experience',
                      icon: Icons.work,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your experience';
                        }
                        return null;
                      },
                    ),
                    buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    buildTextField(
                      controller: _passwordController,
                      label: 'Password',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: _submitForm,
                      color: appBarColor,
                      shape: const StadiumBorder(),
                      textColor: Colors.white,
                      child: const Text('Sign Up'),
                      // style: ElevatedButton.styleFrom(
                      //   padding: EdgeInsets.symmetric(vertical: 16),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: validator,
    ),
  );
}

Widget buildDropdown({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  required List<String> items,
  required FormFieldValidator<String> validator,
}) {
  return DropdownButtonFormField<String>(
    value: controller.text.isEmpty ? null : controller.text,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
    items: items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList(),
    onChanged: (String? newValue) {
      controller.text = newValue!;
    },
    validator: validator,
  );
}
