import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:contact_app/bottom_screen_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> contactList = [];

  void _addContact(String name, String email, String phone, String imagePath) {
    setState(() {
      contactList.add({
        "name": name,
        "email": email,
        "phone": phone,
        "imagePath": imagePath,
      });
    });
  }

  void _deleteCard(int index) {
    setState(() {
      contactList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF29384D),
        title: const Image(
          image: AssetImage("assets/images/Route.png"),
          width: 117,
          height: 39,
        ),
      ),
      body: contactList.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/empty_list.json",
                width: 368, height: 368),
            const Text(
              "There is No Contacts Added Here",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFF1D4),
              ),
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: contactList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final contact = contactList[index];
            return Card(
              color: const Color(0xFFFFF1D4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                    child: contact["imagePath"].isNotEmpty
                        ? Image.file(
                      File(contact["imagePath"]),
                      width: double.infinity,
                      height: 145,
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.image, size: 145),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    contact["name"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF29384D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.email_rounded, size: 20, color: Color(0xFF29384D)),
                      const SizedBox(width: 2),
                      Text(
                        contact["email"],
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone_rounded, size: 20, color: Color(0xFF29384D)),
                      const SizedBox(width: 2),
                      Text(
                        contact["phone"],
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF93E3E),
                      fixedSize: const Size(130, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _deleteCard(index),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_rounded, size: 15, color: Color(0xFFFFFFFF)),
                        SizedBox(width: 6),
                        Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFF1D4),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => BottomScreenSheet(onAddContact: _addContact),
          );
        },
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
