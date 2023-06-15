class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'assets/images/onboard1.png',
      title: 'Manage your vehicles',
      description: 'Create separate account for each'),
  OnboardingContent(
      image: 'assets/images/onboard2.png',
      title: 'Change oil in time',
      description: 'Keep engine work effectively '),
  OnboardingContent(
      image: 'assets/images/onboard3.jpg',
      title: 'Expand lifespan',
      description: 'Your vehicle always in good condition'),
];
