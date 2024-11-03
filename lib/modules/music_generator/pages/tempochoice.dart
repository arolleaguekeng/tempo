import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Tempochoice extends StatefulWidget {
  const Tempochoice({super.key});
  static const String routeName = '/tempochioce';
  @override
  State<Tempochoice> createState() => _TempochoiceState();
}

class _TempochoiceState extends State<Tempochoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(),
        title: Text(
          AppLocalizations.of(context)!.tempotitle,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.tempo_text_button,
            ),
          ),
        ],
      ),
    );
  }
}
