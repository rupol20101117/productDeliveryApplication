import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'bn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? bnText = '',
  }) =>
      [enText, bnText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboardingScreen
  {
    'g026pkc5': {
      'en': 'Largest Online Delivery App',
      'bn': '',
    },
    '6730w5c7': {
      'en': 'Thousands of shops around you',
      'bn': '',
    },
    'y5dys2np': {
      'en': 'Select from our best items',
      'bn': '',
    },
    'yob7t1fn': {
      'en': 'Choose which suits you best',
      'bn': '',
    },
    'b0qh8lay': {
      'en': 'Fastest Delivery anywhere\naround the city',
      'bn': '',
    },
    'lcc1m2e7': {
      'en': 'Homestep delivery with cash\n on delivery method',
      'bn': '',
    },
    'r84tgj7p': {
      'en': 'Get Started',
      'bn': '',
    },
  },
  // LoginPage
  {
    'b2y6jkn8': {
      'en': 'Use the form below to access your account.',
      'bn': '',
    },
    'bhi002jp': {
      'en': 'Email',
      'bn': '',
    },
    'm1c68zi7': {
      'en': 'Enter your email here...',
      'bn': '',
    },
    '7pgcar6m': {
      'en': 'Password',
      'bn': '',
    },
    'q5kdy2ws': {
      'en': 'Enter your password here...',
      'bn': '',
    },
    'f8ucc0sr': {
      'en': 'Forgot Password?',
      'bn': '',
    },
    '0uucw1iu': {
      'en': 'Login',
      'bn': '',
    },
    'ijwp65h4': {
      'en': 'Use a social platform to continue',
      'bn': '',
    },
    'usrdo9l0': {
      'en': 'Don\'t have an account?',
      'bn': '',
    },
    'fs8xwkb2': {
      'en': 'Create Account',
      'bn': '',
    },
    '6lwang6j': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Dashboard
  {
    'qgmutg3c': {
      'en': 'Search for dresses...',
      'bn': '',
    },
    'kh6w9plw': {
      'en': 'Today\'s Deals',
      'bn': '',
    },
    'vvpaq9ue': {
      'en': 'Recommended for you',
      'bn': '',
    },
    'snf9fd95': {
      'en': 'View All',
      'bn': '',
    },
    '74m9wsgt': {
      'en': 'Dashboard',
      'bn': '',
    },
    'ockjaleq': {
      'en': '  Cart',
      'bn': '',
    },
    's6cc5m78': {
      'en': '  Profile',
      'bn': '',
    },
    'ga3u01go': {
      'en': '  Track Order',
      'bn': '',
    },
    '2rx1l1bs': {
      'en': '  Notification',
      'bn': '',
    },
    'uebt1jfe': {
      'en': 'Logout',
      'bn': '',
    },
    'ptkuhnv6': {
      'en': 'Order History',
      'bn': '',
    },
    'ucwol0qm': {
      'en': '  About',
      'bn': '',
    },
    'tyw2c3tc': {
      'en': '  Favourite',
      'bn': '',
    },
    '0qyuuwjk': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Cart
  {
    'ynsbwmw9': {
      'en': 'x1',
      'bn': '',
    },
    '1rvxv8m9': {
      'en': 'Order Summary',
      'bn': '',
    },
    'z1ktktj6': {
      'en': 'Subtotal',
      'bn': '',
    },
    '6cya1od2': {
      'en': 'Tax',
      'bn': '',
    },
    'e0vvr59q': {
      'en': '2.0%',
      'bn': '',
    },
    'kzstglyy': {
      'en': 'Delivery',
      'bn': '',
    },
    'nay8j542': {
      'en': '30৳',
      'bn': '',
    },
    'glyxg89y': {
      'en': 'Total',
      'bn': '',
    },
    'w23vv0ps': {
      'en': 'Review payment & address',
      'bn': '',
    },
    'ukrgocg6': {
      'en': 'Cart',
      'bn': '',
    },
  },
  // ProductList
  {
    '5xy32dkz': {
      'en': 'Search for electronics...',
      'bn': '',
    },
    '1owqp5nz': {
      'en': 'Categories',
      'bn': '',
    },
    'm4v46aeo': {
      'en': 'contacts',
      'bn': '',
    },
  },
  // PaymenandReview
  {
    'f2xcvnyr': {
      'en': 'Order Details',
      'bn': '',
    },
    'yd85tvvv': {
      'en': 'Product will be delivered in',
      'bn': '',
    },
    '06snfd3o': {
      'en': 'Friday - May 27, 2022',
      'bn': '',
    },
    'f51jbqy5': {
      'en': 'Edit',
      'bn': '',
    },
    '944dycfc': {
      'en': 'Slide to change address',
      'bn': '',
    },
    '9lar0bft': {
      'en': 'Choose Payment  method',
      'bn': '',
    },
    'pxxb9y75': {
      'en': 'Cash on Delivery',
      'bn': '',
    },
    'ebjwutrh': {
      'en': 'Order Summary',
      'bn': '',
    },
    'c4fkxyga': {
      'en': 'Subtotal',
      'bn': '',
    },
    'jad4i8qf': {
      'en': 'Tax',
      'bn': '',
    },
    'h10rvzui': {
      'en': '2.0%',
      'bn': '',
    },
    'do3srteq': {
      'en': 'Delivery',
      'bn': '',
    },
    'f67aasxc': {
      'en': '30৳',
      'bn': '',
    },
    'j0yrwr9b': {
      'en': 'Total',
      'bn': '',
    },
    'k9d6tbke': {
      'en': 'Confirm Order',
      'bn': '',
    },
    '3y08ai13': {
      'en': 'Review & Confirm',
      'bn': '',
    },
    '5azfyth4': {
      'en': 'Home',
      'bn': '',
    },
  },
  // productDetails
  {
    'ab524b8l': {
      'en': ' Product details',
      'bn': '',
    },
    'tco0qj21': {
      'en': 'Add to Cart',
      'bn': '',
    },
    'k9kks090': {
      'en': 'Go to Cart',
      'bn': '',
    },
    'tvevzw11': {
      'en': 'Home',
      'bn': '',
    },
  },
  // RegisterPage
  {
    'og3l2y7f': {
      'en': 'Use the form below to get started.',
      'bn': '',
    },
    '352i9baw': {
      'en': 'Email Address',
      'bn': '',
    },
    'ecuexosr': {
      'en': 'Enter your email here...',
      'bn': '',
    },
    '7dxdgn78': {
      'en': 'Password',
      'bn': '',
    },
    'vhsk07vs': {
      'en': 'Enter your password here...',
      'bn': '',
    },
    'xuot1n0e': {
      'en': 'Confirm Password',
      'bn': '',
    },
    'xxhefv39': {
      'en': 'Re-enter your password here...',
      'bn': '',
    },
    'htvt4vaz': {
      'en': 'Create Account',
      'bn': '',
    },
    '9nkumocu': {
      'en': 'Already have an account?',
      'bn': '',
    },
    'vl1bo069': {
      'en': 'Log In',
      'bn': '',
    },
    '2o5e4wb4': {
      'en': 'Home',
      'bn': '',
    },
  },
  // profile
  {
    'inu7z44v': {
      'en': 'Your Name',
      'bn': '',
    },
    'r6eli7vi': {
      'en': 'Enter your name here',
      'bn': '',
    },
    'q7g0sz8k': {
      'en': 'Your phone number',
      'bn': '',
    },
    'e2uqo765': {
      'en': 'Enter your phone number here',
      'bn': '',
    },
    'coujk33h': {
      'en': 'Your address',
      'bn': '',
    },
    'whkeyr24': {
      'en': 'Enter your address here',
      'bn': '',
    },
    '16wfs64l': {
      'en': 'Your City',
      'bn': '',
    },
    '2i7akajy': {
      'en': 'Enter your city here',
      'bn': '',
    },
    '6nngdzxg': {
      'en': 'Update Profile',
      'bn': '',
    },
    'b7qvstc8': {
      'en': 'Complete your Profile',
      'bn': '',
    },
  },
  // trackPackage
  {
    'r6gso7wi': {
      'en': 'Order Details',
      'bn': '',
    },
    '2r1e53ox': {
      'en': 'INVOICE NO:      #PREF012834789345',
      'bn': '',
    },
    '3mgwus3e': {
      'en': 'Order Placed by',
      'bn': '',
    },
    'td863u2d': {
      'en': 'In Progress',
      'bn': '',
    },
    'a6w8gnne': {
      'en': 'Product Shipped',
      'bn': '',
    },
    'lqqbgghu': {
      'en': 'Product Delivery',
      'bn': '',
    },
    'dbh0afk7': {
      'en': 'Verify Product',
      'bn': '',
    },
    'ad5egcwh': {
      'en': 'Cancel',
      'bn': '',
    },
    'jlrye13k': {
      'en': 'Page Title',
      'bn': '',
    },
  },
  // viewProfile
  {
    '0l2yzxz5': {
      'en': 'Orders Preview',
      'bn': '',
    },
    'cq595c3d': {
      'en': 'Update Profile',
      'bn': '',
    },
    'wov5wbe7': {
      'en': 'Profile',
      'bn': '',
    },
    '3o1annku': {
      'en': 'Home',
      'bn': '',
    },
  },
  // bkash
  {
    '8supadop': {
      'en': 'Bkash',
      'bn': '',
    },
    '9l0h7czu': {
      'en': 'ExactReach',
      'bn': '',
    },
    'okhjfq7e': {
      'en': '৳1200',
      'bn': '',
    },
    'nxb4ahy0': {
      'en': 'Your bkash account number',
      'bn': '',
    },
    '9wxr2k4m': {
      'en': '',
      'bn': '',
    },
    'vwvlmfx6': {
      'en': 'e.g 01XXXXXXXXX',
      'bn': '',
    },
    'wqyifcgx': {
      'en':
          'By clicking on confirm, you are agreeing\n to the terms & conditions',
      'bn': '',
    },
    'tnnhcy42': {
      'en': 'Close',
      'bn': '',
    },
    '9ysqcwjd': {
      'en': 'Corfirm',
      'bn': '',
    },
    'n1s3rjj0': {
      'en': '16247',
      'bn': '',
    },
    '9lkxrlq7': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Order_History
  {
    'thuuk707': {
      'en': 'Page Title',
      'bn': '',
    },
    'sgii75fd': {
      'en': 'Home',
      'bn': '',
    },
  },
  // upayPay
  {
    '3yz8ypqa': {
      'en': 'Upay',
      'bn': '',
    },
    '65ye5zb6': {
      'en': 'Text\nInvoice Number : UPY493920230929184370\nAmount : BDT 1030',
      'bn': '',
    },
    'mxeevhlq': {
      'en': 'Enter Your upay Account Number ',
      'bn': '',
    },
    'uhtw4voq': {
      'en':
          'By clicking on Confirm, you are \nagreeing to the terms & conditions',
      'bn': '',
    },
    'v1qxsqhu': {
      'en': '',
      'bn': '',
    },
    'frrbivn6': {
      'en': 'e.g 01XXXXXXXXX',
      'bn': '',
    },
    'q280dhf4': {
      'en': 'Close',
      'bn': '',
    },
    'p1okcung': {
      'en': 'Confirm',
      'bn': '',
    },
    't13yijip': {
      'en': '16268',
      'bn': '',
    },
    'yk7bnpdr': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Order_History_Details
  {
    'aw7e24av': {
      'en': 'Page Title',
      'bn': '',
    },
    '46kn5nn2': {
      'en': 'x1',
      'bn': '',
    },
    'p2kph98y': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Nagad
  {
    'laqcz1sb': {
      'en': 'Charge:  BDT 0',
      'bn': '',
    },
    'gi4wkfnz': {
      'en': 'Total Amount:  BDT  1,000.00',
      'bn': '',
    },
    'q1jaajhj': {
      'en': 'Nagad',
      'bn': '',
    },
    'af2nm9tv': {
      'en': 'Invoice No:  INV160058315266',
      'bn': '',
    },
    'wfr6lhaz': {
      'en': 'Your Nagad Account Number ',
      'bn': '',
    },
    'ki09af3a': {
      'en': 'e.g 01XXXXXXXXX',
      'bn': '',
    },
    'xql95rvt': {
      'en': 'Close',
      'bn': '',
    },
    '5e6qt589': {
      'en': 'Proceed',
      'bn': '',
    },
    '245at7qz': {
      'en': 'Nagad',
      'bn': '',
    },
    'o7xd2b68': {
      'en': 'Home',
      'bn': '',
    },
  },
  // aboutpage
  {
    'utdlh65x': {
      'en': 'Page Title',
      'bn': '',
    },
    'fp55m6p7': {
      'en':
          'This is a product delivery application\nusers can choose their suitable product and order product, and also can sell own product to other users.',
      'bn': '',
    },
    '7m3guzod': {
      'en': 'Tasfiqul Ahmed\n Mohammad Hossain Rupol\nRakibur Rahman Araf',
      'bn': '',
    },
    'yiny4lrl': {
      'en': 'This application is developed by',
      'bn': '',
    },
    'jssc8sn4': {
      'en': 'Home',
      'bn': '',
    },
  },
  // bkash_confirmation
  {
    'skg3cai7': {
      'en': 'Bkash',
      'bn': '',
    },
    'n5nw4101': {
      'en': 'ExactReach',
      'bn': '',
    },
    '1pt74xgh': {
      'en': 'Enter pin number',
      'bn': '',
    },
    'm663wo8v': {
      'en': '',
      'bn': '',
    },
    'xgmrzsug': {
      'en': '',
      'bn': '',
    },
    '79b6sn17': {
      'en': 'Close',
      'bn': '',
    },
    'z0hhnlxf': {
      'en': 'Corfirm',
      'bn': '',
    },
    '5n9j2i14': {
      'en': '16247',
      'bn': '',
    },
    'vkfr336b': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Nagad_confirmation
  {
    '2ppsb3hy': {
      'en': 'Charge:  BDT 0',
      'bn': '',
    },
    '8wxijthx': {
      'en': 'Total Amount:  BDT  1,000.00',
      'bn': '',
    },
    'kinzxotx': {
      'en': 'Nagad',
      'bn': '',
    },
    '1l03itms': {
      'en': 'Invoice No:  INV160058315266',
      'bn': '',
    },
    '6hrldqi8': {
      'en': 'Enter Pin Number',
      'bn': '',
    },
    'y61byama': {
      'en': '',
      'bn': '',
    },
    'qxqvka5x': {
      'en': 'Close',
      'bn': '',
    },
    'criyp136': {
      'en': 'Proceed',
      'bn': '',
    },
    '9fcqk3of': {
      'en': 'Nagad',
      'bn': '',
    },
    'msu6u2yo': {
      'en': 'Home',
      'bn': '',
    },
  },
  // rocketPay
  {
    '2fofpw7i': {
      'en': 'Rocket',
      'bn': '',
    },
    'uxj0unea': {
      'en': 'Mobile Payment infromation',
      'bn': '',
    },
    '45i64c8n': {
      'en': 'PIN',
      'bn': '',
    },
    'xxqlb6w2': {
      'en': 'Mobile Account',
      'bn': '',
    },
    '1bzec7hv': {
      'en': 'Amount',
      'bn': '',
    },
    'f8wxgs4f': {
      'en': 'BDT',
      'bn': '',
    },
    'ztkxl85g': {
      'en': 'Description',
      'bn': '',
    },
    '9j4cv8oq': {
      'en': 'RESET',
      'bn': '',
    },
    '8cs5hbu7': {
      'en': 'SUBMIT',
      'bn': '',
    },
    'hqwwo6tl': {
      'en': 'DBBL E-COMM With Daraz Bangladesh Limited',
      'bn': '',
    },
    'wqcipwu9': {
      'en': 'ecom.dutchbanglabank.com',
      'bn': '',
    },
    'vtgnsnn2': {
      'en': 'Currency',
      'bn': '',
    },
    'il32bgqp': {
      'en': 'Home',
      'bn': '',
    },
  },
  // confirmOrder
  {
    'y8ztzyof': {
      'en': 'Order Confirmed',
      'bn': '',
    },
    'w3pfadnw': {
      'en': 'OK',
      'bn': '',
    },
  },
  // QRResult
  {
    'h1sazm5u': {
      'en': 'Product Received',
      'bn': '',
    },
    'yd875bjm': {
      'en': 'OK',
      'bn': '',
    },
  },
  // changeLocation
  {
    '444eqghv': {
      'en': 'Change your address here',
      'bn': '',
    },
    'sfugddd2': {
      'en': 'Your address',
      'bn': '',
    },
    'cf3o1e6i': {
      'en': 'Enter your address here',
      'bn': '',
    },
    '27vbbbq0': {
      'en': 'Change address',
      'bn': '',
    },
  },
  // bkash_payment_confirmation
  {
    '6w4cw64p': {
      'en': 'Payment Confirmed',
      'bn': '',
    },
    '7yh5x2y6': {
      'en': 'OK',
      'bn': '',
    },
  },
  // nagad_payment_confirmation
  {
    'l427h09q': {
      'en': 'Payment Confirmed',
      'bn': '',
    },
    'z3guvlon': {
      'en': 'OK',
      'bn': '',
    },
  },
  // rocket_payment_confirmation
  {
    'qjloqoq9': {
      'en': 'Payment Confirmed',
      'bn': '',
    },
    'feb34t7j': {
      'en': 'OK',
      'bn': '',
    },
  },
  // Miscellaneous
  {
    'z9ykhxfg': {
      'en': '',
      'bn': '',
    },
    'q0gf0trj': {
      'en': '',
      'bn': '',
    },
    'a7cbhl17': {
      'en': 'please turn on your location',
      'bn': '',
    },
    '65j2lhov': {
      'en': '',
      'bn': '',
    },
    'haryitd3': {
      'en': '',
      'bn': '',
    },
    'jpurd4iz': {
      'en': '',
      'bn': '',
    },
    'siyibfzr': {
      'en': '',
      'bn': '',
    },
    '2g6q9o25': {
      'en': '',
      'bn': '',
    },
    'hj7qmly5': {
      'en': '',
      'bn': '',
    },
    'o75m341g': {
      'en': '',
      'bn': '',
    },
    'j33hasco': {
      'en': '',
      'bn': '',
    },
    'yslbz3hb': {
      'en': '',
      'bn': '',
    },
    'mbsio6e3': {
      'en': '',
      'bn': '',
    },
    'ounxn8q4': {
      'en': '',
      'bn': '',
    },
    'ymjn0yb6': {
      'en': '',
      'bn': '',
    },
    'q88w82pc': {
      'en': '',
      'bn': '',
    },
    '7th0pbsk': {
      'en': '',
      'bn': '',
    },
    '2x4l2o6o': {
      'en': '',
      'bn': '',
    },
    'nxbi2r4u': {
      'en': '',
      'bn': '',
    },
    '38jw6uxg': {
      'en': '',
      'bn': '',
    },
    'dbqs39qa': {
      'en': '',
      'bn': '',
    },
    '43uz81cx': {
      'en': '',
      'bn': '',
    },
    'fxr95j0j': {
      'en': '',
      'bn': '',
    },
    'bfqtr4yr': {
      'en': '',
      'bn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
