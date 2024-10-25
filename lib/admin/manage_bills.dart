import 'package:flutter/material.dart';
import 'edit_bill_page.dart'; // นำเข้าไฟล์ edit_bill_page.dart เพื่อไปหน้าแก้ไขบิล

class ManageBillsPage extends StatelessWidget {
  const ManageBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จัดการบิล'),
        backgroundColor: Colors.orange, // เพิ่มสีพื้นหลัง AppBar ให้เป็นสีส้ม
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการบิลค้างชำระ',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Colors.orange, // เพิ่มสีตัวอักษร
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // จำนวนห้องที่ต้องการแสดง
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4, // เพิ่มเงาให้กับ Card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // เพิ่มความโค้งมน
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10), // เพิ่มระยะห่างระหว่างการ์ด
                    child: ListTile(
                      title: Text(
                        'ห้อง ${index + 1}',
                        style: const TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'ยอดค้างชำระ: 3200 บาท',
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.black54, // เปลี่ยนสี subtitle ให้ดูอ่อนลง
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // เมื่อกด "แก้ไข" จะไปหน้าแก้ไขบิล
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditBillPage(roomNumber: index + 1),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // ปรับสีปุ่มให้เป็นสีส้ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // เพิ่มความโค้งมนให้ปุ่ม
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
