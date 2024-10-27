import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBillPage extends StatefulWidget {
  final int roomNumber;

  const EditBillPage({super.key, required this.roomNumber});

  @override
  _EditBillPageState createState() => _EditBillPageState();
}

class _EditBillPageState extends State<EditBillPage> {
  final TextEditingController _roomPriceController = TextEditingController();
  final TextEditingController _waterPriceController = TextEditingController();
  final TextEditingController _electricityPriceController = TextEditingController();
  String? _slipPath;

  Future<void> _pickSlip() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _slipPath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แก้ไขบิลห้อง ${widget.roomNumber}',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('ค่าเช่าห้อง (บาท):'),
              _buildTextField(_roomPriceController, 'กรอกค่าเช่าห้อง'),
              const SizedBox(height: 20),

              _buildLabel('ค่าน้ำ (หน่วย):'),
              _buildTextField(_waterPriceController, 'กรอกค่าน้ำ'),
              const SizedBox(height: 20),

              _buildLabel('ค่าไฟ (หน่วย):'),
              _buildTextField(_electricityPriceController, 'กรอกค่าไฟ'),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton.icon(
                  onPressed: _pickSlip,
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text(
                    'แนบรูป',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              _slipPath != null
                  ? Text(
                      'มีสลิปแนบแล้ว: ${_slipPath!.split('/').last}',
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    )
                  : const Text(
                      'ยังไม่มีสลิป',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('บันทึกข้อมูลเรียบร้อย')),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'บันทึก',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      style: GoogleFonts.poppins(),
    );
  }
}
