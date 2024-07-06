class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

//Work Projects
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/tm_ejemplo.png',
    title: 'TM - 1',
    subtitle: 'Tigo Money',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.juvo.tigomoney&pcampaignid=web_share',
  ),
  ProjectUtils(
    image: 'assets/projects/tm_ejemplo.png',
    title: 'TM - 2',
    subtitle: 'Tigo Money',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.juvo.tigomoney&pcampaignid=web_share',
  ),
];

//Hobby Projects
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/tm_ejemplo.png',
    title: 'TM - 3',
    subtitle: 'Tigo Money',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.juvo.tigomoney&pcampaignid=web_share',
  ),
  ProjectUtils(
    image: 'assets/projects/tm_ejemplo.png',
    title: 'TM - 4',
    subtitle: 'Tigo Money',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.juvo.tigomoney&pcampaignid=web_share',
  ),
];
