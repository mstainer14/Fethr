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
        surveyComplete: json["surveyComplete"],
        firstname: json["firstname"],
        surname: json["surname"],
        email: json["email"],
        gender: json["gender"],
        ageRange: json["ageRange"],
        sexualOrientation: json["sexualOrientation"],
        ethnicity: json["ethnicity"],
        university: json["university"],
        occupation: json["occupation"],
        city: json["city"],
        politicalStance: json["politicalStance"],
        religiousBelief: json["religiousBelief"],
        meetPreference: json["meetPreference"],
        venuePreference:
            List<String>.from(json["venuePreference"].map((x) => x)),
        compatibilityA: json["compatibility_a"],
        compatibilityB: json["compatibility_b"],
        compatibilityC: json["compatibility_c"],
        compatibilityD: json["compatibility_d"],
        compatibilityE: json["compatibility_e"],
        compatibilityF: json["compatibility_f"],
        compatibilityG: json["compatibility_g"],
        compatibilityH: json["compatibility_h"],
        compatibilityI: json["compatibility_i"],
        compatibilityJ: json["compatibility_j"],
        compatibilityK: json["compatibility_k"],
        compatibilityL: json["compatibility_l"],
        compatibilityM: json["compatibility_m"],
        compatibilityN: json["compatibility_n"],
        compatibilityO: json["compatibility_o"],
        compatibilityP: json["compatibility_p"],
        compatibilityQ: json["compatibility_q"],
        compatibilityR: json["compatibility_r"],
        compatibilityS: json["compatibility_s"],
        compatibilityT: json["compatibility_t"],
        compatibilityU: json["compatibility_u"],
        interests: List<String>.from(json["interests"].map((x) => x)),
        activities: List<String>.from(json["activities"].map((x) => x)),
        activities2: List<String>.from(json["activities2"].map((x) => x)),
        conversationTopics:
            List<String>.from(json["conversationTopics"].map((x) => x)),
        musicGenres: List<String>.from(json["musicGenres"].map((x) => x)),
        preferredQualities:
            List<String>.from(json["preferredQualities"].map((x) => x)),
        selfQualities: List<String>.from(json["selfQualities"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "surveyComplete": surveyComplete ?? false,
        "firstname": firstname ?? '',
        "surname": surname ?? '',
        "email": email ?? '',
        "gender": gender ?? '',
        "ageRange": ageRange ?? '',
        "sexualOrientation": sexualOrientation ?? '',
        "ethnicity": ethnicity ?? '',
        "university": university ?? '',
        "occupation": occupation ?? '',
        "city": city ?? '',
        "politicalStance": politicalStance ?? '',
        "religiousBelief": religiousBelief ?? '',
        "meetPreference": meetPreference,
        "venuePreference":
            List<dynamic>.from(venuePreference.map((x) => x)) ?? [],
        "compatibility_a": compatibilityA ?? 0,
        "compatibility_b": compatibilityB ?? 0,
        "compatibility_c": compatibilityC ?? 0,
        "compatibility_d": compatibilityD ?? 0,
        "compatibility_e": compatibilityE ?? 0,
        "compatibility_f": compatibilityF ?? 0,
        "compatibility_g": compatibilityG ?? 0,
        "compatibility_h": compatibilityH ?? 0,
        "compatibility_i": compatibilityI ?? 0,
        "compatibility_j": compatibilityJ ?? 0,
        "compatibility_k": compatibilityK ?? 0,
        "compatibility_l": compatibilityL ?? 0,
        "compatibility_m": compatibilityM ?? 0,
        "compatibility_n": compatibilityN ?? 0,
        "compatibility_o": compatibilityO ?? 0,
        "compatibility_p": compatibilityP ?? 0,
        "compatibility_q": compatibilityQ ?? 0,
        "compatibility_r": compatibilityR ?? 0,
        "compatibility_s": compatibilityS ?? 0,
        "compatibility_t": compatibilityT ?? 0,
        "compatibility_u": compatibilityU ?? 0,
        "interests": List<dynamic>.from(interests.map((x) => x)) ?? [],
        "activities": List<dynamic>.from(activities.map((x) => x)) ?? [],
        "activities2": List<dynamic>.from(activities2.map((x) => x)) ?? [],
        "conversationTopics":
            List<dynamic>.from(conversationTopics.map((x) => x)) ?? [],
        "musicGenres": List<dynamic>.from(musicGenres.map((x) => x)) ?? [],
        "preferredQualities":
            List<dynamic>.from(preferredQualities.map((x) => x)) ?? [],
        "selfQualities": List<dynamic>.from(selfQualities.map((x) => x)) ?? [],
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

  void setEthnicity(String value) {
    ethnicity = value;
  }

  void setUniversity(String value) {
    university = value;
  }

  void setOccupation(String value) {
    occupation = value;
  }

  void setCity(String value) {
    city = value;
  }

  void setPoliticalStance(String value) {
    politicalStance = value;
  }

  void setReligiousBelief(String value) {
    religiousBelief = value;
  }

  void setMeetPreference(String value) {
    meetPreference = value;
  }

  void setVenuePreference(List<String> value) {
    venuePreference = value;
  }

  void setCompatibilityA(int value) {
    compatibilityA = value;
  }

  void setCompatibilityB(int value) {
    compatibilityB = value;
  }

  void setCompatibilityC(int value) {
    compatibilityC = value;
  }

  void setCompatibilityD(int value) {
    compatibilityD = value;
  }

  void setCompatibilityE(int value) {
    compatibilityE = value;
  }

  void setCompatibilityF(int value) {
    compatibilityF = value;
  }

  void setCompatibilityG(int value) {
    compatibilityG = value;
  }

  void setCompatibilityH(int value) {
    compatibilityH = value;
  }

  void setCompatibilityI(int value) {
    compatibilityI = value;
  }

  void setCompatibilityJ(int value) {
    compatibilityJ = value;
  }

  void setCompatibilityK(int value) {
    compatibilityK = value;
  }

  void setCompatibilityL(int value) {
    compatibilityL = value;
  }

  void setCompatibilityM(int value) {
    compatibilityM = value;
  }

  void setCompatibilityN(int value) {
    compatibilityN = value;
  }

  void setCompatibilityO(int value) {
    compatibilityO = value;
  }

  void setCompatibilityP(int value) {
    compatibilityP = value;
  }

  void setCompatibilityQ(int value) {
    compatibilityQ = value;
  }

  void setCompatibilityR(int value) {
    compatibilityS = value;
  }

  void setCompatibilityT(int value) {
    compatibilityT = value;
  }

  void setCompatibilityU(int value) {
    compatibilityU = value;
  }

  void setInterests(List<String> value) {
    interests = value;
  }

  void setActivities(List<String> value) {
    activities = value;
  }

  void setActivities2(List<String> value) {
    activities2 = value;
  }

  void setConversationTopics(List<String> value) {
    conversationTopics = value;
  }

  void setMusicGenres(List<String> value) {
    musicGenres = value;
  }

  void setPreferredQualities(List<String> value) {
    preferredQualities = value;
  }

  void setSelfQualities(List<String> value) {
    selfQualities = value;
  }
}
