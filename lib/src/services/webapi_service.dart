import 'package:dio/dio.dart';

class WebApiService{
  Future<void> feed() async {
    final dio = Dio();
    // await เป็นคำสั่งว่าให้หยุดรอผลลัพธ์ก่อนแล้วค่อยรัน command บรรทัดถัดไป
    final result = await dio.get("https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
    print(result.data);
  }
}