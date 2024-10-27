import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_user.dart'; // นำเข้าไฟล์ edit_user.dart

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'จัดการผู้ใช้งาน',
          style: GoogleFonts.prompt(
            textStyle: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'รายการผู้ใช้งาน',
              style: GoogleFonts.prompt(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // จำนวนผู้ใช้ที่ต้องการแสดง
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(
                          'ห้องหมายเลข ${index + 101}',
                          style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          'สถานะ: ผู้ใช้งานทั่วไป',
                          style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditUserPage(
                                  fullName: 'นายสมชาย ใจดี',
                                  phoneNumber: '098-765-4321',
                                  roomNumber: '101',
                                  monthlyRent: '3200',
                                  emergencyContact: 'สมปอง โจดี',
                                  lineId: 'somchai123',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'แก้ไข',
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
