bool validateEmail(String email) {
  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(emailPattern);
  return regex.hasMatch(email);
}

bool validatePhoneNumber(String phone) {
  String phonePattern = r'^\d{11}$'; // Assuming 10 digits for simplicity
  RegExp regex = RegExp(phonePattern);
  return regex.hasMatch(phone);
}