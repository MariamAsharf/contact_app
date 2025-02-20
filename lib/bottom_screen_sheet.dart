import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BottomScreenSheet extends StatefulWidget {
  final Function(String, String, String, String) onAddContact;

  const BottomScreenSheet({super.key, required this.onAddContact});

  @override
  State<BottomScreenSheet> createState() => _BottomScreenSheetState();
}

class _BottomScreenSheetState extends State<BottomScreenSheet> {
  String UserName = "User Name";
  String UserEmail = "example@email.com";
  String UserPhone = "+200000000000";
  XFile? _pickedImage;

  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        _pickedImage = image;
      },
    );
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
                      child: _pickedImage == null
                          ? Lottie.asset("assets/images/image_picker.json",
                              width: 143, height: 146)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(_pickedImage!.path),
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
                          UserName,
                          style: const TextStyle(
                            color: Color(0xFFFFF1D4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(
                          color: Color(0xFFFFF1D4),
                        ),
                        Text(
                          UserEmail,
                          style: const TextStyle(
                            color: Color(0xFFFFF1D4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(
                          color: Color(0xFFFFF1D4),
                        ),
                        Text(
                          UserPhone,
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
                style: const TextStyle(
                  color: Color(0xFFFFF1D4),
                ),
                decoration: InputDecoration(
                  hintText: "Enter User Name",
                  hintStyle: const TextStyle(
                    color: Color(0xFFFFF1D4),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFF1D4),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState() {
                    UserName = value.isEmpty ? "User Name" : value;
                  }
                },
              ),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(
                  color: Color(0xFFFFF1D4),
                ),
                decoration: InputDecoration(
                  hintText: "Enter User Email",
                  hintStyle: const TextStyle(
                    color: Color(0xFFFFF1D4),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFF1D4),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState() {
                    UserEmail = value.isEmpty ? "example@email.com" : value;
                  }
                },
              ),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(
                  color: Color(0xFFFFF1D4),
                ),
                decoration: InputDecoration(
                  hintText: "Enter User Phone",
                  hintStyle: const TextStyle(
                    color: Color(0xFFFFF1D4),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFF1D4),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState() {
                    UserPhone = value.isEmpty ? "+200000000000" : value;
                  }
                },
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
                onPressed: () {
                  widget.onAddContact(
                    UserName,
                    UserEmail,
                    UserPhone,
                    _pickedImage?.path ?? "",
                  );
                  Navigator.pop(context);
                },
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
