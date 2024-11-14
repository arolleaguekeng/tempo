import 'dart:ui';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll/infinite_scroll.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tempo/utils/constants.dart';
import 'package:tempo/utils/image_path.dart';
import 'dart:math';

import 'home/model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _pageSize = 10;
  final List<Post> _posts = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _lastPlayedIndex = -1;

  @override
  void initState() {
    super.initState();
    _fetchPage();
    _scrollController.addListener(_onScroll);

    // Jouer la musique pour le premier élément visible
    if (_posts.isNotEmpty) {
      _playAudioForPost(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _fetchPage() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final newItems = generateRandomPosts(_pageSize);
      setState(() {
        _posts.addAll(newItems);
      });

      // Si c'est le premier chargement, jouer la musique du premier post visible
      if (_posts.isNotEmpty && _lastPlayedIndex == -1) {
        _playAudioForPost(0);
      }
    } catch (error) {
      // Gérer l'erreur si nécessaire
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !_isLoading) {
      _fetchPage();
    }

    int index = (_scrollController.offset / MediaQuery.of(context).size.height).floor();
    if (index != _lastPlayedIndex && index < _posts.length) {
      _playAudioForPost(index);
      _lastPlayedIndex = index;
    }
  }

  Future<void> _playAudioForPost(int index) async {
    final post = _posts[index];

    // Arrêter toute lecture en cours avant de commencer une nouvelle lecture
    await _audioPlayer.stop();

    // Charger et jouer la musique
    await _audioPlayer.setAsset("assets/images/test.mp3");
    _audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _posts.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _posts.length) {
            return Center(child: CircularProgressIndicator());
          }

          final post = _posts[index];
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Image.asset(post.backgroundImage, fit: BoxFit.cover),
                  ),
                ),
                AvatarGlow(
                  startDelay: const Duration(milliseconds: 1000),
                  glowColor: primaryColor ?? Colors.blue,
                  glowShape: BoxShape.rectangle,
                  curve: Curves.fastOutSlowIn,
                  glowRadiusFactor: 0.1,
                  child: Container(
                    height: 360,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: darkprimaryColor ?? Colors.black, width: 1),
                      image: DecorationImage(
                        image: AssetImage(post.backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.artist,
                        style: TextStyle(color: white ?? Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: post.description,
                              style: TextStyle(color: white ?? Colors.white, fontSize: 16),
                            ),
                            ...post.hashtags.map((hashtag) => TextSpan(
                              text: hashtag,
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      ),
                      Text(
                        "#roadmarking",
                        style: TextStyle(color: white ?? Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AvatarGlow(
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: primaryColor ?? Colors.blue,
                        glowShape: BoxShape.circle,
                        curve: Curves.fastOutSlowIn,
                        glowRadiusFactor: 0.1,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: white ?? Colors.white, width: 1.5),
                            image: DecorationImage(
                              image: AssetImage(post.avatarImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                bottom: -10,
                                left: 14,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: primaryColor ?? Colors.blue,
                                  ),
                                  child: Center(child: Icon(Icons.add, color: white ?? Colors.white, size: 20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite, color: white ?? Colors.white, size: 34),
                          ),
                          Text("${post.likes}", style: TextStyle(color: white ?? Colors.white)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Column(
                        children: [
                          Image.asset(messageicon ?? '', width: 42, height: 42),
                          Text("${post.comments} ", style: TextStyle(color: white ?? Colors.white)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Column(
                        children: [
                          Image.asset(share ?? '', width: 42, height: 42),
                          Text("share", style: TextStyle(color: white ?? Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

