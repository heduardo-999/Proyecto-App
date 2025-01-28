import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Esime Culhuacan App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFF5A0020), // Updated to a wine color
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF5A0020), // Updated to a wine color
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<String> images = [
    'https://via.placeholder.com/800x400.png?text=Evento+1',
    'https://via.placeholder.com/800x400.png?text=Evento+2',
    'https://via.placeholder.com/800x400.png?text=Evento+3',
    'https://via.placeholder.com/800x400.png?text=Evento+4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.school,
                color: Colors.white,
                size: 40,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              height: 200,
            ),
            items: images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              children: [
                _buildMenuItem(
                  context,
                  'Eventos',
                  Icons.event,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventosPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Chatbot',
                  Icons.chat,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatbotPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Calendario IPN',
                  Icons.calendar_today,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarioPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Horarios',
                  Icons.schedule,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HorariosPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Notificaciones',
                  Icons.notifications,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificacionesPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Materias',
                  Icons.book,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MateriasPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        margin: EdgeInsets.all(10),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class EventosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los eventos del IPN.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),

            title: Text('Editar Perfil', style: TextStyle(color: Colors.white)),

            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.white),
            title: Text('Calendario Semanal', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.badge, color: Colors.white),
            title: Text('Credencial Escolar', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Ajustes', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CalendarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario IPN'),
      ),
      body: Center(
        child: Text('Aquí se mostrará el calendario del IPN.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class HorariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horarios'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los horarios disponibles.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class NotificacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán las notificaciones importantes.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class MateriasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materias'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán las materias registradas.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}


class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _faq = [
    {'question': 'inscripciones', 'answer': 'Las inscripciones se realizan en el portal oficial del IPN.'},
    {'question': 'ubicación de salones', 'answer': 'Consulta el mapa del campus para encontrar la ubicación de los salones.'},
    {'question': 'horarios', 'answer': 'Los horarios están disponibles en tu perfil de usuario.'},
    {'question': 'materias', 'answer': 'Las materias pueden consultarse en la sección de tu perfil académico.'},
    {'question': 'eventos', 'answer': 'Revisa la sección de Eventos en la pantalla principal.'},
    {'question': 'guías de uso', 'answer': 'Para usar la app, selecciona una opción en el menú principal.'},
  ];

  final List<String> _messages = [
    'Chatbot: Hola, ¿en qué puedo ayudarte hoy? Selecciona una de las opciones a continuación o escribe tu consulta.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _messages[index],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Selecciona una opción o escribe tu consulta:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: _faq.map((entry) {
                    return ElevatedButton(
                      onPressed: () {
                        _handleOptionSelected(entry['question']!);
                      },
                      child: Text(entry['question']!),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Escribe tu mensaje',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _handleUserInput(_controller.text);
                      },
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleOptionSelected(String option) {
    setState(() {
      _messages.add('Usuario: $option');
      String response = _faq.firstWhere((entry) => entry['question'] == option)['answer']!;
      _messages.add('Chatbot: $response');
    });
  }

  void _handleUserInput(String input) {
    if (input.isEmpty) return;
    setState(() {
      _messages.add('Usuario: $input');
      _controller.clear();

      String response = _faq.firstWhere(
            (entry) => input.toLowerCase().contains(entry['question']!),
        orElse: () => {'answer': 'Lo siento, no entendí tu consulta. Por favor intenta nuevamente.'},
      )['answer']!;

      _messages.add('Chatbot: $response');
    });
  }
}
