import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                // Temporary login logic (mocking authentication)
                if (email == 'test@test.com' && password == 'password123') {
                  // Simulating successful login with a dummy token
                  String token = 'dummy_token_12345';
                  print("Login Successful: Token: $token");

                  // Navigate to the next screen (e.g., Dashboard)
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } else {
                  // Show error message for incorrect credentials
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Login Failed"),
                      content: Text("Invalid email or password."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
