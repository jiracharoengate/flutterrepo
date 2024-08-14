import 'package:bloc/bloc.dart';
import 'package:cmflutter0/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

// file ที่เอาไว้ใส่ business logic ต่างๆ
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    // ดักฟัง event add เมื่อเกิด การกดปุ่ม Add แล้วให้ทำอะไร
    on<LoginAddEvent>((event, emit) async {
      // TODO: implement event handler
      //execute something
      // Future คือ object ที่ทำ asynchronous
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(count: state.count + 1));
    });
    // ดักฟัง event remove เมื่อเกิด การกดปุ่ม remove แล้วให้ทำอะไร
    on<LoginRemoveEvent>((event, emit) async {
      // TODO: implement event handler
      //execute something
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(count: state.count - 1));
    });

    // ดักฟัง event login เมื่อเกิด การกดปุ่ม login แล้วให้ทำอะไร
    on<LoginEventLogin>((event, emit) async {
      // TODO: implement event handler
      //execute something
      if (event.payLoad.username == "admin" &&
          event.payLoad.password == "1234") {
        emit(state.copyWith(isAuthened: true));
      } else {
        emit(state.copyWith(isAuthened: false));
      }
    });
  }
}
