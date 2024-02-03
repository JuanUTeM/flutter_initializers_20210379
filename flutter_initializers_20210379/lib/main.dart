import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '20 WIDGETS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PÁGINA DE PRUEBA'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _animateAlign = false;
  late final AnimationController _builderController = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  bool _first = true;
  String _name = 'JUAN';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _animateAlign = !_animateAlign;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Has presionado el botón esta cantidad de veces:'),
            Text(
              '$_counter',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 24.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 30.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 36.0,
                ),
              ],
            ),
            AnimatedAlign(
              alignment: _animateAlign ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 50.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _builderController,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text(':)'),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _builderController.value * 2.0 * 3.1415926535897932,
                      child: child,
                    );
                  },
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Image(
                  image: NetworkImage(
                      'https://i.ibb.co/c1frf1p/Captura-de-pantalla-2024-01-22-012438.png'),
                  width: 100.0,
                  height: 100.0,
                ),
              ],
            ),
            AnimatedContainer(
              width: _animateAlign ? 200.0 : 100.0,
              height: _animateAlign ? 100.0 : 200.0,
              color: _animateAlign ? ui.Color.fromARGB(255, 20, 244, 31) : ui.Color.fromARGB(255, 231, 131, 0),
              alignment: _animateAlign ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _first = !_first;
                });
              },
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState:
                    _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTextStyle = !_selectedTextStyle;
                });
              },
              child: AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                style: _selectedTextStyle
                    ? Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.red, 
                      )
                    : Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.bold, 
                      ),
                child: const Text('Texto Animado'),
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'OLA ME LLAMO, $_name! ¿Y CÓMO TE ENCUENTRAS?',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Hola ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: '$_name',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green), // Cambio de color del nombre en RichText
                  ),
                  TextSpan(text: '! ¿Cómo estás?'),
                ],
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('¡Hola Mundo!'),
              ),
            ),
            const RotatedBox(
              quarterTurns: 3,
              child: Text('¡Hola Mundo!'),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 0.5,
                child: Image.network(
                  'https://example.com/userAvatar.jpg',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Opacity(
              opacity: _visible ? 1.0 : 0.0,
              child: const Text("Ahora me ves, ahora no me ves"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }

  bool _selectedTextStyle = true;
  bool _visible = true;
}
