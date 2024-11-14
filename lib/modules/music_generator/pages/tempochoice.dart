import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tempo/modules/music_generator/components/selected_card.dart';
import 'package:tempo/modules/music_generator/pages/tempochoice_prompt.dart';
import 'package:tempo/utils/constants.dart';
import 'package:tempo/utils/helper_widgets.dart';
import 'tempochoice_singlesong.dart';

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
          AppLocalizations.of(context)!.tempochoice_page_appbar_title,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.tempochoice_page_appbar_text_button,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: appPadding),
              child: Center(
                child: headlineMediumText(
                  context: context,
                  text: AppLocalizations.of(context)!.tempochoice_page_text,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            cardSelected(
              title: AppLocalizations.of(context)!.tempochoice_page_card1_title,
              subtitle:
                  AppLocalizations.of(context)!.tempochoice_page_card1_subtitle,
              image: 'assets/images/casque1.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SingleSong();
                    },
                  ),
                );
              },
            ),
            cardSelected(
              title: AppLocalizations.of(context)!.tempochoice_page_card2_title,
              subtitle:
                  AppLocalizations.of(context)!.tempochoice_page_card2_subtitle,
              image: 'assets/images/lyrics.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PromptSong();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
