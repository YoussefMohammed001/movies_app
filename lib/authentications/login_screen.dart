import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
                ),
              )   ,
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text("Forget password")),
              SizedBox(height: 15,),

              Container(
                  width: double.infinity,
                  child: ElevatedButton(

                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                      ),
                      onPressed: (){}, child: Text("Login"))),
              SizedBox(height: 10,),

              Container(
                  width: double.infinity,
                  child: ElevatedButton(

                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(12)
                              )
                          ),
backgroundColor:MaterialStatePropertyAll(Colors.green)
                      ),
                      onPressed: (){}, child: Text("Register",style: TextStyle(color: Colors.white),)))
            ],

          ),
        ),

      ),
    );
  }
}
