import 'dart:io';

class Contact {
  String name;
  String email;
  String phone;
  File? image;

  Contact({required this.name, required this.email, required this.phone, this.image});
}
