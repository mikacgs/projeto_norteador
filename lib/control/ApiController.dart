class ApiController {
  static final String API_URL = "http://10.0.2.2:3232/";

  static Uri getUri(String endpoint) {
    return Uri.parse("$API_URL/$endpoint");
  }
}
