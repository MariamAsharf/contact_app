import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/contact.dart';
import '../widgets/add_contact_sheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];

  void _addContact(String name, String email, String phone, File? image) {
    if (contacts.length < 6) {
      setState(() {
        contacts
            .add(Contact(name: name, email: email, phone: phone, image: image));
      });
    }
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _deleteAllContacts() {
    setState(() {
      contacts.clear();
    });
  }

  void _showAddContactSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      builder: (context) => AddContactSheet(onAdd: _addContact),
    );
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
      body: contacts.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/empty_list.json',
                ),
            const Text(
              "There are no contacts added here",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: contacts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return Card(
              color: const Color(0xFFFFF1D4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: contact.image != null
                            ? Image.file(
                          contact.image!,
                          width: double.infinity,
                          height: 145,
                          fit: BoxFit.cover,
                        )
                            : const Icon(Icons.image, size: 145),
                      ),
                      Positioned(
                        top: 100,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          width: 90,
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFFFF1D4),
                          ),
                          child: Text(
                            contact.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF29384D),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.email_rounded,
                        size: 20,
                        color: Color(0xFF29384D),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          contact.email,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_rounded,
                        size: 20,
                        color: Color(0xFF29384D),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          contact.phone,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF93E3E),
                      fixedSize: const Size(130, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _deleteContact(index),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_rounded,
                          size: 15,
                          color: Color(0xFFFFFFFF),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              backgroundColor: const Color(0xFFF93E3E),
              onPressed: _deleteAllContacts,
              child: const Icon(
                Icons.delete,
                size: 24,
                color: Color(0xFFFFF1D4),
              ),
            ),
          if (contacts.isNotEmpty) const SizedBox(height: 8),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: _showAddContactSheet,
            child: const Icon(Icons.add, color: Color(0xFF29384D)),
          ),
        ],
      ),
    );
  }
}
