import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula de Overflows - Resolvido',
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
        title: const Text('Laboratório: Overflow RESOLVIDO'),
        backgroundColor: Colors.green.shade200,
      ),
      body: Column(
        children: [
          // ===================================================================
          // SEÇÃO 1 RESOLVIDA: ROLAGEM VERTICAL (SINGLECHILDSCROLLVIEW)
          // ===================================================================
          Expanded(
            child: Container(
              color: Colors.green.shade50,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              // SOLUÇÃO: Envolvemos a Column com o SingleChildScrollView
              // Agora toda essa metade da tela ganhou uma barra de rolagem!
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '✅ SOLUÇÃO VERTICAL: ROLAGEM ATIVADA',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 10),

                    // Situação 1: As caixas continuam aqui...
                    Container(width: 100, height: 80, color: Colors.blue),
                    const SizedBox(height: 10),
                    Container(width: 100, height: 80, color: Colors.green),
                    const SizedBox(height: 10),
                    Container(width: 100, height: 80, color: Colors.orange),
                    const SizedBox(height: 10),

                    // Situação 2: O elemento alto agora pode ser visualizado deslizando o dedo
                    Container(
                      height: 200, 
                      width: 150,
                      color: Colors.purple,
                      child: const Center(
                        child: Text(
                          'Widget Alto Gigante\n(Role para ver)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Divider(height: 10, thickness: 5, color: Colors.black),

          // ===================================================================
          // SEÇÃO 2 RESOLVIDA: FLEXIBILIDADE HORIZONTAL (EXPANDED)
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
                    '✅ SOLUÇÃO HORIZONTAL: RESPONSIVIDADE',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(height: 20),

                  // SOLUÇÃO SITUAÇÃO 3: Envolvemos o Text com o widget Expanded.
                  // Isso força o texto a entender qual é o limite da tela e quebrar a linha!
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green, size: 30),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'SITUAÇÃO 3 CORRIGIDA: Com o widget Expanded, este texto gigantesco agora quebra as linhas perfeitamente para baixo!',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // SOLUÇÃO SITUAÇÃO 4: Envolvemos as caixas rígidas com Expanded.
                  // Em vez de somar 390 pixels fixos, elas vão dividir o espaço da tela igualmente (33% para cada).
                  
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 50, color: Colors.red, child: const Center(child: Text('Caixa 1'))),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(height: 50, color: Colors.teal, child: const Center(child: Text('Caixa 2'))),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(height: 50, color: Colors.indigo, child: const Center(child: Text('Caixa 3'))),                        
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(height: 50, color: Colors.yellow, child: const Center(child: Text('Caixa 4'))),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(height: 50, color: Colors.pink, child: const Center(child: Text('Caixa 5'))),
                      ),
                      
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