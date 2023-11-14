import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'signup_email_model.dart';
export 'signup_email_model.dart';

class SignupEmailWidget extends StatefulWidget {
  const SignupEmailWidget({Key? key}) : super(key: key);

  @override
  _SignupEmailWidgetState createState() => _SignupEmailWidgetState();
}

class _SignupEmailWidgetState extends State<SignupEmailWidget> {
  late SignupEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupEmailModel());

    _model.emailTextFieldController ??= TextEditingController();
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.passwordTextField1Controller ??= TextEditingController();
    _model.passwordTextField1FocusNode ??= FocusNode();

    _model.passwordTextField2Controller ??= TextEditingController();
    _model.passwordTextField2FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://res.cloudinary.com/rigcloudinary/image/upload/v1636886584/CellarDweller/Walkthrough%20screens/IMG_9166_oped_xyesi3.jpg',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 220.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(34.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: TextFormField(
                          controller: _model.emailTextFieldController,
                          focusNode: _model.emailTextFieldFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            filled: true,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailTextFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(34.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: TextFormField(
                          controller: _model.passwordTextField1Controller,
                          focusNode: _model.passwordTextField1FocusNode,
                          obscureText: !_model.passwordTextField1Visibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            filled: true,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordTextField1Visibility =
                                    !_model.passwordTextField1Visibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordTextField1Visibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22.0,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          textAlign: TextAlign.start,
                          validator: _model
                              .passwordTextField1ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(34.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: TextFormField(
                          controller: _model.passwordTextField2Controller,
                          focusNode: _model.passwordTextField2FocusNode,
                          obscureText: !_model.passwordTextField2Visibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(34.0),
                            ),
                            filled: true,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordTextField2Visibility =
                                    !_model.passwordTextField2Visibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordTextField2Visibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22.0,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          textAlign: TextAlign.start,
                          validator: _model
                              .passwordTextField2ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            if (_model.passwordTextField1Controller.text !=
                                _model.passwordTextField2Controller.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Passwords don\'t match!',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user =
                                await authManager.createAccountWithEmail(
                              context,
                              _model.emailTextFieldController.text,
                              _model.passwordTextField1Controller.text,
                            );
                            if (user == null) {
                              return;
                            }

                            context.goNamedAuth('Discover', context.mounted);
                          },
                          text: 'Sign up',
                          options: FFButtonOptions(
                            width: 310.0,
                            height: 54.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF4F4F4),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(34.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
