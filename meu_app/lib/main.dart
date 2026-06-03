import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 145, 93, 150)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aula do Prof. Jorge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. O Controlador: Ele serve para "capturar" e manipular o texto do TextField
  final TextEditingController _textoController = TextEditingController();
  
  // Variável para armazenar o nome que o aluno vai digitar
  String _nomeExibido = '';

  // 2. Boa prática: Sempre fechar o controller para evitar vazamento de memória (dispose coletor de lixo)
  @override
  void dispose() {
    _textoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // CORREÇÃO 1: Para Formulários (Teclado)
body: SingleChildScrollView(
  child: Column(
    children: [ /* Seus TextFields aqui */ ],
  ),
)
// CORREÇÃO 2: Para Listas Dinâmicas
body: ListView(
  children: [
    Card(child: Text('Aluno 1')),
    Card(child: Text('Aluno 2')),
    Card(child: Text('Aluno 3')),
  ],
)

      body:
       Center(
        // Padding adicionado para o TextField não ficar colado nas bordas da tela
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Este código quebra se a tela for pequena ou se o teclado subir!


          child: 
          // Este código causa um Overflow Horizontal na lateral direita!

Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              // Widget de Texto Informativo
              const Text(
                'Bem-vindos à EEEP Miguel Gurgel',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              
              const SizedBox(height: 15),

              // Widget de Ícone
              const Icon(
                Icons.school,       
                size: 60.0,         
                color: Colors.amber, 
              ),

              const SizedBox(height: 15),

              // Widget de Imagem
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4oi8aopMHHKougzmDPI42HmLu_CQNLDJZRA&s', 
                height: 100.0,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              // ==========================================
              // 3. NOVO WIDGET: TEXTFIELD (Campo de Entrada)
              // ==========================================
              TextField(
                controller: _textoController, // Vincula o campo ao controlador
                decoration: const InputDecoration(
                  labelText: 'Digite o nome do aluno',
                  border: OutlineInputBorder(), // Cria uma borda em volta do campo
                  prefixIcon: Icon(Icons.person), // Adiciona um ícone dentro do campo
                ),
              ),

              const SizedBox(height: 20),

              // Texto reativo que muda quando clicamos no botão
              Text(
                _nomeExibido.isEmpty ? '' : 'Aluno matriculado: $_nomeExibido',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green),
              ),
            ],
          ),
        ),
      ),

      // ==========================================
      // 4. FLOATING ACTION BUTTON (Customizado)
      // ==========================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // O "pulo do gato": usamos o setState para atualizar a tela com o texto do controlador
          setState(() {
            _nomeExibido = _textoController.text;
          });
          
          // Limpa o campo de texto após clicar
          _textoController.clear();
        },
        tooltip: 'Enviar Nome',
        child: const Icon(Icons.check), // Mudamos o ícone para um "check" de confirmação
      ),
    );
  }
  
}