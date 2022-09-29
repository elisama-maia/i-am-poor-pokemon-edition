import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IamPoorPage(),
    );
  }
}

class IamPoorPage extends StatefulWidget {
  const IamPoorPage({Key? key}) : super(key: key);

  @override
  State<IamPoorPage> createState() => _IamPoorPageState();
}

class _IamPoorPageState extends State<IamPoorPage> {
  final player = AudioPlayer();

  playSong() async {
    await player.setAsset('assets/audios/pokemon_theme_song.mp3');
    await player.setLoopMode(LoopMode.all);
    player.play();
  }

  @override
  void initState() {
    super.initState();
    playSong();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: const Text('I Am Poor Pokemon Edition'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pokeball.png'),
              const Text(
                'Gotcha! Another Poor Pokemon.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
