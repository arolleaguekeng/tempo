import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tempo/utils/constants.dart';
import 'package:tempo/utils/responsive.dart';

import '../components/dropDown_card.dart';

class SingleSong extends StatefulWidget {
  const SingleSong({super.key});

  @override
  State<SingleSong> createState() => _SingleSongState();
}

class _SingleSongState extends State<SingleSong> {
  bool _isGlowing = false;
  var titleController = TextEditingController();

  final items = ['Item1', 'Item2', 'Item3'];
  String? value;

  void _toggleGlow() {
    setState(() {
      _isGlowing = !_isGlowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mysize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(
          AppLocalizations.of(context)!
              .tempochoice_singlesong_page_appbar_title,
        ),
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
                  AvatarGlow(
                    animate: _isGlowing,
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: primaryColor,
                    glowShape: BoxShape.circle,
                    curve: Curves.fastOutSlowIn,
                    child: GestureDetector(
                      onTap: _toggleGlow,
                      child: Material(
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        color: primaryColor,
                        child: CircleAvatar(
                          radius: 50.0,
                          child: Image.asset(
                            'assets/images/micro2.png',
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: superLargePadding,
                      bottom: appPadding,
                      left: appPadding,
                      right: appPadding,
                    ),
                    height: 60.0,
                    width: Responsive.isMobile(context)
                        ? mysize.width
                        : mysize.width / 3,
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
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(appPadding),
                        hintText: AppLocalizations.of(context)!
                            .tempochoice_singlesong_page_textfield_hint,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          fontSize: 14.0,
                        ),
                      ),
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
                  Container(
                    margin: const EdgeInsets.only(left: appPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!
                                .tempochoice_singlesong_page_textbutton_title,
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
