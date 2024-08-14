part of 'login_bloc.dart';


// file ที่เอาไว้เก็บ event หรือ action ต่างๆ แค่ นิยามเฉยๆว่ามีอะไรบ้าง แต่ไม่มี implements

abstract class LoginEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];


}


class LoginAddEvent extends LoginEvent{

}

class LoginRemoveEvent extends LoginEvent{

}


class LoginEventLogin extends LoginEvent{
  final User payLoad;
  LoginEventLogin(this.payLoad);
}