
class Video {
  var title, url, thumbnail ;

  Video(video) {
    title = video['title'] ?? "";
    url = video['url'] ?? "";
    thumbnail = "https://img.youtube.com/vi/" + url.split('/').last + "/0.jpg";
  }

}
