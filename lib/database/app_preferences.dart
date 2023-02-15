import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia/models/user_answer_history_model.dart';

class AppPreferences {
  //------------------------------------------------------------- Preference Constants ------------------------------------------------------------
  // Constants for Preference-Value's data-type
  static const String prefTypeBool = "BOOL";
  static const String prefTypeInteger = "INTEGER";
  static const String prefTypeDouble = "DOUBLE";
  static const String prefTypeString = "STRING";

  late Future _isPreferenceInstanceReady;
  late SharedPreferences _preferences;


  static const String prefUserHistory = "USER_HISTORY";
  static const String prefUserScore = "USER_SCORE";

  //-------------------------------------------------------------------- Singleton ----------------------------------------------------------------------
  // Final static instance of class initialized by private constructor
  static final AppPreferences _instance = AppPreferences._internal();

  // Factory Constructor
  factory AppPreferences() => _instance;

  /// AppPreference Private Internal Constructor -> AppPreference
  /// @param->_
  /// @usage-> Initialize SharedPreference object and notify when operation is complete to future variable.
  AppPreferences._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance().then((preferences) => _preferences = preferences);
  }

  AppPreferences getAppPreferences() {
    return AppPreferences();
  }

  //------------------------------------------------------- Getter Methods -----------------------------------------------------------

  // GETTER for isPreferenceReady future
  Future get isPreferenceReady => _isPreferenceInstanceReady;

//}

  void setUserHistory({required String userHistoryList}) => _setPreference(prefName: prefUserHistory, prefValue: userHistoryList, prefType: prefTypeString);

  Future<String> getUserHistory() async => await _getPreference(prefName: prefUserHistory);

  void setRecentScore({required String score}) => _setPreference(prefName: prefUserScore, prefValue: score, prefType: prefTypeString);

  Future<String> getRecentScore() async => await _getPreference(prefName: prefUserScore);



  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------
  /// @usage -> This is a generalized method to set preferences with required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  void _setPreference({required String prefName, required dynamic prefValue, required String prefType}) {
    // Make switch for Preference Type i.e. Preference-Value's data-type
    switch (prefType) {
      case prefTypeBool:
        {
          _preferences.setBool(prefName, prefValue);
          break;
        }
      case prefTypeInteger:
        {
          _preferences.setInt(prefName, prefValue);
          break;
        }
      case prefTypeDouble:
        {
          _preferences.setDouble(prefName, prefValue);
          break;
        }
      case prefTypeString:
        {
          _preferences.setString(prefName, prefValue);
          break;
        }
    }
  }

  Future<dynamic> _getPreference({required prefName}) async => _preferences.get(prefName);

  Future<bool> clearPreference() => _preferences.clear();
}
