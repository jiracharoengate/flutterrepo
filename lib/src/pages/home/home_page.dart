import 'package:cmflutter0/src/services/webapi_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {

  //จะถูกเรียก อัตโนมัติ เมื่อ Widget กำลังจะ render โดย สามารถจะ initial ค่าก่อนที่มันจะ render ได้
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WebApiService().feed();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Text("1234"),
      ),
    );
  }
}
