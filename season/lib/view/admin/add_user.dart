import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:season/view/authentication/otp.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _key = GlobalKey<FormState>();
  bool loading = false;

  bool validate() {
    final form = _key.currentState;
    form!.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _selectedGender = 'Male';

  List<String> _genderOptions = ['Male', 'Female', 'Other'];

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Add Driver',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _key,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 10, top: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstnameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'firstname',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Firstname Cannot be blank'
                                : null,
                          ),
                        ),
                        SizedBox(width: 20), // Adjust the width as needed
                        Expanded(
                          child: TextFormField(
                            controller: _lastnameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'Lastname',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Lastname Cannot be blank'
                                : null,
                            // Configuration for the second TextFormField
                            // ...
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black,
                          size: 20,
                        ),
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Email Cannot be blank' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 20,
                        ),
                        labelText: 'Mobile Number',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Phonenumber Cannot be blank' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () => _selectDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'Date of Birth',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            child: Text(
                              _selectedDate == null
                                  ? 'Select Date'
                                  : DateFormat('yyyy-MM-dd')
                                      .format(_selectedDate!),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )),
                        SizedBox(width: 20), // Adjust the width as needed
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'Gender',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            value: _selectedGender,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedGender = newValue!;
                              });
                            },
                            items: _genderOptions.map((String gender) {
                              return DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              );
                            }).toList(),
                            validator: (value) =>
                                value == null ? 'Please select a gender' : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: TextField(
                      controller: _addressController,
                      maxLines: 5, // Set the number of lines for the textarea
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 20,
                        ),
                        labelText: 'Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const OTPScreen());
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
