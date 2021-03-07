const String APP_NAME = 'Fethr';

// Bottom Navigation bar strings.
const String HOME = 'Home';
const String CALENDAR = 'Calendar';
const String EVENTS = "Events";
const String MAP = "Map";

// Route strings.
const String ROUTE_HOME = '/';
const String ROUTE_SIGNUP = '/signup';

// Login / Signup buttons.
const String LOGIN_ACCOUNT = 'Login to your account';
const String SIGNUP = "Sign up";
const String WELCOME =
    'Before joining the community, we\'d like to get to know you a bit better. Once done, we\'ll get in touch via email.';

const AGE_RANGES = [
  '18-24',
  '25-34',
  '35-44',
  '45-54',
  '55-64',
  '65+',
  'Prefer not to say'
];

const List<String> ORIENTATIONS = [
  'Bi',
  'Gay Man',
  'Gay Woman / Lesbian',
  'Heterosexual / Straight',
  'Prefer not to say'
];

List<String> ethnicityList = [
  'White',
  'Mixed',
  'Asian / Asian British',
  'Black / African / Caribbean / Black British',
  'Arab',
  'Hispanic',
  'Prefer not to say',
  'Other',
];

List<String> politicalStanceList = [
  'Liberal',
  'Moderate',
  'Conservative',
  'Prefer not to say',
  'Other'
];

List<String> religionList = [
  'Buddhist',
  'Christian',
  'Hindu',
  'Jewish',
  'Muslim',
  'Spiritual',
  'Athiest',
  'Prefer not to say',
  'Other'
];

const List<String> MEET_PREFERENCES = [
  'Online',
  'Offline',
  'Both',
];

List<String> venueList = [
  'Bar',
  'Restaurant',
  'Park',
  'Coffee Shop',
  'Art Gallery / Museum',
  'Don\'t Mind',
  'Other'
];

const List<String> NUMBER_SCALE = [
  '1',
  '2',
  '3',
  '4',
  '5',
];

List<String> interestList = [
  'Music',
  'Reading & Writing',
  'Social Action',
  'Dancing',
  'Education & Learning',
  'Cars & Motorcycles',
  'Pets & Animals',
  'Movies & Films',
  'Arts & Culture',
  'Handicrafts',
  'Health & Fitness',
  'Religion & Spirituality',
  'Fashion & beauty',
  'Travelling',
  'Sports',
  'Games',
  'Languages',
  'Environment',
  'Food & Drink',
  'Outdoors & Adventure',
  'Other',
];

List<String> activityList = [
  'Theatre / Musicals',
  'Live Gigs',
  'Art Galleries',
  'Live Comedy Shows',
  'Video Gaming',
  'Backpacking',
  'Camping',
  'Watching Sports',
  'Singing',
  'Bars / Cocktails Bar',
  'Pub',
  'Other',
];

List<String> activityList2 = [
  'Dancing',
  'Yoga / Pilates',
  'High-Intensity Workouts',
  'Gym',
  'Hiking',
  'Skiing / Snowboarding',
  'Sailing',
  'Playing Team Sports (Football, Cricket etc.)',
  'Tennis',
  'Squash',
  'Walks in Nature',
  'Other',
];

List<String> topicList = [
  'History',
  'Politics',
  'Current Affairs',
  'Science',
  'Learning Languages',
  'Literature',
  'Philosophy',
  'Business & Economics',
  'Food & Cuisines',
  'Alcohol (Wine, Whiskey etc.)',
  'Psychology',
  'Technology',
  'Climate Change / Environment',
  'Natural World',
  'Sports Teams',
  'Working Environment',
  'Other',
];

List<String> genreList = [
  'Rock',
  'Musical Theatre',
  'Classical',
  'Jazz',
  'K-Pop',
  'Folk',
  'Country',
  'Hip Hop',
  'Blues',
  'R&B',
  'Pop',
  'Dance',
  'Soul',
  'Reggae',
  'Other',
];

const List<String> GENDERS = [
  'Male',
  'Female',
  'Prefer not to say',
];

const List<String> qualitiesList = [
  'Funny',
  'Intelligent',
  'Empathetic',
  'Honest',
  'Generous',
  'Kind',
  'Non-judgemental',
  'Good listener',
  'Self-confident',
  'Spontaneous',
  'Other',
];

const List<String> qualitiesList2 = [
  'Funny',
  'Intelligent',
  'Empathetic',
  'Honest',
  'Generous',
  'Kind',
  'Non-judgemental',
  'Good listener',
  'Self-confident',
  'Spontaneous',
  'Other',
];

// Question bank.abstract
const List<String> QUESTIONS = <String>[
  '1. What\'s your first name? *',
  '2. And your surname? *',
  '3. And your email address *',
  'The following questions won\'t be used in determining your compatibility, we just want to get to know you a bit better',
  '4. What is your gender? *',
  '5. How old are you? *',
  '6. What\'s your sexual orientation? *',
  '7. What\'s your ethnicity? *',
  '8. What was the last university you attended?',
  '9. What\'s your occupation?',
  '10. What city do you live in? *',
  '11. What\'s your political stance? *',
  '12. What\'s your religious belief? *',
  '13. Would you prefer online or offline meets? *',
  '14. What venue(s) would you prefer for offline meets? *',
  '15. Ok, let\'s find out a little more about you',
  'a. I find unpredictable situations thrilling *',
  'b. I\'m constantly looking for new experiences *',
  'c. My friends would say I\'m very curious *',
  'd. I have more energy than most *',
  'e. I enjoy planning ahead of time *',
  'f. I believe it is important to follow rules *',
  'g. My friends and family would say I have traditional values *',
  'h. I prefer to work in a straightforward path when completing a task *',
  'i. I am more logical and analytical than most *',
  'j. I pursue intellectual topics in depth and regularly *',
  'k. I have no problem making a choice, even when several alternatives seemed equally good at first *',
  'l. I think it is important to be direct. *',
  'm. I like to get to know my friends’ deepest needs and feelings *',
  'n. I highly value deep emotional intimacy in my relationships *',
  'o. Regardless of what is logical, I generally listen to my heart when making important decisions *',
  'p. I vividly imagine both wonderful and bad things happening to me *',
  'q. I talk to a lot of different people at parties *',
  'r. I don\'t mind being the centre of attention *',
  's. I find it easy to start conversations *',
  't. I make new friends easily *',
  'u. I know how to captivate people *',
  '16. What are your interests?',
  '17. Which activities would you prefer to do on a weekend? *',
  '18. And how about these activities? *',
  '19. What are your favourite topics of conversation? *',
  '20. Preferred genre(s) of music *',
  '21. What qualities do you prefer in people you hang out with? *',
  '22. How would your close friends and/or family describe you? *',
];
