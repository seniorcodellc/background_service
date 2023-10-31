import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  Screen1({this.onSaved,super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  Function(String email,String phone)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "enter email"),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(hintText: "enter phone"),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed:() {
                  onSaved!(emailController.text,phoneController.text);
                }, //address
                child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }

}
