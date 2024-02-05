class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    image: 'assets/illustrations/first_content.svg',
    title: 'Manage your tasks',
    description:
        'You can easily manage all of your daily\n tasks in DoMe for free',
  ),
  OnBoardingContent(
    image: 'assets/illustrations/second_content.svg',
    title: 'Create daily routine',
    description:
        'In Uptodo  you can create your\n personalized routine to stay productive',
  ),
  OnBoardingContent(
    image: 'assets/illustrations/third_content.svg',
    title: 'Organaize your tasks',
    description:
        'You can organize your daily tasks by\n adding your tasks into separate categories',
  ),
];
