import 'package:flutter/material.dart';
import 'edit_bill_page.dart'; // นำเข้าไฟล์ edit_bill_page.dart เพื่อไปหน้าแก้ไขบิล

class ManageBillsPage extends StatelessWidget {
  const ManageBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จัดการบิล'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการบิลค้างชำระ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // จำนวนห้องที่ต้องการแสดง
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('ห้อง ${index + 1}'),
                      subtitle: const Text('ยอดค้างชำระ: 3200 บาท'),
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
