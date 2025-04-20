extension StringExt on String {
  String fitText({int length = 0}) {
    if (length <= 0 || this.length < length) return this;
    return '${substring(0, length)}...';
  }
}
