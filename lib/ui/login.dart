// import 'package:ecoww/bloc/register/register_cubit.dart';
import 'package:ecoww/ui/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecoww/bloc/login/login_cubit.dart';
import 'package:ecoww/ui/menu/home_screen.dart';
import 'package:ecoww/ui/phone_auth_screen.dart';
import '../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameEdc = TextEditingController();
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  final confirmPassEdc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool passInvisible = false;
  bool passInvisibleConfirm = false;
  bool isLoginMode = true;

  // Function to toggle password visibility
  void togglePasswordVisibility(bool isVisible) {
    setState(() {
      passInvisible = isVisible;
    });
  }

  // Function to toggle password visibility
  void toggleRegisterPasswordVisibility(bool isVisibleConfirm) {
    setState(() {
      passInvisibleConfirm = isVisibleConfirm;
    });
    setState(() {
      passInvisible = isVisibleConfirm;
    });
  }

  bool confirmPassword(String passFirst, String passSecond) {
    return passFirst == passSecond;
  }

  void toggleMode() {
    setState(() {
      isLoginMode = !isLoginMode;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
            (route) => false,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterLoginCubit, RegisterLoginState>(
        listener: (context, state) {
          if (state is RegisterLoginLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Loading..')));
          }
          if (state is RegisterLoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is RegisterLoginSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(context, rBar, (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 70, 30, 30),
          child: ListView(
            children: [
              Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff497748),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Masukan nomor ponsel atau email kamu dan langsung gunakan fitur terlengkap kami! ",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoginMode = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isLoginMode
                                  ? Color(0xFF497748)
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            color: isLoginMode ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoginMode = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: !isLoginMode
                                  ? Color(0xFF497748)
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 16,
                            color: !isLoginMode ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              if (isLoginMode)
                LoginForm(
                  emailEdc: emailEdc,
                  passEdc: passEdc,
                  passInvisible: passInvisible,
                  togglePasswordVisibility: togglePasswordVisibility,
                ),
              if (!isLoginMode)
                RegisterForm(
                    nameEdc: nameEdc,
                    emailEdc: emailEdc,
                    passEdc: passEdc,
                    confirmPassEdc: confirmPassEdc,
                    confirmPassword: confirmPassword,
                    passInvisible: passInvisible,
                    toggleRegisterPasswordVisibility:
                        toggleRegisterPasswordVisibility),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Atau masuk dengan'),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://img2.pngdownload.id/20190228/qby/kisspng-google-logo-google-account-g-suite-google-images-g-icon-archives-search-png-5c77ad39b77471.9286340315513470017515.jpg',
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneAuthScreen()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://freepngimg.com/thumb/business/83615-blue-icons-symbol-telephone-computer-logo.png',
                      ),
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

class LoginForm extends StatelessWidget {
  final TextEditingController emailEdc;
  final TextEditingController passEdc;
  final bool passInvisible;
  final Function(bool)
      togglePasswordVisibility; // Function untuk toggle visibility

  const LoginForm({
    Key? key, // Memperbaiki constructor
    required this.emailEdc,
    required this.passEdc,
    required this.passInvisible,
    required this.togglePasswordVisibility, // Menambahkan toggle function
  }) : super(key: key); // Memperbaiki constructor

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Form key for validation

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailEdc,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                borderSide: BorderSide(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Warna border saat fokus
                  width: 1.0,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: passEdc,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  passInvisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  togglePasswordVisibility(
                      !passInvisible); // Calling toggle function
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                borderSide: BorderSide(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Warna border saat fokus
                  width: 1.0,
                ),
              ),
            ),
            obscureText: !passInvisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Lupa sandi'),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context
                    .read<RegisterLoginCubit>()
                    .login(email: emailEdc.text, password: passEdc.text);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3D4DE0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  final TextEditingController emailEdc;
  final TextEditingController passEdc;
  final TextEditingController confirmPassEdc;
  final TextEditingController nameEdc;
  final bool passInvisible;
  final Function(bool)
      toggleRegisterPasswordVisibility; // Function to toggle visibility
  final Function(String, String) confirmPassword;

  const RegisterForm({
    Key? key, // Fixing constructor
    required this.emailEdc,
    required this.passEdc,
    required this.confirmPassEdc,
    required this.passInvisible,
    required this.toggleRegisterPasswordVisibility, // Adding toggle function
    required this.nameEdc,
    required this.confirmPassword,
  }) : super(key: key); // Fixing constructor

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Form key for validation

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameEdc,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                borderSide: BorderSide(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Warna border saat fokus
                  width: 1.0,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: emailEdc,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                borderSide: BorderSide(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Warna border saat fokus
                  width: 1.0,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: passEdc,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  passInvisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  toggleRegisterPasswordVisibility(
                      !passInvisible); // Calling toggle function
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                borderSide: BorderSide(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Warna border saat fokus
                  width: 1.0,
                ),
              ),
            ),
            obscureText: !passInvisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          // TextFormField(
          //   controller: passEdc,
          //   decoration: InputDecoration(
          //     labelText: 'Password',
          //     suffixIcon: IconButton(
          //       icon: Icon(
          //         passInvisible ? Icons.visibility : Icons.visibility_off,
          //       ),
          //       onPressed: () {
          //         toggleRegisterPasswordVisibility(
          //             !passInvisible); // Calling toggle function
          //       },
          //     ),
          //   ),
          //   obscureText: !passInvisible,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter your password';
          //     }
          //     return null;
          //   },
          // ),
          SizedBox(height: 10),
          TextFormField(
            controller: confirmPassEdc,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: Icon(
                  passInvisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  toggleRegisterPasswordVisibility(
                      !passInvisible); // Calling toggle function
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                borderSide: BorderSide(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Warna border saat fokus
                  width: 1.0,
                ),
              ),
            ),
            obscureText: !passInvisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passEdc.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          // TextFormField(
          //   controller: confirmPassEdc,
          //   decoration: InputDecoration(
          //     labelText: 'Confirm Password',
          //     suffixIcon: IconButton(
          //       icon: Icon(
          //         passInvisible ? Icons.visibility : Icons.visibility_off,
          //       ),
          //       onPressed: () {
          //         toggleRegisterPasswordVisibility(
          //             !passInvisible); // Calling toggle function
          //       },
          //     ),
          //   ),
          //   obscureText: !passInvisible,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please confirm your password';
          //     }
          //     if (value != passEdc.text) {
          //       return 'Passwords do not match';
          //     }
          //     return null;
          //   },
          // ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (confirmPassword(passEdc.text, confirmPassEdc.text)) {
                  context.read<RegisterLoginCubit>().register(
                      email: emailEdc.text,
                      password: passEdc.text,
                      nama: nameEdc.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Passwords do not match'),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3D4DE0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
