import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/l10n/l10n.dart';
import 'package:todo_app/provider/locale_provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final getLanguage = L10n.getLang(locale.languageCode);
    final provider = Provider.of<LocaleProvider>(context);
    return Container();
    // DropdownButtonHideUnderline(
    //     child: DropdownButton(
    //         items:
    //         onChanged: (_) {}));
  }
}
