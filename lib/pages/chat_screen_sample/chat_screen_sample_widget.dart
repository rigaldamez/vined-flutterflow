import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_screen_sample_model.dart';
export 'chat_screen_sample_model.dart';

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
  late ChatScreenSampleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatScreenSampleModel());

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
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).pinkLace,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Stack(
          children: [
            if (!isGroupChat())
              Text(
                widget.chatUser!.displayName,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            if (isGroupChat())
              Text(
                'Group Chat',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                      fontSize: 16.0,
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
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                otherUsersBoxDecoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).cultured,
                  border: Border.all(
                    color: Color(0xB3000000),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(24.0),
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                currentUserTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: FlutterFlowTheme.of(context).cultured,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                ),
                otherUsersTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: FlutterFlowTheme.of(context).black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
                inputHintTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: Color(0xFF95A1AC),
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                ),
                inputTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                ),
                emptyChatWidget: Image.asset(
                  'assets/images/messagesEmpty@2x.png',
                  width: MediaQuery.sizeOf(context).width * 0.76,
                ),
              )
            : Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    color: Color(0xFFB19CD9),
                  ),
                ),
              ),
      ),
    );
  }
}
