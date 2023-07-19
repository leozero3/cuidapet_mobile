import 'package:cuidapet_mobile/app/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferences = await _instance;
    sharedPreferences.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
    
  }

  @override
  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.get(key) as V?;
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.remove(key);
  }

  @override
  Future<void> write<V>(String key, V value) {
    final sharedPreferences = await _instance;

    if (V == String) {
      
    }
  }
}
