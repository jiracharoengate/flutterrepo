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
    super.initState();
    WebApiService().feed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      //FutureBuilder คือ Widget ที่ใช้แสดงผลข้อมูลแบบ Asynchonous
      body: Container(
          child: FutureBuilder(
              future: WebApiService().feed(),
              // ค่าของ ผลลัพธ์จะอยู่ภายใต้ snapshot
              builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return const Text('Loading...');
                }
                final youtubes = snapshot.data;

                //Better Performance
                return ListView.builder(
                    itemCount: youtubes!.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () => print(youtubes[index].title),
                        child: Card(
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  youtubes[index].title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(youtubes[index].subtitle),
                                Image.network(youtubes[index].youtubeImage),
                              ]),
                        ),
                      );
                    });
              })),
    );
  }
}
