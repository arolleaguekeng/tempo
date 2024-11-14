import 'dart:math';

import '../../../utils/image_path.dart';

List<Post> generateRandomPosts(int count) {
  List<String> hashtagsList = ["#fly", "#satisfying", "#roadmarking"];
  Random random = Random();
  return List.generate(count, (index) {
    return Post(
      artist: "@Coldplay",
      description: "The most satisfying job",
      hashtags: [hashtagsList[random.nextInt(hashtagsList.length)]],
      avatarImage: music2,
      backgroundImage: 'assets/images/music1.jpg',
      likes: random.nextInt(100000),
      comments: random.nextInt(1000),
      shares: random.nextInt(500),
    );
  });
}

class Post {
  final String artist;
  final String description;
  final List<String> hashtags;
  final String avatarImage;
  final String backgroundImage;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.artist,
    required this.description,
    required this.hashtags,
    required this.avatarImage,
    required this.backgroundImage,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
