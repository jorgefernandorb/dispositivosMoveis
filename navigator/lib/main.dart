import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TelaLogin(), // A base da nossa pilha de navegação
  ));
  
}

// =============================================================================
// TELA 1: LOGIN (Base da Pilha)
// =============================================================================
class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline, size: 60, color: Colors.purple),
              const SizedBox(height: 20),
              const Text(
                'Bem-vindo ao Sistema!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              
              // Botão que dispara o avanço na pilha
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Entrar no Aplicativo'),
                onPressed: () {
                  // NAVIGATOR.PUSH: Empurra a TelaHome para o topo da pilha
                  Navigator.push(
                    context, // Passando o context para localizar o widget na árvore
                    MaterialPageRoute(builder: (context) => const TelaHome()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// TELA 2: HOME (Topo da Pilha)
// =============================================================================
class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel Principal (Home)'),
        backgroundColor: Colors.green.shade100,
        // DICA DIDÁTICA: O Flutter cria o botão de "voltar" na AppBar automaticamente
        // porque ele detecta que existe outra tela por baixo na pilha!
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, size: 60, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                'Login Efetuado com Sucesso!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              
              // Botão que dispara o retorno na pilha
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Fazer Logout (Voltar)'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
                
                onPressed: () {
                  // NAVIGATOR.POP: Remove esta tela do topo e a destrói
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}