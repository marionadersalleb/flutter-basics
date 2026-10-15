class Story {
  final String userName;
  final String storyImage;
  final String userImage;

  const Story({
    required this.userName,
    required this.storyImage,
    required this.userImage,
  });
}

const List<Story> stories = [
  Story(
    userName: 'Ahmed Ali',
    storyImage: 'assets/images/story1.jpg',
    userImage: 'assets/images/user1.jpg',
  ),
  Story(
    userName: 'Sara Mohamed',
    storyImage: 'assets/images/story2.jpg',
    userImage: 'assets/images/user2.jpg',
  ),
  Story(
    userName: 'Omar Hassan',
    storyImage: 'assets/images/story3.jpg',
    userImage: 'assets/images/avatar.jpg',
  ),
  Story(
    userName: 'Mona Adel',
    storyImage: 'assets/images/story4.jpg',
    userImage: 'assets/images/user1.jpg',
  ),
  Story(
    userName: 'Youssef Nabil',
    storyImage: 'assets/images/story5.jpg',
    userImage: 'assets/images/user2.jpg',
  ),
];
