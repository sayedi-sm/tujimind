main() {
  const List series = [
    {
      "title": "The Moth",
      "publisher": "THE MOTH",
      "cover": "imgurl",
      "seriesurllists": [
        {
          "title": "book 1",
          "url":
              "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3"
        },
        {
          "title": "book 2",
          "url":
              "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
        },
        {
          "title": "book 3",
          "url":
              "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
        },
      ]
    }
  ];
  List<String?> allAudio = (series[0]["seriesurllists"] as List<Map<String, String>>).map((e) => e["url"]).toList();
  print(allAudio);
}
