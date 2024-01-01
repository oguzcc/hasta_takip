# Generate locale_keys.g.dart for localization
# Script, converts json language files to locale_keys.g.dart file
# from assets/translations folder
# to lib/localization/locale_keys folder

dart run easy_localization:generate -O lib/localization/locale_keys -f keys -o locale_keys.g.dart -S assets/translations
