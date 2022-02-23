import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late Icon icon;
  bool _visible = false;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController = TextEditingController();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: [

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.book, size: 150, color: Colors.deepOrange,),
                        SizedBox(height: 16,),
                        Text('LANDMARK', style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10),


                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(

                            enabledBorder: OutlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined, color: Colors.white,),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 20),

                        TextFormField(
                          controller: passwordTextEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'entrez votre password';
                            }
                            if (value!.length < 6) {
                              return 'Mot de pass court';
                            }
                            setState(() {
                              password = value!;
                            });
                            return null;
                          },
                          obscureText: _visible == false ? true : false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: _visible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _visible = !_visible;
                                  });
                                }),
                            enabledBorder: OutlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.vpn_key_outlined, color: Colors.white,),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(

                          obscureText: _visible == false ? true : false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: _visible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _visible = !_visible;
                                  });
                                }),
                            enabledBorder: OutlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Confirmer Password',
                            prefixIcon: Icon(Icons.vpn_key_outlined, color: Colors.white,),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                  color: Colors.deepOrangeAccent,
                                  onPressed: () {


                                  },
                                  child: Text(
                                    "VALIDER",
                                    style: TextStyle(
                                        color: Colors.white,

                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),


                        SizedBox(height: 20),

                        // RaisedButton(
                        //   color: Colors.blue,
                        //   onPressed: () {
                        //     Navigator.pushReplacementNamed(
                        //         context, RegisterScreen.id);
                        //   },
                        //   child: Text('register'),
                        // )
                      ])
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
