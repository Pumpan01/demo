import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  final String fullName;
  final String phoneNumber;
  final String roomNumber;
  final String monthlyRent;
  final String emergencyContact;
  final String lineId;

  const EditUserPage({
    Key? key,
    required this.fullName,
    required this.phoneNumber,
    required this.roomNumber,
    required this.monthlyRent,
    required this.emergencyContact,
    required this.lineId,
  }) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _roomNumberController;
  late TextEditingController _monthlyRentController;
  late TextEditingController _emergencyContactController;
  late TextEditingController _lineIdController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _roomNumberController = TextEditingController(text: widget.roomNumber);
    _monthlyRentController = TextEditingController(text: widget.monthlyRent);
    _emergencyContactController = TextEditingController(text: widget.emergencyContact);
    _lineIdController = TextEditingController(text: widget.lineId);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _roomNumberController.dispose();
    _monthlyRentController.dispose();
    _emergencyContactController.dispose();
    _lineIdController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('บันทึกการแก้ไขข้อมูลสำเร็จ')),
    );
    Navigator.pop(context); // กลับไปหน้าก่อนหน้า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขข้อมูลผู้เช่า'),
        backgroundColor: Colors.orange, // สี AppBar เป็นสีส้ม
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'แก้ไขข้อมูลห้องพัก',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 20),

              // ฟิลด์กรอกชื่อเต็ม
              _buildTextField(
                controller: _fullNameController, 
                labelText: 'ชื่อเต็ม',
              ),
              const SizedBox(height: 20),

              // ฟิลด์กรอกหมายเลขโทรศัพท์
              _buildTextField(
                controller: _phoneNumberController, 
                labelText: 'หมายเลขโทรศัพท์',
              ),
              const SizedBox(height: 20),

              // ฟิลด์กรอกเลขห้อง
              _buildTextField(
                controller: _roomNumberController, 
                labelText: 'เลขห้อง',
              ),
              const SizedBox(height: 20),

              // ฟิลด์กรอกค่าเช่ารายเดือน
              _buildTextField(
                controller: _monthlyRentController, 
                labelText: 'ค่าเช่ารายเดือน (บาท)', 
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // ฟิลด์กรอกผู้ติดต่อฉุกเฉิน
              _buildTextField(
                controller: _emergencyContactController, 
                labelText: 'ผู้ติดต่อฉุกเฉิน',
              ),
              const SizedBox(height: 20),

              // ฟิลด์กรอก Line ID
              _buildTextField(
                controller: _lineIdController, 
                labelText: 'Line ID',
              ),
              const SizedBox(height: 30),

              // ปุ่มบันทึกการแก้ไข
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // ปุ่มสีส้ม
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5, // เพิ่มเงาให้กับปุ่ม
                  ),
                  child: const Text(
                    'บันทึกการแก้ไข',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // ตัวอักษรสีขาว
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง TextField พร้อมสไตล์
  Widget _buildTextField({
    required TextEditingController controller, 
    required String labelText, 
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // โค้งมน
        ),
        filled: true,
        fillColor: Colors.grey[100], // พื้นหลังสีเทาอ่อน
      ),
    );
  }
}
