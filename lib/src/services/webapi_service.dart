import 'package:cmflutter0/src/models/youtube_response.dart';
import 'package:dio/dio.dart';

class WebApiService{
  Future<List<Youtube>> feed() async {
    final dio = Dio();
    // await เป็นคำสั่งว่าให้หยุดรอผลลัพธ์ก่อนแล้วค่อยรัน command บรรทัดถัดไป
    final result = await dio.get("https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
    final youtubeResponse = youtubeResponseFromJson(result.data);
    return youtubeResponse.youtubes;

  }
}