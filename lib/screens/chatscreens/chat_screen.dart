import 'package:flutter/material.dart';
import 'package:videocall_test_3rdwheel/models/user.dart';
import 'package:videocall_test_3rdwheel/utils/universal_variables.dart';
import 'package:videocall_test_3rdwheel/widgets/appbar.dart';
import 'package:videocall_test_3rdwheel/widgets/custom_tile.dart';

class ChatScreen extends StatefulWidget {
  final User receiver;

  //Instantiate reciever in constructor
  ChatScreen({this.receiver});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  /*
  Stuff to handle chat input and output
   */
  TextEditingController textFieldController = TextEditingController();
  bool isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
      body: Column(
        children: <Widget>[
          //User messages
          Flexible(
            child: messageList(),
          ),

          //Chat typing
          chatControls(),
        ],
      ),
    );
  }

  Widget messageList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 6,
      itemBuilder: (context, index) {
        return chatMessageItem();
      },
    );
  }

  Widget chatMessageItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        alignment: Alignment.centerRight,
        child: senderLayout(),
      ),
    );
  }

  Widget senderLayout() {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
          //messages does not take more than 65% of screen width
          maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: UniversalVariables.senderColor,
        borderRadius: BorderRadius.only(
            topRight: messageRadius,
            topLeft: messageRadius,
            bottomLeft: messageRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Hello",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget receiverLayout() {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
          //messages does not take more than 65% of screen width
          maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: UniversalVariables.receiverColor,
        borderRadius: BorderRadius.only(
            topRight: messageRadius,
            bottomRight: messageRadius,
            bottomLeft: messageRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Hello",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget chatControls() {
    //Controls user writing
    setWritingTo(bool val) {
      setState(() {
        isWriting = val;
      });
    }

    addMediaModal(context) {
      showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: UniversalVariables.blackColor,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: <Widget>[
                    //Show close icon
                    FlatButton(
                      child: Icon(Icons.close),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Content & tools",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ModalTile(
                      title: "Media",
                      subtitle: "Share Photos & Videos",
                      icon: Icons.image,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => addMediaModal(context),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: UniversalVariables.fabGradient,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (val) {
                //Check if there is any input to write
                //Val must be greater than 0 and no empty whitespaces
                (val.length > 0 && val.trim() != "")
                    ? setWritingTo(true)
                    : setWritingTo(false);
              },
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: TextStyle(
                  color: UniversalVariables.greyColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(50.0),
                    ),
                    //Ensure that there is no border
                    borderSide: BorderSide.none),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                //Adding background color
                filled: true,
                fillColor: UniversalVariables.separatorColor,
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.insert_emoticon),
                ),
              ),
            ),
          ),
          isWriting
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.record_voice_over),
                ),
          isWriting ? Container() : Icon(Icons.camera_alt),
          /*
          Display send button. Should only show iff user is typing
           */
          isWriting
              ? Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    gradient: UniversalVariables.fabGradient,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 15,
                    ),
                    onPressed: () => {},
                  ))
              : Container(),
        ],
      ),
    );
  }

  /*
  Custom Appbar method
   */
  CustomAppBar customAppBar(context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(widget.receiver.name),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.video_call,
          ),
          //Create video call
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.info),
          //Create info about chat
          onPressed: () {},
        )
      ],
    );
  }
}

class ModalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ModalTile({
    @required this.title,
    @required this.subtitle,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: CustomTile(
        mini: false,
        leading: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((15)),
            color: UniversalVariables.receiverColor,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: UniversalVariables.greyColor,
            size: 38,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: UniversalVariables.greyColor,
            fontSize: 14,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
