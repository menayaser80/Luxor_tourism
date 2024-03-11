
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/imagebutton.dart';
import 'package:vixor_project/componenet/link_text.dart';
import 'package:vixor_project/componenet/padge.dart';
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/const/functions.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/bottom_nav_bar.dart';
import 'package:vixor_project/screens/auth/forget%20password.dart';
import 'package:vixor_project/screens/auth/sign_up_screen.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  @override
  void initState() {
    super.initState();
  }

  Future<User?> _googleSignUp(context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      return user;
    } catch (e) {
      print(e.toString());
    }
  }
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  void dispose() {
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }
  bool _isLoading = false;
  void submitFormOnLogin() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.signInWithEmailAndPassword(
            email:emailTextController.text.toLowerCase().trim() ,
            password:passTextController.text.trim());
        navigateTo(context, CustomBottomNavBar());
        print('succesfully logged in');
      }
      on FirebaseException catch(error)
      {
        errorDialog(
          subtitle:'${error.message}' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      } catch(error)
      {
        errorDialog(
          subtitle:'$error' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      }finally{
        setState(() {
          _isLoading=false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padge(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomTextWidget(
                  text: 'Log in',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                           "2".tr,style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        )),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete:()=>FocusScope.of(context).requestFocus(passFocusNode),
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Please enter a valid email address';
                        }else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Email Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 3, color: AppColors.brown),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(6),
                        child: CustomTextWidget(
                          text: 'Password',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      onEditingComplete:(){
                        submitFormOnLogin();
                      },
                      controller: passTextController,
                      focusNode: passFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureText,
                      validator: (value){
                        if(value!.isEmpty || value.length<7){
                          return 'Please enter a valid Password';
                        }else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Your Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 3, color: AppColors.brown),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          },
                          child: Icon(
                            obscureText?
                            Icons.visibility:Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: LinkText(
                    text: 'Forgot password?',
                    onPressed: () {
                      navigateTo(context,ForgetPasswordScreen());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
             GestureDetector(
               child:  Button(
                  text: "Login",
                  color: AppColors.primaryColor,
                  onPressed: () {
                    submitFormOnLogin();
                  }),
             ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: CustomTextWidget(
                      text: "Or Login with",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 95),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ImageButton(
                        imagePath: Assets.imagesFacebook,
                        onPressed: () {
                          signInWithFacebook();
                        },
                        width: 150,
                        height: 50,
                        borderRadius: 15,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                    const Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 5,
                        )),
                    Expanded(
                      flex: 1,
                      child: ImageButton(
                        imagePath: Assets.imagesGmailLogo,
                        onPressed: ()async {
                          await  _googleSignUp(context).then((value) {
                            navigateTo(context,CustomBottomNavBar());
                          });
                        },
                        width: 150,
                        height: 50,
                        borderRadius: 15,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextWidget(
                      text: "Don’t have an account ? ",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    LinkText(
                      text: ' Sign up ',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
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
