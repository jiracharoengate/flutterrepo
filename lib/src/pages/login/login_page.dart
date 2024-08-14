import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/models/user.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Widget ที่เป็น Stateless จะไม่อนุญาติให้สร้างตัวแปรได้
// Widget ที่เป็น Stateful จะสามราถให้สร้างตัวแปรได้ เพื่อทำการ update ค่าบางอย่าง
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ใส่ underscore หน้าตัวแปรเป็นการบอกว่าตัวแปรนี้เป็น private default จะเป็น public เสมอ
  final _usernameControler = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    //เป็น method ที่ใช้เรียกเมื่อมีการกำหนดค่าต่างๆให้ตัวแปร
    super.initState();
    _usernameControler.text = "admin";
    _passwordController.text = "password";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("Login Page : ${state.count}");
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          // ถ้าต้องการระบุ padding ของแต่ละฝั่งให้ใส่เปน only แทน all
          //padding: const EdgeInsets.only(top: 32.0, left: 16.0),
          padding: const EdgeInsets.all(32.0),
          child: Card(
            child: Container(
              height: 650,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildTextField(),
                  SizedBox(
                    height: 12,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Text("Login Result :${state.isAuthened ? "Success" : "Error"}",
                        style: TextStyle(color: state.isAuthened ? Colors.green : Colors.red));
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  //... คือการ destructuring เพื่อถอดค่า array ออกมาแสดงผล
                  ..._buildButtons(),

                  Row(
                    children: [
                      //การเรียกใช้งาน ตัวแปร count local
                      //Text("Debug: $count"),
                      //การเรียกใช้งาน ตัวแปร แบบ bloc
                      //Text("Debug: ${context.read<LoginBloc>().state.count}"),
                      BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                        return Text("Debug X :${state.count}");
                      }),
                      // Separation of concern คือ การแยก code ออกเป็นส่วนๆ การทำงาน เพื่อให้ code ดูเป็นสัดส่วนมากขึ้น
                      IconButton(
                          icon: Icon(Icons.add),
                          iconSize: 50,
                          onPressed: () =>
                              //_handleClickAdd();
                              // context คือ object ที่เป็นตัวแทนของ application เอาไว้เก็บค่าต่างๆ เช่น function ขั้นพื้นฐาน , ตัวแปรขั้นพิ้นฐาน ใน program
                              //context.read เป็นการเรียกใช้งาน function , event
                              context.read<LoginBloc>().add(LoginAddEvent())),
                      // Separation of concern คือ การแยก code ออกเป็นส่วนๆ การทำงาน เพื่อให้ code ดูเป็นสัดส่วนมากขึ้น
                      IconButton(
                          icon: Icon(Icons.remove),
                          iconSize: 50,
                          onPressed: () =>
                              //_handleClickRemove();
                              // context คือ object ที่เป็นตัวแทนของ application เอาไว้เก็บค่าต่างๆ เช่น function ขั้นพื้นฐาน , ตัวแปรขั้นพิ้นฐาน ใน program
                              //context.read เป็นการเรียกใช้งาน function , event
                              context.read<LoginBloc>().add(LoginRemoveEvent()))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTextField() {
    return [
      TextField(
        controller: _usernameControler,
        decoration: InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButtons() {
    return [
      ElevatedButton(
        // =>เป็นการเขียนแบบ express จะเหมาะกับคำสั่งที่ทำงานเพียงอย่างเดียว
        // {} เป็นการเขียนแบบ body จะเหมาะกับคำสั่งที่มีมากกว่า1
        //onPressed: () => print("CMDev Login:"),

        //_handleClickLogin คือ functional variable ใช้สำหรับทำเป็นตัวแปร เพื่อไปสร้าง method
        onPressed: _handleClickLogin,
        child: Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      ),
      ElevatedButton(onPressed: _handleClickRegister, child: Text('Register'))
    ];
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoutes.register);
  }

/*
  void _handleClickAdd() {
    // state (MVVM)
    // การที่จะให้ ui update ค่าต้องใช้ ผ่าน function ที่ชื่อว่า setState()
    // หลักการคือ การเรียก build ให้ reload อีกที
    setState(() {
      count++;
    });
  }

  void _handleClickRemove() {
    // การที่จะให้ ui update ค่าต้องใช้ ผ่าน function ที่ชื่อว่า setState()
    // หลักการคือ การเรียก build ให้ reload อีกที
    count--;
    setState(() {});
  }
*/
  void _handleClickLogin() {
    //การใส่ ${} เข้าไป function print เพื่อเป็นการบอกว่าจะแสดงผลค่าตัวแปรนั้นๆ
    //print("Login with: ${_usernameControler.text} , ${_passwordController.text} ");
    //Navigator.pushNamed(context, AppRoutes.home);

    final userPayLoad = User(
                          username: _usernameControler.text,
                          password: _passwordController.text);
    context.read<LoginBloc>().add(LoginEventLogin(userPayLoad));
  }

  void _handleClickReset() {
    _usernameControler.text = '';
    _passwordController.text = '';
  }
}
