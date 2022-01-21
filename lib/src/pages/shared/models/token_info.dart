class TokenInfo{
  static String?  id;
  static int? loginTime;
  static int? expirationTime;
  static List<String> roles = [];


  static void fromJson(final Map<String, dynamic> json) {
    loginTime = json['iat'];
    id = json['nameid'];
    expirationTime = json['exp'];
    roles.clear();
    if (json['role'] is List) {
      roles = (json['role'] as List)
          .map((final element) => element.toString())
          .toList();
    } else {
      if (json['role'] != null) {
        roles.add(json['role']);
      }
    }
  }

}