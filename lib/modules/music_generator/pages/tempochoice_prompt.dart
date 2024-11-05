import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PromptSong extends StatefulWidget {
  const PromptSong({super.key});

  @override
  State<PromptSong> createState() => _PromptSongState();
}

class _PromptSongState extends State<PromptSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(AppLocalizations.of(context)!
            .tempochoice_promptsong_page_appbar_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
