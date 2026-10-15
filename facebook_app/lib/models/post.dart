class Post {
  final String userName;
  final String userImage;
  final String time;
  final String postImage;

  const Post({
    required this.userName,
    required this.userImage,
    required this.time,
    required this.postImage,
  });
}

const List<Post> posts = [
  Post(
    userName: 'Route',
    userImage: 'assets/images/user1.jpg',
    time: '8h',
    postImage: 'assets/images/post1.jpg',
  ),
  Post(
    userName: 'Sadie Adler',
    userImage: 'assets/images/user2.jpg',
    time: '8h',
    postImage: 'assets/images/post2.jpg',
  ),
  Post(
    userName: 'Ahmed Nabil',
    userImage: 'assets/images/avatar.jpg',
    time: '12h',
    postImage: 'assets/images/post3.jpg',
  ),
];
