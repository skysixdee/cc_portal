class StoreManager {
  static final StoreManager _instance = StoreManager._internal();

  StoreManager._internal() {
    initStoreManager();
    print("initiali stro manager");
  }
  factory StoreManager() {
    return _instance;
  }

  initStoreManager() async {}
  String msisdn = '92000003';
  String languageCode = 'en';
}
