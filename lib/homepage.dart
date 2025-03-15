import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  String imageUrl =
      'https://i.pinimg.com/736x/0d/87/b0/0d87b02860e3fcd3ea5b25b03adffb5e.jpg';
  String name = 'Halinchanok Phanomworachai';
  String nickname = 'Genie';
  String mail = 'Phanomworachai_h@su.ac.th';
  String phone = '088-281-5624';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 132, 151),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 229, 234),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  0.1,
                ), // Adjust shadow visibility
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 50, backgroundImage: NetworkImage(imageUrl)),
              Text(
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                nickname,
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 12, 36, 108),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail),
                  SizedBox(width: 10),
                  Text(mail, style: TextStyle(fontSize: 12)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.black),
                  SizedBox(width: 10),
                  Text(phone, style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
