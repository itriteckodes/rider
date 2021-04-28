class URL {
  static toGetString(data) {
    String url = '?';
    data.forEach((k, v) => url += k + '=' + v + '&');
    return url;
  }
}
