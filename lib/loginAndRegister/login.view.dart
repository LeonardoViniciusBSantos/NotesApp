import 'package:flutter/material.dart';
import 'widgets/loginButton.widget.dart';
import 'widgets/squireTile.dart';
import 'widgets/textDivider.widget.dart';
import 'widgets/textField.widget.dart';

class LoginView extends StatefulWidget {
  final Function()? onTap;
  const LoginView({super.key, required this.onTap});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void signUserIn() async {
  //   // mostrando circulo de carregamento
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );

  //   void invalidEmailMessage() {
  //     showDialog(context: context, builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.black,
  //         title: Text(
  //           'Email inválido',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       );
  //     },);
  //   }

  //   void invalidCredentialMessage() {
  //     showDialog(context: context, builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.black,
  //         title: Text(
  //           'Email ou senha incorreta',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       );
  //   },);
  //   }

  //   void missingPasswordMessage() {
  //     showDialog(context: context, builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.black,
  //         title: Text(
  //           'Senha inválida',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       );
  //     },);
  //   }

  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {

  //     Navigator.pop(context); // Fecha o diálogo de progresso

  //     if (e.code == 'invalid-email') {
  //       invalidEmailMessage();
  //     } else if (e.code == 'invalid-credential') {
  //       invalidCredentialMessage();
  //     } else if (e.code == 'missing-password'){
  //       missingPasswordMessage();
  //     } else {
  //       print("Erro desconhecido: ${e.code}");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.all_inclusive,
                  size: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                const Text(
                  "Faça login para continuar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextInputField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                LoginButton(
                  onTap: () {},
                  text: "entrar",
                ),
                SizedBox(
                  height: 50,
                ),
                TextDivider(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquiteTile(
                      onTap: () => (), //AuthService().signInWithGoogle(),
                      imagePath: 'assets/icons/google.png',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SquiteTile(
                      onTap: () {},
                      imagePath: 'assets/icons/apple.png',
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem cadastro?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Cadastre-se agora",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
