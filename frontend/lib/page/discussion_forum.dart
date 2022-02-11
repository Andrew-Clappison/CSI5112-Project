import 'package:avatars/avatars.dart';
import 'package:csi5112_frontend/dataModel/question.dart';
import 'package:csi5112_frontend/page/answer_page.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/theme_data.dart';

class DiscussionForum extends StatefulWidget {
  const DiscussionForum({Key? key}) : super(key: key);

  @override
  State<DiscussionForum> createState() => _DiscussionForumState();
}

class _DiscussionForumState extends State<DiscussionForum> {
  List<Question> questions = Question.getFakeQuestionData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgrounColor,
        body: ListView.builder(
            itemCount: questions.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search here...',
                  ),
                );
              }
              index -= 1;
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AnswerPage(questions[index].id)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                    child: Card(
                        child: GFListTile(
                      title: Text(questions[index].title,
                          style: CustomText.textTitle),
                      subTitle: Text(questions[index].description,
                          style: CustomText.textDescription),
                      avatar: Avatar(
                          name: questions[index].user,
                          shape: AvatarShape.circle(16)),
                      icon: Container(
                        height: 30,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: CustomColors.accentColors,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.message,
                              size: 14,
                              color: Colors.white,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 18, left: 0)),
                            Text(" " + questions[index].replies.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                    )),
                  ));
            }));
  }
}
