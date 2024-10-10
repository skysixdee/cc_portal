String channelMapping(String value) {
  if (value == '1') {
    return "IVR";
  } else if (value == "2") {
    return "SMS";
  } else {
    return "WEB";
  }
}
