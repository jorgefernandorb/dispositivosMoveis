import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotas Nomeadas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      // CENTRALIZAÇÃO DAS ROTAS: O mapa do nosso aplicativo
      initialRoute: '/login', // Define qual apelido abre primeiro
      routes: {
        '/login': (context) => const TelaLogin(),
        '/home':  (context) => const TelaHome(),
        '/perfil': (context) => const TelaPerfil(),
      },
    );
  }
}

// =============================================================================
// 1. TELA DE LOGIN
// =============================================================================
class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EEEP Miguel Gurgel'), backgroundColor: Colors.deepPurple.shade100),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 60, color: Colors.deepPurple),
              const SizedBox(height: 10),
              const Text('Tela de Acesso', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Entrar no Sistema'),
                onPressed: () {
                  // NAVEGAÇÃO NOMEADA: Avança usando apenas o apelido da rota
                  Navigator.pushNamed(context, '/home');
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
// 2. TELA HOME (PAINEL PRINCIPAL)
// =============================================================================
class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Painel Principal'), backgroundColor: Colors.green.shade100),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.home, size: 60, color: Colors.green),
              const SizedBox(height: 10),
              const Text('Bem-vindo ao Painel!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botão para avançar mais um prato na pilha
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/perfil'),
                    child: const Text('Ver Perfil'),
                  ),
                  const SizedBox(width: 12),
                  
                  // Botão para voltar (remover o topo da pilha)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade50),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Logout (Voltar)'),
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

// =============================================================================
// 3. TELA DE PERFIL DO USUÁRIO
// =============================================================================
class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil do Aluno'), backgroundColor: Colors.orange.shade100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 60, color: Colors.orange),
            const SizedBox(height: 10),
            const Text('Perfil: Jorge Fernando', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade50),
              onPressed: () => Navigator.pop(context), // Remove a tela de perfil e revela a Home
              child: const Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}