class Utils {
  static String getUsername(String email) {
    return "${email.split('@')[0]}";
  }

  static String getInitials(String name) {
    List<String> splitName = name.split(" ");
    String firstNameInitial = splitName[0][0];
    String lastNameInitial = splitName[1][0];
    return firstNameInitial + lastNameInitial;
  }
}
