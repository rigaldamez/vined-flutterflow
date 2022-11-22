import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreenSampleWidget extends StatefulWidget {
  const ChatScreenSampleWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatScreenSampleWidgetState createState() => _ChatScreenSampleWidgetState();
}

class _ChatScreenSampleWidgetState extends State<ChatScreenSampleWidget> {
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).pinkLace,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Stack(
          children: [
            if (!isGroupChat())
              Text(
                widget.chatUser!.displayName!,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            if (isGroupChat())
              Text(
                'Group Chat',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.5,
      ),
      body: StreamBuilder<FFChatInfo>(
        stream: FFChatManager.instance.getChatInfo(
          otherUserRecord: widget.chatUser,
          chatReference: widget.chatRef,
        ),
        builder: (context, snapshot) => snapshot.hasData
            ? FFChatPage(
                chatInfo: snapshot.data!,
                allowImages: true,
                backgroundColor: FlutterFlowTheme.of(context).pinkLace,
                timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                currentUserBoxDecoration: BoxDecoration(
                  color: Color(0xB3000000),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).cultured,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                otherUsersBoxDecoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).cultured,
                  border: Border.all(
                    color: Color(0xB3000000),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                currentUserTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: FlutterFlowTheme.of(context).cultured,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                ),
                otherUsersTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: FlutterFlowTheme.of(context).black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                inputHintTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: Color(0xFF95A1AC),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                inputTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                emptyChatWidget: Image.asset(
                  'assets/images/messagesEmpty@2x.png',
                  width: MediaQuery.of(context).size.width * 0.76,
                ),
              )
            : Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).purplePastel,
                  ),
                ),
              ),
      ),
    );
  }
}
