import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
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
            //      onSaved!(emailController.text,phoneController.text);
                  Navigator.pop(context,{
                    "email":emailController.text,
                    "phone":phoneController.text
                  });
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
