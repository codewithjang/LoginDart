import 'package:flutter/material.dart';
import 'package:my_first_app/Hm2/intro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    showDialog(
      // แสดง dialog ข้อมูลที่กรอกไป
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Login Data"),
        content: Text("Username: $username\nPassword: $password"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.deepOrange),
      //     onPressed: () {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(builder: (context) => const IntroPage()),
      //       );
      //     },
      //   ),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_hm2.png"),
            fit: BoxFit.cover, //เต็มจอ
          ),
        ),
        child: Stack(
          children: [
            // ปุ่ม Back มุมซ้ายบน
            Positioned(
              top: 40, // ระยะจากบน
              left: 16, // ระยะจากซ้าย
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.deepOrange,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                  );
                },
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset("assets/images/logo.png", height: 70),

                    const SizedBox(height: 8),

                    // Title
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange[800],
                          ),
                    ),

                    const SizedBox(height: 24),

                    // Username field
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(
                          Icons.person,
                          color: _usernameController.text.isNotEmpty
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Password field
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _passwordController.text.isNotEmpty
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepOrange.withOpacity(
                                0.5,
                              ), // สีเงา
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4), // เงาออกด้านล่าง
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
