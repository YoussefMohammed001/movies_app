class ApiConstants{
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODA2MmQ2ZjNmODhmMzA3OTI5MzhmYmMwNmEyM2U5ZSIsInN1YiI6IjY0ZDgwMGNlMDAxYmJkMDExZDkwODg3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4VjlEileFiefZKbcXDCAafF6gzPkFktdLSns_NrYqjo";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imgUrl(String path) => baseImageUrl+path;
}