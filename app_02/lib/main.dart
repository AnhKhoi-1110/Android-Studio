import 'package:flutter/material.dart';
import 'notesApp/view/NoteListScreen.dart'; // Import NoteListScreen


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Thêm const nếu cần
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Ghi chú',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteListScreen(), // Sửa ở đây
    );
  }
}