import 'package:flutter/material.dart';
import 'edit_user.dart'; // นำเข้าไฟล์ edit_user.dart

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จัดการผู้ใช้งาน'),
        backgroundColor: Colors.orange, // เปลี่ยนสี AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการผู้ใช้งาน',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.orange, // สีส้มสำหรับหัวข้อหลัก
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,  // จำนวนผู้ใช้ที่ต้องการแสดง
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // มุมโค้งมนของการ์ด
                    ),
                    elevation: 5, // เพิ่มเงาให้กับการ์ด
                    margin: const EdgeInsets.symmetric(vertical: 10), // เพิ่มระยะห่างระหว่างการ์ด
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16), // เพิ่ม Padding ในการ์ด
                      title: Text(
                        'ห้องหมายเลข ${index + 101}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87, // สีข้อความหลัก
                        ),
                      ),
                      subtitle: const Text(
                        'สถานะ: ผู้ใช้งานทั่วไป',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // สีข้อความย่อย
                        ),
                      ),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // สีปุ่มเป็นสีส้ม
                          padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // ปุ่มโค้งมน
                          ),
                        ),
                        child: const Text(
                          'แก้ไข',
                          style: TextStyle(color: Colors.white), // ตัวอักษรสีขาว
                        ),
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
