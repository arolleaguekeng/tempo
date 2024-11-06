import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tempo/modules/music_generator/components/dropDown_card.dart';
import 'package:tempo/utils/constants.dart';
import 'package:tempo/utils/responsive.dart';

class PromptSong extends StatefulWidget {
  const PromptSong({super.key});

  @override
  State<PromptSong> createState() => _PromptSongState();
}

class _PromptSongState extends State<PromptSong> {
  SpeechToText speech = SpeechToText();
  var isListening = false;

  final items = ['Item1', 'Item2', 'Item3'];
  String? value;

  var titleController = TextEditingController();
  var speechController = TextEditingController();

  void checkPrompt() async {
    bool available = await speech.initialize(
      onStatus: (status) => print('onStatus: $status'),
      onError: (errorNotification) => print('onError: $errorNotification'),
    );
    if (available) {
      print('MicroPhone  is available');
    } else {
      print("User Denied th use of speech micro");
    }
  }

  @override
  void initState() {
    super.initState();
    checkPrompt();
  }

  @override
  Widget build(BuildContext context) {
    Size mysize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(AppLocalizations.of(context)!
            .tempochoice_promptsong_page_appbar_title),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: appPadding),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    mysize.width / 1.5,
                    mysize.height / 13,
                  ),
                ),
                child: Text(AppLocalizations.of(context)!
                    .tempochoice_singlesong_page_button_text),
                onPressed: () {},
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: appPadding),
                    height: 60.0,
                    width: Responsive.isMobile(context)
                        ? mysize.width
                        : mysize.width / 3,
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(
                          color: textColor,
                          width: 0.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .tempochoice_singlesong_page_textfield_error;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: white,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(appPadding),
                        hintText: AppLocalizations.of(context)!
                            .tempochoice_singlesong_page_textfield_hint,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          fontSize: 14.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: appPadding, vertical: appPadding),
                    width: Responsive.isMobile(context)
                        ? mysize.width
                        : mysize.width / 3,
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(
                          color: textColor,
                          width: 0.5,
                        ),
                        left: BorderSide(
                          color: textColor,
                          width: 0.5,
                        ),
                        right: BorderSide(
                          color: textColor,
                          width: 0.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: 5,
                          controller: speechController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .tempochoice_promptsong_page_textfield1_hint;
                            }
                            return null;
                          },
                          //style: ,
                          decoration: InputDecoration(
                            fillColor: white,
                            contentPadding: const EdgeInsets.all(appPadding),
                            hintText: AppLocalizations.of(context)!
                                .tempochoice_promptsong_page_textfield2_hint,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: textColor,
                              fontSize: 14.0,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(appPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              // Icône de microphone
                              GestureDetector(
                                onTap: () async {
                                  if (!isListening) {
                                    bool micAvailable =
                                        await speech.initialize();

                                    if (micAvailable) {
                                      setState(() {
                                        isListening = true;
                                      });
                                      speech.listen(
                                        listenFor: const Duration(seconds: 30),
                                        onResult: (result) {
                                          setState(() {
                                            speechController.text =
                                                result.recognizedWords;
                                            // isListening = false;
                                          });
                                        },
                                      );
                                    }
                                  } else {
                                    setState(() {
                                      isListening = false;

                                      speech.stop();
                                    });
                                  }
                                },
                                child: AvatarGlow(
                                  animate: isListening,
                                  glowColor: primaryColor,
                                  glowShape: BoxShape.circle,
                                  curve: Curves.fastOutSlowIn,
                                  child: isListening
                                      ? const Icon(Icons.record_voice_over,
                                          color: white)
                                      : const Icon(
                                          Icons.mic,
                                          color: white,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: appPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .tempochoice_promptsong_page_text,
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        // Icône d'étoile
                        const Icon(
                          Icons.star,
                          color: primaryColor,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: appPadding),
                    padding: const EdgeInsets.all(appPadding),
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(
                          color: textColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: Responsive.isMobile(context)
                        ? mysize.width
                        : mysize.width / 3,
                    child: DropdownButton(
                      value: value,
                      iconSize: 24,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      style: const TextStyle(
                        color: textColor,
                      ),
                      hint: Text(
                        AppLocalizations.of(context)!
                            .tempochoice_singlesong_page_dropdown_hint,
                        style: const TextStyle(
                          color: textLightColor,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
