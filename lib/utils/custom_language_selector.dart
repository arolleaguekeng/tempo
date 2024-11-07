import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import 'providers/local_provider.dart';
import 'shared_preference.dart';

class CustomLanguageSelector extends StatelessWidget {
  const CustomLanguageSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;
    return DropdownButton<Locale>(
      isExpanded: true,
      items: L10n.all.map(
        (locale) {
          final flag = L10n.getFlag(locale.languageCode);

          return DropdownMenuItem(
            value: locale,
            onTap: () {
              final provider =
                  Provider.of<LocaleProvider>(context, listen: false);

              provider.setLocale(locale);
              saveLanguage(language: locale.languageCode);
            },
            child: Text(
              flag,
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
      ).toList(),
      value: locale,
      onChanged: (_) {
        // save in shared pref
      },
    );
  }
}
