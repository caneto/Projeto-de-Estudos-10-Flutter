import 'package:animacoesvetoriaiscomflare/blocs/videos_bloc.dart';
import 'package:animacoesvetoriaiscomflare/ui/home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => VideosBloc())
      ],
      dependencies: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterTube',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

