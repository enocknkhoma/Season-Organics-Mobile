
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/view/authentication/otp.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
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

  // File? _selectedImage;
final ImagePicker _selectedImage = ImagePicker();
// Pick an image.
// final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQtyController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0, // Adjust the elevation as needed
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Manage Product",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const Image(
              width: 60,
              height: 60,
              image: AssetImage('assets/images/user.png'),
            ),
          ),
        ],
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
                    child: TextFormField(
                      controller: _productNameController,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.label,
                          color: Colors.black,
                          size: 20,
                        ),
                        labelText: 'Product Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Product Name cannot be blank';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _productPriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.calculate,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'Price',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Price Cannot be blank' : null,
                            // Configuration for the second TextFormField
                            // ...
                          ),
                        ),
                        SizedBox(width: 20), // Adjust the width as needed
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.category,
                                color: Colors.black,
                                size: 20,
                              ),
                              labelText: 'Category',
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
                            validator: (value) => value == null
                                ? 'Please select a Category'
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: TextFormField(
                      controller: _productQtyController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.poll,
                          color: Colors.black,
                          size: 20,
                        ),
                        labelText: 'Quantity',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Quantity Cannot be blank' : null,
                    ),
                  ),

// ... Other code ...

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload Product Image',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // TODO: Open image picker and update _selectedImage
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            backgroundColor: Colors.grey[300],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.cloud_upload,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                _selectedImage == null
                                    ? 'Select an image'
                                    : 'Image selected',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
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
                        labelText: 'Product Description',
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
                              'Add Product',
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
