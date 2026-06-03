import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula de Overflows',
      theme: ThemeData(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratório de Erros: Overflow'),
        backgroundColor: Colors.red.shade200,
      ),
      // Usamos uma Column principal externa apenas para dividir a tela em duas seções
      body: Column(
        children: [
          // ===================================================================
          // SEÇÃO 1: ERROS VERTICAIS (COLUMN OVERFLOW)
          // ===================================================================
          Expanded(
            child: Container(
              color: Colors.amber.shade50,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '⚠️ ERROS NA COLUMN (VERTICAL)',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(height: 10),

                  // SITUAÇÃO 1: Excesso de caixas fixas empilhadas (Conteúdo Rígido)
                  Container(width: 100, height: 80, color: Colors.blue),
                  const SizedBox(height: 10),
                  Container(width: 100, height: 80, color: Colors.green),
                  const SizedBox(height: 10),
                  Container(width: 100, height: 80, color: Colors.orange),
                  const SizedBox(height: 10),

                  // SITUAÇÃO 2: Elemento exageradamente alto que força o estouro
                  // (Simula uma imagem gigante que veio da internet sem tratamento)
                  Container(
                    height: 200, // <--- Altura muito grande para o espaço que sobrou
                    width: 150,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'Widget Alto Gigante',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 10, thickness: 5, color: Colors.black),

          // ===================================================================
          // SEÇÃO 2: ERROS HORIZONTAIS (ROW OVERFLOW)
          // ===================================================================
          Expanded(
            child: Container(
              color: Colors.blue.shade50,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '⚠️ ERROS NA ROW (HORIZONTAL)',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(height: 20),

                  // SITUAÇÃO 3: Texto Longo que não quebra a linha sozinho dentro da Row
                  Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'SITUAÇÃO 3: Este texto é absurdamente longo e vai passar direto da borda lateral da tela do celular!',
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // SITUAÇÃO 4: Soma de larguras fixas rígidas maior que a largura do dispositivo
                  Row(
                    children: [
                      Container(width: 130, height: 50, color: Colors.red, child: const Center(child: Text('Caixa 1'))),
                      const SizedBox(width: 10),
                      Container(width: 130, height: 50, color: Colors.teal, child: const Center(child: Text('Caixa 2'))),
                      const SizedBox(width: 10),
                      Container(width: 130, height: 50, color: Colors.indigo, child: const Center(child: Text('Caixa 3'))),
                      Container(width: 130, height: 50, color: Colors.yellow, child: const Center(child: Text('Caixa 4'))),
                      Container(width: 130, height: 50, color: Colors.pink, child: const Center(child: Text('Caixa 5'))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}