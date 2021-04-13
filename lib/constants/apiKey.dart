class Constants {
  static const String apiKey = "c7d47ef4719f48c9928a712c761d00d9";
  static const String topHeadLines =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";
  static String headlinesCountry(String countryCode) {
    return "https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=$apiKey";
  }

  static const Map<String, String> Countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn',
  };
}
