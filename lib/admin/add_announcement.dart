import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({super.key});

  @override
  _AddAnnouncementPageState createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  void _saveAnnouncement() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('บันทึกประกาศเรียบร้อย')),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มประกาศใหม่',
          style: GoogleFonts.prompt(),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'สร้างประกาศใหม่',
                  style: GoogleFonts.prompt(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ช่องกรอกชื่อประกาศ
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'ชื่อประกาศ',
                    labelStyle: GoogleFonts.prompt(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // ช่องกรอกรายละเอียดประกาศ
                TextFormField(
                  controller: _detailController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'รายละเอียดประกาศ',
                    labelStyle: GoogleFonts.prompt(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรายละเอียดประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // ปุ่มบันทึกประกาศ
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _saveAnnouncement,
                    icon: const Icon(Icons.save, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    label: Text(
                      'บันทึกประกาศ',
                      style: GoogleFonts.prompt(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
