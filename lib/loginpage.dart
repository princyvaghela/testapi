// import 'package:e_commerce_api/views/auth/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:testapi/register.dart';

// import '../../controller/admin/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.text ="anna@gmail.com";
    passwordController.text ="secret";
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login Screen',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login logic here
                    // AuthController().doLogin(isLoader: true, email: emailController.text, password: passwordController.text,context: context);
                  }
                },

                child: const Text('Login',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  const Center(
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePage(),));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

