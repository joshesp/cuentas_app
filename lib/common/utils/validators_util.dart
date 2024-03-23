String? emailValidator(String? value) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Ingresa un correo electrónico';
  } else if (!regExp.hasMatch(value)) {
    return 'EL correo electrónico no es válido';
  } else {
    return null;
  }
}

String? passwordValidator(String? value) {
  return lengthValidator(value) ??
      upperCaseValidator(value) ??
      lowerCaseValidator(value) ??
      numberValidator(value) ??
      specialCharacterValidator(value);
}

String? lengthValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Ingresa una contraseña';
  } else if (value.length < 6) {
    return 'Debe tener al menos 6 caracteres';
  } else {
    return null;
  }
}

String? upperCaseValidator(String? value) {
  const pattern = r'^(?=.*?[A-Z])';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value!)) {
    return 'Debe contener al menos una letra mayúscula';
  } else {
    return null;
  }
}

String? lowerCaseValidator(String? value) {
  const pattern = r'^(?=.*?[a-z])';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value!)) {
    return 'Debe contener al menos una letra minúscula';
  } else {
    return null;
  }
}

String? numberValidator(String? value) {
  const pattern = r'^(?=.*?[0-9])';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value!)) {
    return 'Debe contener al menos un número';
  } else {
    return null;
  }
}

String? specialCharacterValidator(String? value) {
  const pattern = r'^(?=.*?[!@#\$&*~])';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value!)) {
    return 'Debe contener al menos un carácter especial';
  } else {
    return null;
  }
}
