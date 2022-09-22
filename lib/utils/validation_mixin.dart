class ValidationMixin {
  // validateName(String value, {String? title}) {
  //   final regExp = RegExp("^[a-zA-Z]+(\\s+[a-zA-Z]+)+\$");

  //   if(value.trim().isEmpty){
  //     return title == null ? Localkeys.
  //   } else if (!regExp.hasMatch(value.trim())){
  //     return ;
  //   }
  //   return null;
  // }

  validateTask(String value) {
    if (value.isEmpty) {
      return "Please enter task";
    } else {
      return null;
    }
  }
}
