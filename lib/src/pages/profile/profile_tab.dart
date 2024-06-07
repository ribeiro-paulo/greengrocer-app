import 'package:flutter/material.dart';
import 'package:greemgrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greemgrocer/src/config/app_data.dart' as app_mock;

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Persil usuário",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            initialValue: app_mock.user.email,
            icon: Icons.email,
            label: 'Email',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: app_mock.user.name,
            icon: Icons.person,
            label: 'Nome',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: app_mock.user.phone,
            icon: Icons.phone,
            label: 'Celular',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: app_mock.user.cpf,
            icon: Icons.copy,
            label: 'CPF',
            isSecret: true,
            readOnly: true,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Atualizar senha"),
          )
        ],
      ),
    );
  }
}
