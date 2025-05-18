// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUI extends StatefulWidget {
  // สร้างตัวแปรรับค่าที่จะส่งมา
  double? carPrice;
  double? payPerMount;
  int? month;

  // เอาตัวแปรที่สร้างมารอรับค่าที่ส่งมา
  ResultScreenUI({super.key, this.carPrice, this.payPerMount, this.month});

  @override
  State<ResultScreenUI> createState() => _ResultScreenUIState();
}

class _ResultScreenUIState extends State<ResultScreenUI> {
  @override
  Widget build(BuildContext context) {
    // กำหนดรูปแบบของตัวเลข ณ ที่นี้ คอมมาคันหลักพัน/ล้าน และทศนิยม 2 ตำแหน่ง
    NumberFormat fm = NumberFormat("#,###,##0.00");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Ci Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'ผ่อนทั้งหมด ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ), // สีปกติ
                  ),
                  TextSpan(
                    text: '${widget.month}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ), // สีแดงเฉพาะตัวเลข
                  ),
                  TextSpan(
                    text: ' เดือน',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ), // สีปกติ
                  ),
                ],
              ),
            ),
            Text(
              'ค่างวดรถต่อเเดือน',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${fm.format(widget.payPerMount)}',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'บาท',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
