import 'package:flutter/material.dart';

class SingleSong extends StatefulWidget {
  const SingleSong({super.key});

  @override
  State<SingleSong> createState() => _SingleSongState();
}

class _SingleSongState extends State<SingleSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(),
        title: const Text('Single Song'),
      ),
    );
  }
}
