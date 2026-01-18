import 'package:get/get_navigation/get_navigation.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'My name is Mobin',
          'fatherName': 'My Father name is Abdul Mazid Miah',
        },
        'ur_PK': {
          'message': 'میرا نام موبین ہے۔',
          'fatherName': 'میرے والد کا نام عبدالمجید میاں ہے۔',
        },
      };
}
