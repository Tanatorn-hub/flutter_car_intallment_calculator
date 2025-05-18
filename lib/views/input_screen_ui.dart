// ignore_for_file: unused_element, unused_field, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_car_intallment_calculator/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

class InputScreenUI extends StatefulWidget {
  const InputScreenUI({super.key});

  @override
  State<InputScreenUI> createState() => _InputScreenUIState();
}

class _InputScreenUIState extends State<InputScreenUI> {
  //สร้างตัวแปรควบคุม textfield
  TextEditingController _carPriceCtrl = TextEditingController();
  TextEditingController _interestCtrl = TextEditingController();

  // สร้างตัวแปรควบคุม radio
  int _downCtrl = 10;

  // สร้างตัวแปรควบคุม Dropdown
  int _monthCtrl = 24;

  //สร้างตัวแปรเก็บรูปที่เลือกจากกล้องหรือแกลอรี่
  File? _imageFile;

// สร้างเมธอด แสดง Dailog แจ้งเตือน
  _wrningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('คำเตือน'),
        content: Text(msg),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context); // ปิด dialog
            },
            child: Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  //สร้างเมธอดเปิดกล้อง
  _openCamera() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  //สร้างเมธอดเปิดแกลอรี่
  _openGallery() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Ci Calculator',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 40,
              left: 40,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    'คำนวณค่างวดรถ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        // เปิด snackbar ให้ผู้ใช้เลือกเปิดกล้องหรือแกลอรี่
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    _openCamera();
                                  },
                                  title: Text(
                                    'เปิดกล้อง (Open Camera)',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  leading: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    _openGallery();
                                  },
                                  title: Text(
                                    'เปิดแปลแกลอรี่ (Open Gallery)',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  leading: Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: _imageFile == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/img02.png',
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                _imageFile!,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ราคารถ (บาท)',
                    ),
                  ),
                  TextField(
                    controller: _carPriceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'จำนวนเงินดาวน์ (%)',
                    ),
                  ),

                  // radio----------------------------------------
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 10,
                        groupValue: _downCtrl,
                      ),
                      Text(
                        '10',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 20,
                        groupValue: _downCtrl,
                      ),
                      Text(
                        '20',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 30,
                        groupValue: _downCtrl,
                      ),
                      Text(
                        '30',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 40,
                        groupValue: _downCtrl,
                      ),
                      Text(
                        '40',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 50,
                        groupValue: _downCtrl,
                      ),
                      Text(
                        '50',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            _downCtrl = value!;
                          });
                        },
                        value: 60,
                        groupValue: _downCtrl,
                      ),
                      Text(
                        '60',
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ระยะเวลาผ่อน (เดือน)',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: DropdownButton<int>(
                        value: _monthCtrl,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (int? value) {
                          setState(() {
                            _monthCtrl = value!;
                          });
                        },
                        items: <int>[
                          //กำหนดจำนวนเดือน  ถ้าดป็นข้อความ ต้องเปลี่ยน int เป็น String
                          24,
                          36,
                          48,
                          60,
                          72,
                        ].map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              'ผ่อน $value เดือน', //เติมคำว่าเดือน
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'อัตราดอกเบี้ย (%/ปี)',
                    ),
                  ),
                  TextField(
                    controller: _interestCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // validate ui หากมีปัญหาให้แสดง dialog แจ้งเตือน
                      if (_carPriceCtrl.text.isEmpty) {
                        _wrningDialog("ป้อนราคารถด้วย..!!");
                      } else if (_interestCtrl.text.isEmpty) {
                        _wrningDialog("ป้อนอัตราดอกเบี้ยด้วย..!!");
                      } else {
                        // พร้อมคำนวณแล้วส่งไปแสดงผลที่หน้า ResultScreenUI
                        // แปลงราคากับอัตราดอกเบี้ยเป็นตัวเลขก่อน
                        double carPrice = double.parse(_carPriceCtrl.text);
                        double interest = double.parse(_interestCtrl.text);
                        // คิดยอดจัด = ราคารถ - เงินดาวน์
                        double balance =
                            carPrice - (carPrice * _downCtrl / 100);
                        // คิดดอกเบี้ยที่ต้องจ่ายทั้งหมด = (ยอดจัด * อัตราดอกเบี้ย /100 /12) * ระยะเวลาผ่อน
                        double totalInterest =
                            (balance * interest / 100 / 12) * _monthCtrl;
                        // คิดยอดที่ต้องผ่อนต่อเดือน = (ยอดจัด + ดอกเบี้ยที่ต้องจ่ายทั้งหมด) / ระยะเวลาผ่อน
                        double payPerMount =
                            (balance + totalInterest) / _monthCtrl;
                        // แสดงผลที่หน้า ResultScreenUI เปิดแบบย้อนกลับได้
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreenUI(
                              carPrice: carPrice,
                              payPerMount: payPerMount,
                              month: _monthCtrl,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'คำนวณ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        55,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _carPriceCtrl.clear();
                        _downCtrl = 10;
                        _monthCtrl = 24;
                        _interestCtrl.clear();
                      });
                      // เคลียร์ทุกอย่างให้เป็นเหมือนเดิม
                    },
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        55,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
