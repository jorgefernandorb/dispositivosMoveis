import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // O Controlador (Gerente da Memória RAM)[cite: 1]
  final TextEditingController _controller = TextEditingController();
  
  String _memoriaSet = ''; // Variável onde o SET armazena o dado
  String _telaGet = '';    // Variável que o GET exibe na tela

  @override
  void dispose() {
    _controller.dispose(); // Ciclo de vida: evita Memory Leak[cite: 1]
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EEEP Miguel Gurgel'), backgroundColor: Colors.purple.shade100),
      
      // SingleChildScrollView + Center: Proteção contra erros de layout e teclado
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Widgets de Conteúdo Básicos
                const Icon(Icons.school, size: 50, color: Colors.amber),
                const SizedBox(height: 10),
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4oi8aopMHHKougzmDPI42HmLu_CQNLDJZRA&s', height: 80),
                const SizedBox(height: 20),

                // Widget de Interação: Campo de Entrada
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(labelText: 'Nome do Aluno', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),

                // Linha de Botões com Expanded para evitar Overflow Horizontal
                Row(
                  children: [
                    // 1. AÇÃO SET: Atribui/Guarda o texto do campo na memória
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _memoriaSet = _controller.text),
                        child: const Text('SET'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    
                    // 2. AÇÃO GET: Pega o que estava na memória e prepara para a tela
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _telaGet = _memoriaSet),
                        child: const Text('GET'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    
                    // 3. AÇÃO CLEAR: Limpa o campo e as variáveis[cite: 1]
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.clear(); // Limpa o TextField[cite: 1]
                          setState(() { _memoriaSet = ''; _telaGet = ''; });
                        },
                        child: const Text('CLEAR'),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30),
                const Divider(),

                // Exibição dos Resultados na Tela
                Text('Valor no SET (Memória): $_memoriaSet', style: const TextStyle(fontSize: 16, color: Colors.orange)),
                const SizedBox(height: 10),
                Text('Valor no GET (Recuperado): $_telaGet', style: const TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}