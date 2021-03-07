import 'dart:convert';

Questionnaire questionnaireFromMap(String str) =>
    Questionnaire.fromMap(json.decode(str));

String questionnaireToMap(Questionnaire data) => json.encode(data.toMap());

class Questionnaire {
  Questionnaire({
    this.surveyComplete,
    this.firstname,
    this.surname,
    this.email,
    this.gender,
    this.ageRange,
    this.sexualOrientation,
    this.ethnicity,
    this.university,
    this.occupation,
    this.city,
    this.politicalStance,
    this.religiousBelief,
    this.meetPreference,
    this.venuePreference,
    this.compatibilityA,
    this.compatibilityB,
    this.compatibilityC,
    this.compatibilityD,
    this.compatibilityE,
    this.compatibilityF,
    this.compatibilityG,
    this.compatibilityH,
    this.compatibilityI,
    this.compatibilityJ,
    this.compatibilityK,
    this.compatibilityL,
    this.compatibilityM,
    this.compatibilityN,
    this.compatibilityO,
    this.compatibilityP,
    this.compatibilityQ,
    this.compatibilityR,
    this.compatibilityS,
    this.compatibilityT,
    this.compatibilityU,
    this.interests,
    this.activities,
    this.activities2,
    this.conversationTopics,
    this.musicGenres,
    this.preferredQualities,
    this.selfQualities,
  });

  bool surveyComplete;
  String firstname;
  String surname;
  String email;
  String gender;
  String ageRange;
  String sexualOrientation;
  String ethnicity;
  String university;
  String occupation;
  String city;
  String politicalStance;
  String religiousBelief;
  String meetPreference;
  List<String> venuePreference;
  int compatibilityA;
  int compatibilityB;
  int compatibilityC;
  int compatibilityD;
  int compatibilityE;
  int compatibilityF;
  int compatibilityG;
  int compatibilityH;
  int compatibilityI;
  int compatibilityJ;
  int compatibilityK;
  int compatibilityL;
  int compatibilityM;
  int compatibilityN;
  int compatibilityO;
  int compatibilityP;
  int compatibilityQ;
  int compatibilityR;
  int compatibilityS;
  int compatibilityT;
  int compatibilityU;
  List<String> interests;
  List<String> activities;
  List<String> activities2;
  List<String> conversationTopics;
  List<String> musicGenres;
  List<String> preferredQualities;
  List<String> selfQualities;

  // factory Questionnaire.fromMap(Map<String, dynamic> json) => Questionnaire(
  //       surveyComplete: json["surveyComplete"] ?? false,
  //       firstname: json["firstname"] ?? '',
  //       surname: json["surname"] ?? '',
  //       email: json["email"] ?? '',
  //       gender: json["gender"] ?? '',
  //       ageRange: json["ageRange"] ?? '',
  //       sexualOrientation: json["sexualOrientation"] ?? '',
  //       ethnicity: json["ethnicity"] ?? '',
  //       university: json["university"] ?? '',
  //       occupation: json["occupation"] ?? '',
  //       city: json["city"] ?? '',
  //       politicalStance: json["politicalStance"] ?? '',
  //       religiousBelief: json["religiousBelief"] ?? '',
  //       meetPreference:
  //           List<String>.from(json["meetPreference"].map((x) => x)) ?? [],
  //       venuePreference:
  //           List<String>.from(json["venuePreference"].map((x) => x)) ?? [],
  //       compatibilityA: json["compatibility_a"] ?? 0,
  //       compatibilityB: json["compatibility_b"] ?? 0,
  //       compatibilityC: json["compatibility_c"] ?? 0,
  //       compatibilityD: json["compatibility_d"] ?? 0,
  //       compatibilityE: json["compatibility_e"] ?? 0,
  //       compatibilityF: json["compatibility_f"] ?? 0,
  //       compatibilityG: json["compatibility_g"] ?? 0,
  //       compatibilityH: json["compatibility_h"] ?? 0,
  //       compatibilityI: json["compatibility_i"] ?? 0,
  //       compatibilityJ: json["compatibility_j"] ?? 0,
  //       compatibilityK: json["compatibility_k"] ?? 0,
  //       compatibilityL: json["compatibility_l"] ?? 0,
  //       compatibilityM: json["compatibility_m"] ?? 0,
  //       compatibilityN: json["compatibility_n"] ?? 0,
  //       compatibilityO: json["compatibility_o"] ?? 0,
  //       compatibilityP: json["compatibility_p"] ?? 0,
  //       compatibilityQ: json["compatibility_q"] ?? 0,
  //       compatibilityR: json["compatibility_r"] ?? 0,
  //       compatibilityS: json["compatibility_s"] ?? 0,
  //       compatibilityT: json["compatibility_t"] ?? 0,
  //       compatibilityU: json["compatibility_u"] ?? 0,
  //       interests: List<String>.from(json["interests"].map((x) => x)) ?? [],
  //       activities: List<String>.from(json["activities"].map((x) => x)) ?? [],
  //       activities2: List<String>.from(json["activities2"].map((x) => x)) ?? [],
  //       conversationTopics:
  //           List<String>.from(json["conversationTopics"].map((x) => x)) ?? [],
  //       musicGenres: List<String>.from(json["musicGenres"].map((x) => x)) ?? [],
  //       preferredQualities:
  //           List<String>.from(json["preferredQualities"].map((x) => x)) ?? [],
  //       selfQualities: List<String>.from(json["selfQualities"].map((x) => x)) ?? [],
  //     );

