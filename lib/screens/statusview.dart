import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Statusview extends StatelessWidget {
   Statusview({Key? key}) : super(key: key);


  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    List<StoryItem> stories =  [
      StoryItem.text(
        title: "fdfssf",
        backgroundColor: Colors.amberAccent
      ),
      StoryItem.text(
          title: "fdfssf",
          backgroundColor: Colors.redAccent
      ),
      StoryItem.text(
          title: "fdfssf",
          backgroundColor: Colors.cyanAccent
      ),
      StoryItem.text(
          title: "fdfssf",
          backgroundColor: Colors.deepPurple
      ),
      StoryItem.text(
          title: "fdfssf",
          backgroundColor: Colors.teal
      ),



    ];
    return StoryView(
        storyItems: stories,
        controller: controller, // pass controller here too
        repeat: false, // should the stories be slid forever
        //onStoryShow: (s) {notifyServer(s)},
        onComplete: () {
          Navigator.pop(context);
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        } // To disable vertical swipe gestures, ignore this parameter.
      // Preferrably for inline story view.
    );
  }
}
