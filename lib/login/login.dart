import 'package:flutter/material.dart';
import 'package:minorproject/home/home.dart';
import 'package:minorproject/register/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            // child: Image(
            //   image: AssetImage("images/logo.png"),
            // ),
          ),
          SizedBox(
            height: 30,
          ),
          const Text("Welcome Back",style: TextStyle(
            color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,
          )),
          SizedBox(
            height: 50,
          ),
          const Text("Login Now",style: TextStyle(
              color: Colors.black38,fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextFormField(
              decoration: InputDecoration(
                  label: Text("User Name / Email"),
                  hintText: "Email/user Name",
                  prefixIcon: Icon(
                    Icons.email_outlined,color: Colors.green,size: 24,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Enter password",
                prefixIcon: Icon(
                  Icons.password,color: Colors.green,size: 24,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),

              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 60, 0)),
              Text(
                'Forgot Password..?',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),
          Container(
            child :Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    // ElevatedButton(onPressed: (){}, child: Text("Sign Up")),
                    // ElevatedButton(onPressed: (){}, child: Text("Sign In")),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: EdgeInsets.all(20)
                      ),child: Text("Register")
                    ),
                    Container(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: EdgeInsets.all(20)
                      ), child: Text("Sign In")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
