import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/l10n/l10n.dart';
import 'package:todo_app/provider/locale_provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final locale = Localizations.localeOf(context);
    // final getLanguage = L10n.getLang(locale.languageCode);
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: const Icon(
          Icons.language,
          color: Colors.blue,
        ),
        value: locale,
        items: L10n.all.map((e) {
          final lang = L10n.getLang(e.languageCode);
          return DropdownMenuItem(
            value: e,
            onTap: () {
              final provider =
                  Provider.of<LocaleProvider>(context, listen: false);

              provider.setLocale(e);
            },
            child: Center(
              child: Text(lang),
            ),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
