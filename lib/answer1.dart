import 'dart:async';

import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  String name1 = 'Halinchanok';
  String email = 'phanomworachai_h@su.ac.th';
  String imageUrl =
      'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "โปรไฟล์ผู้ใช้",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center),
          Container(
            padding: EdgeInsets.all(15),
            height: 170,

            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(height: 15),
                Text("ชื่อผู้ใช้: $name1"),
                SizedBox(height: 2),
                Text("อีเมล: $email"),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text("การตั้งค่า"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.blue),
            title: Text("เปลี่ยนรหัสผ่าน"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.blue),
            title: Text("ความเป็นส่วนตัว"),
            onTap: () {},
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("แก้ไขโปรไฟล์")));
            },
            child: Text("แก้ไขโปรไฟล์"),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("ออกจากระบบ")));
            },
            child: Text("ออกจากระบบ"),
          ),
        ],
      ),
    );
  }
}
