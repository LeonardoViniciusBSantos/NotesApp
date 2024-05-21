import 'package:flutter/material.dart';
import 'widgets/loginButton.widget.dart';
import 'widgets/squireTile.dart';
import 'widgets/textDivider.widget.dart';
import 'widgets/textField.widget.dart';

class RegisterView extends StatefulWidget {
  final Function()? onTap;
  const RegisterView({super.key, required this.onTap});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // void signUserUp() async {
  //   // mostrando circulo de carregamento
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );

  //   void errorPasswordMessage() {
  //     showDialog(context: context, builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.black,
  //         title: Text(
  //           'Senhas não coincidem,',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       );
  //     },);
  //   }

  //   try {
  //     if(passwordController.text == confirmPasswordController.text){
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       );
  //     } else {
  //      errorPasswordMessage();
  //     }
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {

  //     Navigator.pop(context); // Fecha o diálogo de progresso

  //     if (e.code == 'invalid-email') {
  //     } else if (e.code == 'invalid-credential') {
  //     } else if (e.code == 'missing-password'){
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
                  height: 25,
                ),
                const Icon(
                  Icons.all_inclusive,
                  size: 50,
                ),
                SizedBox(
                  height: 25,
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
                TextInputField(
                  controller: confirmPasswordController,
                  hintText: 'Confirme sua senha',
                  obscureText: true,
                ),
                SizedBox(
                  height: 25,
                ),
                LoginButton(
                  onTap: () {},
                  text: "Cadastrar",
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
                      onTap: () => (),
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
                      "Já tem cadastro?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: const Text(
                          "Faça login aqui",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
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