    factory Questionnaire.fromMap(Map<String, dynamic> json) => Questionnaire(
        surveyComplete: json["surveyComplete"] == null ? null : json["surveyComplete"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        surname: json["surname"] == null ? null : json["surname"],
        email: json["email"] == null ? null : json["email"],
        gender: json["gender"] == null ? null : json["gender"],
        ageRange: json["ageRange"] == null ? null : json["ageRange"],
        sexualOrientation: json["sexualOrientation"] == null ? null : json["sexualOrientation"],
        ethnicity: json["ethnicity"] == null ? null : json["ethnicity"],
        university: json["university"] == null ? null : json["university"],
        occupation: json["occupation"] == null ? null : json["occupation"],
        city: json["city"] == null ? null : json["city"],
        politicalStance: json["politicalStance"] == null ? null : json["politicalStance"],
        religiousBelief: json["religiousBelief"] == null ? null : json["religiousBelief"],
        meetPreference: json["meetPreference"] == null ? null : json["meetPreference"],
        venuePreference: json["venuePreference"] == null ? null : List<String>.from(json["venuePreference"].map((x) => x)),
        compatibilityA: json["compatibility_a"] == null ? null : json["compatibility_a"],
        compatibilityB: json["compatibility_b"] == null ? null : json["compatibility_b"],
        compatibilityC: json["compatibility_c"] == null ? null : json["compatibility_c"],
        compatibilityD: json["compatibility_d"] == null ? null : json["compatibility_d"],
        compatibilityE: json["compatibility_e"] == null ? null : json["compatibility_e"],
        compatibilityF: json["compatibility_f"] == null ? null : json["compatibility_f"],
        compatibilityG: json["compatibility_g"] == null ? null : json["compatibility_g"],
        compatibilityH: json["compatibility_h"] == null ? null : json["compatibility_h"],
        compatibilityI: json["compatibility_i"] == null ? null : json["compatibility_i"],
        compatibilityJ: json["compatibility_j"] == null ? null : json["compatibility_j"],
        compatibilityK: json["compatibility_k"] == null ? null : json["compatibility_k"],
        compatibilityL: json["compatibility_l"] == null ? null : json["compatibility_l"],
        compatibilityM: json["compatibility_m"] == null ? null : json["compatibility_m"],
        compatibilityN: json["compatibility_n"] == null ? null : json["compatibility_n"],
        compatibilityO: json["compatibility_o"] == null ? null : json["compatibility_o"],
        compatibilityP: json["compatibility_p"] == null ? null : json["compatibility_p"],
        compatibilityQ: json["compatibility_q"] == null ? null : json["compatibility_q"],
        compatibilityR: json["compatibility_r"] == null ? null : json["compatibility_r"],
        compatibilityS: json["compatibility_s"] == null ? null : json["compatibility_s"],
        compatibilityT: json["compatibility_t"] == null ? null : json["compatibility_t"],
        compatibilityU: json["compatibility_u"] == null ? null : json["compatibility_u"],
        interests: json["interests"] == null ? null : List<String>.from(json["interests"].map((x) => x)),
        activities: json["activities"] == null ? null : List<String>.from(json["activities"].map((x) => x)),
        activities2: json["activities2"] == null ? null : List<String>.from(json["activities2"].map((x) => x)),
        conversationTopics: json["conversationTopics"] == null ? null : List<String>.from(json["conversationTopics"].map((x) => x)),
        musicGenres: json["musicGenres"] == null ? null : List<String>.from(json["musicGenres"].map((x) => x)),
        preferredQualities: json["preferredQualities"] == null ? null : List<String>.from(json["preferredQualities"].map((x) => x)),
        selfQualities: json["selfQualities"] == null ? null : List<String>.from(json["selfQualities"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "surveyComplete": surveyComplete == null ? null : surveyComplete,
        "firstname": firstname == null ? null : firstname,
        "surname": surname == null ? null : surname,
        "email": email == null ? null : email,
        "gender": gender == null ? null : gender,
        "ageRange": ageRange == null ? null : ageRange,
        "sexualOrientation": sexualOrientation == null ? null : sexualOrientation,
        "ethnicity": ethnicity == null ? null : ethnicity,
        "university": university == null ? null : university,
        "occupation": occupation == null ? null : occupation,
        "city": city == null ? null : city,
        "politicalStance": politicalStance == null ? null : politicalStance,
        "religiousBelief": religiousBelief == null ? null : religiousBelief,
        "meetPreference": meetPreference == null ? null : meetPreference,
        "venuePreference": venuePreference == null ? null : List<String>.from(venuePreference.map((x) => x)),
        "compatibility_a": compatibilityA == null ? null : compatibilityA,
        "compatibility_b": compatibilityB == null ? null : compatibilityB,
        "compatibility_c": compatibilityC == null ? null : compatibilityC,
        "compatibility_d": compatibilityD == null ? null : compatibilityD,
        "compatibility_e": compatibilityE == null ? null : compatibilityE,
        "compatibility_f": compatibilityF == null ? null : compatibilityF,
        "compatibility_g": compatibilityG == null ? null : compatibilityG,
        "compatibility_h": compatibilityH == null ? null : compatibilityH,
        "compatibility_i": compatibilityI == null ? null : compatibilityI,
        "compatibility_j": compatibilityJ == null ? null : compatibilityJ,
        "compatibility_k": compatibilityK == null ? null : compatibilityK,
        "compatibility_l": compatibilityL == null ? null : compatibilityL,
        "compatibility_m": compatibilityM == null ? null : compatibilityM,
        "compatibility_n": compatibilityN == null ? null : compatibilityN,
        "compatibility_o": compatibilityO == null ? null : compatibilityO,
        "compatibility_p": compatibilityP == null ? null : compatibilityP,
        "compatibility_q": compatibilityQ == null ? null : compatibilityQ,
        "compatibility_r": compatibilityR == null ? null : compatibilityR,
        "compatibility_s": compatibilityS == null ? null : compatibilityS,
        "compatibility_t": compatibilityT == null ? null : compatibilityT,
        "compatibility_u": compatibilityU == null ? null : compatibilityU,
        "interests": interests == null ? null : List<String>.from(interests.map((x) => x)),
        "activities": activities == null ? null : List<String>.from(activities.map((x) => x)),
        "activities2": activities2 == null ? null : List<String>.from(activities2.map((x) => x)),
        "conversationTopics": conversationTopics == null ? null : List<String>.from(conversationTopics.map((x) => x)),
        "musicGenres": musicGenres == null ? null : List<String>.from(musicGenres.map((x) => x)),
        "preferredQualities": preferredQualities == null ? null : List<String>.from(preferredQualities.map((x) => x)),
        "selfQualities": selfQualities == null ? null : List<String>.from(selfQualities.map((x) => x)),
    };

  set setFirstname(String value) {
    this.firstname = value;
  }

  set setSurname(String value) {
    surname = value;
  }

  set setEmail(String value) {
    email = value;
  }

  set setGender(String value) {
    gender = value;
  }

  set setAgeRange(String value) {
    ageRange = value;
  }

  set setSexualOrientation(String value) {
    sexualOrientation = value;
  }

  set setEthnicity(String value) {
    ethnicity = value;
  }

  set setUniversity(String value) {
    university = value;
  }

  set setOccupation(String value) {
    occupation = value;
  }

  set setCity(String value) {
    city = value;
  }

  set setPoliticalStance(String value) {
    politicalStance = value;
  }

  set setReligiousBelief(String value) {
    religiousBelief = value;
  }

  set setMeetPreference(String value) {
    meetPreference = value;
  }

  set setVenuePreference(List<String> value) {
    venuePreference = value;
  }

  set setCompatibilityA(int value) {
    compatibilityA = value;
  }

  set setCompatibilityB(int value) {
    compatibilityB = value;
  }

  set setCompatibilityC(int value) {
    compatibilityC = value;
  }

  set setCompatibilityD(int value) {
    compatibilityD = value;
  }

  set setCompatibilityE(int value) {
    compatibilityE = value;
  }

  set setCompatibilityF(int value) {
    compatibilityF = value;
  }

  set setCompatibilityG(int value) {
    compatibilityG = value;
  }

  set setCompatibilityH(int value) {
    compatibilityH = value;
  }

  set setCompatibilityI(int value) {
    compatibilityI = value;
  }

  set setCompatibilityJ(int value) {
    compatibilityJ = value;
  }

  set setCompatibilityK(int value) {
    compatibilityK = value;
  }

  set setCompatibilityL(int value) {
    compatibilityL = value;
  }

  set setCompatibilityM(int value) {
    compatibilityM = value;
  }

  set setCompatibilityN(int value) {
    compatibilityN = value;
  }

  set setCompatibilityO(int value) {
    compatibilityO = value;
  }

  set setCompatibilityP(int value) {
    compatibilityP = value;
  }

  set setCompatibilityQ(int value) {
    compatibilityQ = value;
  }

  set setCompatibilityR(int value) {
    compatibilityS = value;
  }

  set setCompatibilityT(int value) {
    compatibilityT = value;
  }

  set setCompatibilityU(int value) {
    compatibilityU = value;
  }

  set setInterests(List<String> value) {
    interests = value;
  }

  set setActivities(List<String> value) {
    activities = value;
  }

  set setActivities2(List<String> value) {
    activities2 = value;
  }

  set setConversationTopics(List<String> value) {
    conversationTopics = value;
  }

  set setMusicGenres(List<String> value) {
    musicGenres = value;
  }

  set setPreferredQualities(List<String> value) {
    preferredQualities = value;
  }

  set setSelfQualities(List<String> value) {
    selfQualities = value;
  }
}
