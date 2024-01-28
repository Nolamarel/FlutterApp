import 'package:flutter/material.dart';
import 'Second_screen.dart';
//ignore_for_file: prefer_const_constructors

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
        routes: {
        '/': (context) => _MyApp(),
          '/second': (context) => SecondScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: "Flutter project");
  }
}

class _MyApp extends StatelessWidget{
  final cont1 = TextEditingController();
  final cont2 = TextEditingController();
  var pas1 = "";
  var pas2 = "";
  var text = "";
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Sign In to your page"), backgroundColor: Colors.orange[100], centerTitle: true, ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //ElevatedButton(onPressed: (){}, child: Text("My button"),),
              //SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: cont1,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Login",
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: cont2,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150, 50)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.orange.withOpacity(0.5);
                      }
                      return Colors.orange[100]; // Use the component's default.
                    },
                  ),
                ),
                  onPressed: () {
                    pas1 = cont1.text;
                    pas2 = cont2.text;
                    if (CheckPassword().isPasswordValid(pas1, pas2) && CheckPassword().isPasswordEqual(int.parse(pas1), int.parse(pas2))) {
                        Navigator.pushNamed(context, '/second');
                      }
                  },
              child: const Text("SIGN IN", style: TextStyle(color: Colors.black87, fontSize: 18),)),
            ],
          ),
        ),
        );
  }
}

class CheckPassword{
  bool isPasswordValid(String login, String password){
    if(login.length > 8 && password.length > 8){
      return true;
    }
    return false;
  }
  bool isPasswordEqual(int login, int password) {
    if(login == password){
      return true;
    }
    return false;
  }
}


