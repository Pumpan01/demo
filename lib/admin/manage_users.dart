import 'package:flutter/material.dart';
import 'edit_user.dart'; // นำเข้าไฟล์ edit_user.dart

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จัดการผู้ใช้งาน'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการผู้ใช้งาน',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,  // จำนวนผู้ใช้ที่ต้องการแสดง (สามารถเชื่อมต่อกับ backend ได้)
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('ห้องหมายเลข ${index + 101}'),
                      subtitle: const Text('สถานะ: ผู้ใช้งานทั่วไป'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // นำไปหน้าแก้ไขผู้ใช้
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditUserPage(
                                fullName: 'นายสมชาย ใจดี',   // ส่งชื่อเต็มผู้ใช้
                                phoneNumber: '098-765-4321', // ส่งเบอร์โทร
                                roomNumber: '101',            // ส่งเลขห้อง
                                monthlyRent: '3200',          // ส่งค่าเช่า
                                emergencyContact: 'สมปอง โจดี', // ส่งข้อมูลผู้ติดต่อฉุกเฉิน
                                lineId: 'somchai123',         // ส่ง Line ID
                              ),
                            ),
                          );
                        },
                        child: const Text('แก้ไข'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
