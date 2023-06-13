class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'assets/onboard1.png',
      title: 'Manage your vehicles',
      description: 'Create separate account for each'),
  OnboardingContent(
      image: 'assets/onboard1.png',
      title: 'Change oil in time',
      description: 'Keep engine work effectively '),
  OnboardingContent(
      image: 'assets/onboard1.png',
      title: 'Expand lifespan',
      description: 'Your vehicle always in good condition'),
];
