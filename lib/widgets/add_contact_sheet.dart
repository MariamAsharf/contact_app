import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddContactSheet extends StatefulWidget {
  final Function(String, String, String, File?) onAdd;

  AddContactSheet({required this.onAdd});

  @override
  _AddContactSheetState createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _enterData() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty) {
      widget.onAdd(name, email, phone, _image);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: 402,
        height: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF29384D),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 143,
                      height: 146,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                          color: const Color(0xFFFFF1D4),
                        ),
                      ),
                      child: _image == null
                          ? Lottie.asset("assets/images/image_picker.json",
                          width: 143, height: 146)
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _nameController.text.isEmpty ? "User Name" : _nameController.text,
                          style: const TextStyle(
                            color: Color(0xFFFFF1D4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: Color(0xFFFFF1D4)),
                        Text(
                          _emailController.text.isEmpty ? "example@email.com" : _emailController.text,
                          style: const TextStyle(
                            color: Color(0xFFFFF1D4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: Color(0xFFFFF1D4)),
                        Text(
                          _phoneController.text.isEmpty ? "+200000000000" : _phoneController.text,
                          style: const TextStyle(
                            color: Color(0xFFFFF1D4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                style: const TextStyle(color: Color(0xFFFFF1D4)),
                decoration: InputDecoration(
                  hintText: "Enter User Name",
                  hintStyle: const TextStyle(color: Color(0xFFFFF1D4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                ),
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Color(0xFFFFF1D4)),
                decoration: InputDecoration(
                  hintText: "Enter User Email",
                  hintStyle: const TextStyle(color: Color(0xFFFFF1D4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                ),
                ),
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phoneController,
                style: const TextStyle(color: Color(0xFFFFF1D4)),
                decoration: InputDecoration(
                  hintText: "Enter User Phone",
                  hintStyle: const TextStyle(color: Color(0xFFFFF1D4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                  ),focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFFFF1D4)),
                ),
                ),
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(370, 59),
                  backgroundColor: const Color(0xFFFFF1D4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _enterData,
                child: const Center(
                  child: Text(
                    "Enter user",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF29384D),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
