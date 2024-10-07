String convertNCRsToReadableText(String ncrString) {
  // Regular expression to match the NCR format
  final RegExp regExp = RegExp(r'&#(\d+);');

  // Replace each NCR with its corresponding character
  return ncrString.replaceAllMapped(regExp, (match) {
    int ncrValue = int.parse(match.group(1)!);
    return String.fromCharCode(ncrValue);
  });
}
