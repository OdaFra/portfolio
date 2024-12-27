class ProjectUtils {
  final String image;
  final String title;
  final String? subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? gitHubLink;

  ProjectUtils(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.androidLink,
      this.iosLink,
      this.webLink,
      this.gitHubLink});
}

//Work Projects
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/imgs/projects/ueno.png',
    title: 'Ueno Bank',
    subtitle: 'Ueno Bank',
    androidLink:
        'https://play.google.com/store/apps/details?id=py.com.elcomercio.retailbanking&hl=es_419',
    iosLink: 'https://apps.apple.com/py/app/ueno/id1592509395',
  ),
  ProjectUtils(
    image: 'assets/imgs/projects/tm.png',
    title: 'Billetera Tigo Money',
    subtitle: 'Tigo Money',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.juvo.tigomoney&hl=es_419',
    iosLink:
        'https://apps.apple.com/sv/app/billetera-tigo-money-paraguay/id1589504689',
  ),
];

//Hobby Projects
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
      image: 'assets/imgs/projects/portfolio_web.png',
      title: 'Portfolio Web',
      subtitle: 'Flutter Web Portfolio',
      gitHubLink: 'https://github.com/OdaFra/portfolio'),
  ProjectUtils(
      image: 'assets/imgs/projects/portfolio_web.png',
      title: 'Portfolio Web',
      subtitle: 'Flutter Web Portfolio',
      gitHubLink: 'https://github.com/OdaFra/portfolio'),
];
