import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แจ้งเตือน'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('ประกาศน้ำไม่ไหล'),
            subtitle: Text('วันนี้น้ำจะไม่ไหลตั้งแต่ 8 โมงเช้าถึงเที่ยง'),
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('ห้องว่างเหลือ'),
            subtitle: Text('ห้องว่างตอนนี้: 101, 204, 305'),
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('ประกาศซ่อมบำรุง'),
            subtitle: Text('จะมีการซ่อมบำรุงในอาคาร เริ่มวันจันทร์นี้'),
          ),
        ],
      ),
    );
  }
}
