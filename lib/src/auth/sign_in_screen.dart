import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greemgrocer/src/auth/components/custom_text_field.dart';
import 'package:greemgrocer/src/auth/sign_up_screen.dart';
import 'package:greemgrocer/src/base/base_screen.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(style: TextStyle(fontSize: 40), children: [
                    const TextSpan(
                        text: "Green",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "grocer",
                        style:
                            TextStyle(color: CustomColor.customContrastColor))
                  ])),
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Careais'),
                          ]),
                    ),
                  )
                ],
              )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // email
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        child: const Text("Entrar"),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (c) {
                            return const BaseScreen();
                          }));
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                                color: CustomColor.customContrastColor),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("ou")),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: Colors.green)),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (c) {
                              return SignUpScreen();
                            }));
                          },
                          child: const Text("Criar conta")),
                    )

                    // senha
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
