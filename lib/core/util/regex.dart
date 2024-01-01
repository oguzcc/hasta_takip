class RegEx {
  static bool isFirstNameValid(String firstName) =>
      _isMatch(r"^(?=.{1,40}$)[a-zA-Z]+(?:[-'\s][a-zA-Z]+)*$", firstName);

  static bool isLastNameValid(String lastName) =>
      _isMatch(r"^(?=.{1,120}$)[a-zA-Z]+(?:[-'\s][a-zA-Z]+)*$", lastName);

  static bool isEmailValid(String email) => _isMatch(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        email,
      );

  static bool isPhoneValid(String phone) => _isMatch(r'^[\d()\-]{15}$', phone);

  static bool isInstitutionName(String institutionName) =>
      _isMatch(r'^(?=.{1,120}$)', institutionName);

  static bool isBankName(String bankName) =>
      _isMatch(r'^(?=.{1,120}$)', bankName);

  static bool isLastFirstOfAccountHolder(String accountHolder) =>
      _isMatch(r'^(?=.{1,161}$)', accountHolder);

  static bool isComment(String comment) =>
      _isMatch(r'^(?=.{1,1000}$)', comment);

  static bool isEmployeeInvitationCode(String employeeInvitationCode) =>
      _isMatch(
        r'^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$',
        employeeInvitationCode,
      );

  static bool isTippingAccumulation(String tippingAcc) =>
      _isMatch(r'^(?=.{1,120}$)', tippingAcc);

  static bool isTippingPlanName(String tippingPlan) =>
      _isMatch(r'^(?=.{1,40}$)', tippingPlan);

  static bool isTeamName(String teamName) =>
      _isMatch(r'^(?=.{1,40}$)', teamName);

  static bool isLinkName(String linkName) =>
      _isMatch(r'^(?=.{1,40}$)', linkName);

  static bool isLink(String link) => _isMatch(
        r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
        link,
      );

  static bool isDishComment(String dishComment) =>
      _isMatch(r'^(?=.{1,400}$)', dishComment);

  static bool isMenuName(String menuName) =>
      _isMatch(r'^(?=.{1,40}$)', menuName);

  static bool isNameOfFoodCategory(String nameOfFoodCategory) =>
      _isMatch(r'^(?=.{1,40}$)', nameOfFoodCategory);

  static bool isNameOfDish(String nameOfDish) =>
      _isMatch(r'^(?=.{1,120}$)', nameOfDish);

  static bool isDescripttionOfDish(String descriptionOfDish) =>
      _isMatch(r'^(?=.{1,1000}$)', descriptionOfDish);

  static bool isPriceOfDish(String priceOfDish) =>
      _isMatch(r'^\d+$', priceOfDish);

  static bool isOldPriceOfDish(String oldPriceOfDish) =>
      _isMatch(r'^\d+$', oldPriceOfDish);

  static bool isMeasuredValue(String measuredValue) =>
      _isMatch(r'^\d+$', measuredValue);

  static bool isWithdrawalAmount(String withdrawalAmount) =>
      _isMatch(r'^\d+$', withdrawalAmount);

  static bool isPasswordValid(String password) =>
      hasUpperCase(password) && hasDigits(password) && hasMinLength(password);

  static bool hasUpperCase(String password) =>
      password.contains(RegExp('[A-Z]'));

  static bool hasLowerCase(String password) =>
      password.contains(RegExp('[a-z]'));

  static bool hasDigits(String password) => password.contains(RegExp('[0-9]'));

  static bool hasMinLength(String password) =>
      password.length >= 8 && password.length <= 40;

  static bool hasEmailSpecialCharacters(String char) =>
      char.contains(RegExp(r'[^\w-\.\+_@]'));

  static bool hasSpecialCharacters(String char) =>
      char.contains(RegExp(r'[!#$%@^&*(),?":;{}\[\]|<>]'));

  static bool _isMatch(String pattern, String key) =>
      RegExp(pattern).hasMatch(key);
}
