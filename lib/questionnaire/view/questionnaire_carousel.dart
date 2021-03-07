import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:fethr/home/view/home_page.dart';
import 'package:fethr/model/questionnaire.dart';
import 'package:fethr/repositories/authentication_repository/authentication_bloc.dart';
import 'package:fethr/screens/Welcome_screen/components/background.dart';
import 'package:fethr/statics/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FethrQuestionnaire extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => FethrQuestionnaire());
  }

  @override
  _FethrQuestionnaireState createState() => _FethrQuestionnaireState();
}

class _FethrQuestionnaireState extends State<FethrQuestionnaire> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final int _numPages = 44;
  final PageController _questionController = PageController(initialPage: 0);
  int _currentPage = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  String _gender;
  String _ageRange;
  String _sexualOrientation;
  String _ethnicity;
  String _politicalStance;
  String _religiousBelief;
  String _meetPreference;
  List<String> _venuePreference;
  List<String> _interests;
  List<String> _activities;
  List<String> _activities2;
  List<String> _conversationTopics;
  List<String> _musicGenres;
  List<String> _preferredQualities;
  List<String> _selfQualities;

  String _compatibility_a;
  String _compatibility_b;
  String _compatibility_c;
  String _compatibility_d;
  String _compatibility_e;
  String _compatibility_f;
  String _compatibility_g;
  String _compatibility_h;
  String _compatibility_i;
  String _compatibility_j;
  String _compatibility_k;
  String _compatibility_l;
  String _compatibility_m;
  String _compatibility_n;
  String _compatibility_o;
  String _compatibility_p;
  String _compatibility_q;
  String _compatibility_r;
  String _compatibility_s;
  String _compatibility_t;
  String _compatibility_u;
  Questionnaire _questionnaire = new Questionnaire();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _universityController.dispose();
    _occupationController.dispose();
    _cityController.dispose();
  }

  Map _constructQuestionnaire() {
    _questionnaire = Questionnaire.fromMap({
      'surveyComplete': true,
      'firstName': _nameController.text,
      'surname': _surnameController.text,
      'email': _emailController.text,
      'gender': _gender,
      'ageRange': _ageRange,
      'sexualOrientation': _sexualOrientation,
      'ethnicity': _ethnicity,
      'university': _universityController.text,
      'occupation': _occupationController.text,
      'city': _cityController.text,
      'politicalStance': _politicalStance,
      'religiousBelief': _religiousBelief,
      'meetPreference': _meetPreference,
      'venuePreference': _venuePreference,
      'compatibility_a': int.parse(_compatibility_a ?? '0'),
      'compatibility_b': int.parse(_compatibility_b ?? '0'),
      'compatibility_c': int.parse(_compatibility_c ?? '0'),
      'compatibility_d': int.parse(_compatibility_d ?? '0'),
      'compatibility_e': int.parse(_compatibility_e ?? '0'),
      'compatibility_f': int.parse(_compatibility_f ?? '0'),
      'compatibility_g': int.parse(_compatibility_g ?? '0'),
      'compatibility_h': int.parse(_compatibility_h ?? '0'),
      'compatibility_i': int.parse(_compatibility_i ?? '0'),
      'compatibility_j': int.parse(_compatibility_j ?? '0'),
      'compatibility_k': int.parse(_compatibility_k ?? '0'),
      'compatibility_l': int.parse(_compatibility_l ?? '0'),
      'compatibility_m': int.parse(_compatibility_m ?? '0'),
      'compatibility_n': int.parse(_compatibility_n ?? '0'),
      'compatibility_o': int.parse(_compatibility_o ?? '0'),
      'compatibility_p': int.parse(_compatibility_p ?? '0'),
      'compatibility_q': int.parse(_compatibility_q ?? '0'),
      'compatibility_r': int.parse(_compatibility_r ?? '0'),
      'compatibility_s': int.parse(_compatibility_s ?? '0'),
      'compatibility_t': int.parse(_compatibility_t ?? '0'),
      'compatibility_u': int.parse(_compatibility_u ?? '0'),
      'interests': _interests,
      'activities': _activities,
      'activities2': _activities2,
      'conversationTopics': _conversationTopics,
      'musicGenres': _musicGenres,
      'preferredQualities': _preferredQualities,
      'selfQualities': _selfQualities
    });
    return _questionnaire.toMap();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height * 0.90,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _questionController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _InstructionScreen(
                        questionController: _questionController,
                        title: WELCOME,
                        subtitle: 'Takes 5 min',
                        buttonText: 'Start'),
                    _TextInputField(
                      controller: _nameController,
                      labelText: 'Name',
                      questionText: QUESTIONS[0],
                    ),
                    _TextInputField(
                      controller: _surnameController,
                      labelText: 'Surname',
                      questionText: QUESTIONS[1],
                    ),
                    _TextInputField(
                      subtext: 'The one you used to sign up with',
                      controller: _emailController,
                      labelText: 'Email address',
                      questionText: QUESTIONS[2],
                    ),
                    _InstructionScreen(
                      questionController: _questionController,
                      buttonText: 'Continue',
                      title: QUESTIONS[3],
                    ),
                    _SingleChoiceSelection(
                      value: _gender,
                      questionText: QUESTIONS[4],
                      choices: GENDERS,
                      function: (choice) => _gender = choice,
                    ),
                    _SingleChoiceSelection(
                      value: _ageRange,
                      questionText: QUESTIONS[5],
                      choices: AGE_RANGES,
                      function: (choice) => _ageRange = choice,
                    ),
                    _SingleChoiceSelection(
                      value: _sexualOrientation,
                      questionText: QUESTIONS[6],
                      choices: ORIENTATIONS,
                      function: (choice) => _sexualOrientation = choice,
                    ),
                    _SingleChoiceSelection(
                      value: _ethnicity,
                      questionText: QUESTIONS[7],
                      choices: ethnicityList,
                      function: (choice) => _ethnicity = choice,
                      other: (other) {
                        _ethnicity = other;
                        setState(() {
                          ethnicityList.last = other;
                        });
                      },
                    ),
                    _TextInputField(
                      subtext: 'If applicable',
                      controller: _universityController,
                      labelText: 'University',
                      questionText: QUESTIONS[8],
                    ),
                    _TextInputField(
                      subtext: 'Optional',
                      controller: _occupationController,
                      labelText: 'Occupation',
                      questionText: QUESTIONS[9],
                    ),
                    _TextInputField(
                      controller: _cityController,
                      labelText: 'City',
                      questionText: QUESTIONS[10],
                    ),
                    _SingleChoiceSelection(
                      value: _politicalStance,
                      questionText: QUESTIONS[11],
                      choices: politicalStanceList,
                      function: (choice) => _politicalStance = choice,
                      other: (other) {
                        _politicalStance = other;
                        setState(() {
                          politicalStanceList.last = other;
                        });
                      },
                    ),
                    _SingleChoiceSelection(
                      value: _religiousBelief,
                      questionText: QUESTIONS[12],
                      choices: religionList,
                      function: (choice) => _religiousBelief = choice,
                      other: (other) {
                        _religiousBelief = other;
                        setState(() {
                          religionList.last = other;
                        });
                      },
                    ),
                    _SingleChoiceSelection(
                      value: _meetPreference,
                      questionText: QUESTIONS[13],
                      choices: MEET_PREFERENCES,
                      function: (value) => _meetPreference = value,
                    ),
                    _MultiChoiceSelection(
                      maxItems: 100,
                      values: _venuePreference,
                      questionText: QUESTIONS[14],
                      subtext: 'Choose as many as you like',
                      choices: venueList,
                      function: (values) =>
                          _venuePreference = List<String>.from(values),
                      other: (other) {
                        _venuePreference = other;
                      },
                    ),
                    _InstructionScreen(
                      questionController: _questionController,
                      title: QUESTIONS[15],
                      subtitle:
                          'The following questions will be used in determining your compatibility',
                      buttonText: 'Continue',
                    ),
                    _AgreeScale(
                      value: _compatibility_a,
                      questionText: QUESTIONS[16],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_a = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_b,
                      questionText: QUESTIONS[17],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_b = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_c,
                      questionText: QUESTIONS[18],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_c = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_d,
                      questionText: QUESTIONS[19],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_d = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_e,
                      questionText: QUESTIONS[20],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_e = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_f,
                      questionText: QUESTIONS[21],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_f = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_g,
                      questionText: QUESTIONS[22],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_g = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_h,
                      questionText: QUESTIONS[23],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_h = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_i,
                      questionText: QUESTIONS[24],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_i = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_j,
                      questionText: QUESTIONS[25],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_j = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_k,
                      questionText: QUESTIONS[26],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_k = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_l,
                      questionText: QUESTIONS[27],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_l = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_m,
                      questionText: QUESTIONS[28],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_m = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_n,
                      questionText: QUESTIONS[29],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_n = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_o,
                      questionText: QUESTIONS[30],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_o = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_p,
                      questionText: QUESTIONS[31],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_p = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_q,
                      questionText: QUESTIONS[32],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_q = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_r,
                      questionText: QUESTIONS[33],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_r = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_s,
                      questionText: QUESTIONS[34],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_s = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_t,
                      questionText: QUESTIONS[35],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_t = choice,
                    ),
                    _AgreeScale(
                      value: _compatibility_u,
                      questionText: QUESTIONS[36],
                      choices: NUMBER_SCALE,
                      function: (choice) => _compatibility_u = choice,
                    ),
                    _MultiChoiceSelection(
                      maxItems: 5,
                      values: _interests,
                      questionText: QUESTIONS[37],
                      subtext: 'You can choose up to 5',
                      choices: interestList,
                      function: (values) =>
                          _interests = List<String>.from(values),
                      other: (other) {
                        _interests = other;
                      },
                    ),
                    _MultiChoiceSelection(
                      maxItems: 3,
                      values: _activities,
                      questionText: QUESTIONS[38],
                      subtext: 'You can choose up to 3',
                      choices: activityList,
                      function: (values) =>
                          _activities = List<String>.from(values),
                      other: (other) {
                        _activities = other;
                      },
                    ),
                    _MultiChoiceSelection(
                      maxItems: 3,
                      values: _activities2,
                      questionText: QUESTIONS[39],
                      subtext: 'You can choose up to 3',
                      choices: activityList2,
                      function: (values) =>
                          _activities2 = List<String>.from(values),
                      other: (other) {
                        _activities2 = other;
                      },
                    ),
                    _MultiChoiceSelection(
                      maxItems: 3,
                      values: _conversationTopics,
                      questionText: QUESTIONS[40],
                      subtext: 'You can choose up to 3',
                      choices: topicList,
                      function: (values) =>
                          _conversationTopics = List<String>.from(values),
                      other: (other) {
                        _conversationTopics = other;
                      },
                    ),
                    _MultiChoiceSelection(
                      maxItems: 100,
                      values: _musicGenres,
                      questionText: QUESTIONS[41],
                      subtext: 'Choose as many as you like',
                      choices: genreList,
                      function: (values) =>
                          _musicGenres = List<String>.from(values),
                      other: (other) {
                        _musicGenres = other;
                      },
                    ),
                    _MultiChoiceSelection(
                      maxItems: 3,
                      values: _preferredQualities,
                      questionText: QUESTIONS[42],
                      subtext: 'Please choose up to 3',
                      choices: qualitiesList,
                      function: (values) =>
                          _preferredQualities = List<String>.from(values),
                      other: (other) {
                        _preferredQualities = other;
                      },
                    ),
                    _MultiChoiceSelection(
                      maxItems: 3,
                      values: _selfQualities,
                      questionText: QUESTIONS[43],
                      subtext: 'Please choose up to 3',
                      choices: qualitiesList2,
                      function: (values) =>
                          _selfQualities = List<String>.from(values),
                      other: (other) {
                        _selfQualities = other;
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  _currentPage != 0
                      ? '${(((_currentPage - 1) / _numPages) * 100).floor()}% Complete'
                      : '',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: _currentPage != _numPages
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: FlatButton(
                              onPressed: () {
                                _questionController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Previous',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                              onPressed: () {
                                print(_ethnicity);
                                print(_questionnaire.ethnicity);
                                _questionController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: FlatButton(
                              onPressed: () {
                                _questionController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Previous',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                              onPressed: () async {
                                firebaseFirestore
                                    .collection('users')
                                    .doc(user.id)
                                    .set(_constructQuestionnaire())
                                    .then(
                                      (value) => Navigator.of(context)
                                          .pushAndRemoveUntil(HomePage.route(),
                                              (route) => false),
                                    );
                              },
                              child: Text(
                                'Complete',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstructionScreen extends StatelessWidget {
  const _InstructionScreen({
    Key key,
    @required PageController questionController,
    @required this.title,
    this.subtitle = '',
    @required this.buttonText,
  })  : _questionController = questionController,
        super(key: key);

  final PageController _questionController;
  final String title;
  final String subtitle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 30.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            SizedBox(height: 30.0),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            subtitle != '' ? SizedBox(height: 30.0) : Container(height: 0),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.0),
              ),
              onPressed: () => _questionController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
              color: Colors.black,
              child: Text(
                buttonText,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TextInputField extends StatelessWidget {
  const _TextInputField({
    Key key,
    @required TextEditingController controller,
    @required this.questionText,
    @required this.labelText,
    this.subtext = '',
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String questionText;
  final String labelText;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            subtext == ''
                ? Text(
                    questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  )
                : Column(
                    children: [
                      Text(
                        questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        subtext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: 30.0),
            TextField(
              controller: _controller,
              key: Key('onboard_${labelText}_textField'),
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black),
              onSubmitted: (text) {},
              decoration: InputDecoration(
                labelText: labelText,
                helperText: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleChoiceSelection extends StatelessWidget {
  final List<String> choices;
  final String questionText;
  final String subtext;
  final Function function;
  final Function(String) other;
  final String value;

  const _SingleChoiceSelection({
    Key key,
    @required this.questionText,
    @required this.choices,
    @required this.function,
    this.other,
    this.value = '',
    this.subtext = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            Center(
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 10.0),
            subtext == ''
                ? Text(
                    questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  )
                : Column(
                    children: [
                      Text(
                        questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      Text(
                        subtext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
            Expanded(
              child: CustomRadioButton(
                
                otherValue: other,
                radioButtonValue: function,
                defaultSelected: value,
                elevation: 0,
                absoluteZeroSpacing: false,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: choices,
                buttonValues: choices,
                buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16)),
                customShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.black),
                ),
                selectedColor: Theme.of(context).accentColor,
                horizontal: true,
                enableShape: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MultiChoiceSelection extends StatelessWidget {
  final List<String> choices;
  final String questionText;
  final String subtext;
  final Function function;
  final Function(List<String>) other;
  final List<String> values;
  final int maxItems;

  const _MultiChoiceSelection({
    Key key,
    @required this.questionText,
    @required this.choices,
    @required this.function,
    @required this.maxItems,
    this.other,
    this.subtext = '',
    this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            Center(
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 10.0),
            subtext == ''
                ? Text(
                    questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  )
                : Column(
                    children: [
                      Text(
                        questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        subtext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
            Expanded(
              child: CustomCheckBoxGroup(
                defaultSelected: values,
                elevation: 0,
                maxChecked: maxItems,
                absoluteZeroSpacing: false,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: choices,
                buttonValuesList: choices,
                buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16)),
                checkBoxButtonValues: function,
                otherValues: other,
                customShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.black),
                ),
                selectedColor: Theme.of(context).accentColor,
                horizontal: true,
                enableShape: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AgreeScale extends StatelessWidget {
  final List<String> choices;
  final String questionText;
  final Function function;
  final String value;

  const _AgreeScale({
    Key key,
    @required this.questionText,
    @required this.choices,
    @required this.function,
    this.value = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              questionText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  width: size.width * 0.95,
                  child: CustomRadioButton(
                    elevation: 0,
                    defaultSelected: value,
                    width: (size.width * 0.95) / 5,
                    absoluteZeroSpacing: true,
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: choices,
                    buttonValues: choices,
                    buttonTextStyle: ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: 16)),
                    radioButtonValue: function,
                    selectedColor: Theme.of(context).accentColor,
                    horizontal: false,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Strongly Disagree'),
                    Text('Neutral'),
                    Text('\t\t\t\tStrongly Agree'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
