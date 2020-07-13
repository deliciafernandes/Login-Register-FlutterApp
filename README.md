# Auth  
### A Login & Register Auth App using Google and Facebook sign in.
  
### UI RESULT:    
<img src="https://github.com/deliciafernandes/Login-Register-Task/blob/master/assets/images/Login.png" alt="login" height="600"> <img src="https://github.com/deliciafernandes/Login-Register-Task/blob/master/assets/images/Register.png" alt="login" height="600">    

### To enable Firebase :    
* For android, add your google-services.json inside your project-level app folder.
* For iOS, add your GoogleService-Info.plist inside your project-level Runner folder.

Photo by Kaique Rocha from Pexels

Note: Use email validator package
import 'package:email_validator/email_validator.dart';
String emailText = '';
errorText: email != emailConfirm? 'Emails don\'t match': null,
if (!EmailValidator.validate(email)) {
emailText = 'Sorry Invalid email';
}
});
