String? validateFields(String? value, {bool required = true}) {
  if (required) {
    if (value == null || value.isEmpty) {
      return 'Please enter value';
    }
  } else if (value == '') {
    return null;
  }
  return null;
}
