part of 'login_bloc.dart';

// file ที่่ใช้เก็บตัวแปร state ต่างๆ
class LoginState extends Equatable{
  // หลักการ ของ MVVM ห้าม interfear ตัวแปร หมายถึง
  // ห้าม update ค่าตัวแปรตรงๆ เพื่อป้องกันการ render ที่ผิดเพี้ยน ตัวแปรก็เลยต้องประกาศเป็น final
  //การจะ update ค่าตัวแปร ต้องทำการสร้าง object ของตัวแปร เป็นตัวใหม่ ออกไปอีกชุดนึง
  final int count;

  final bool isAuthened;

  //require เป็นการระบุว่าต้องมีการใส่ค่าเข้ามาเมื่อมีการเรียกใช้งาน
  const LoginState({this.count =0 , this.isAuthened = false});

  //? คือ optional คือจะส่งเข้ามาหรือไม่ก็ได้
  LoginState copyWith({int? count , bool? isAuthened }){
    // ถ้าไม่มีการส่งค่าเข้ามา ให้ใช้ค่า count ของตัวเดิม
    return LoginState(count: count ?? this.count , isAuthened: isAuthened ?? this.isAuthened);
  }

  @override
  // array ตรงนี้จะเป็นตัวบอกว่า ตัวแปรไหนที่จะให้ UI update บ้าง ถ้า ต้วแปรที่ไหนที่ไม่ต้องการ update ก็ไม่ต้องใส่
  List<Object?> get props => [count , isAuthened];
}
