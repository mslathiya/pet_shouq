extension Helper on String {
  bool hasValidUrl() {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);

    if (isEmpty) {
      return false;
    } else if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
