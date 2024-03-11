import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vixor_project/componenet/widgets/text_widget.dart';
import 'package:vixor_project/const/firebase%20constants.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/cubit/bloc.dart';
import 'package:vixor_project/cubit/states.dart';
import 'package:vixor_project/provider/theme_provider.dart';
import 'package:vixor_project/screens/auth/forget%20password.dart';
import 'package:vixor_project/screens/auth/login_screen.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/CustomListTile.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/Trip/Trip_Screen.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/viewed_recently.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/wishlist.dart';
import 'package:vixor_project/screens/profile_screen/Edit%20profile.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';
class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final User? user=authInstance.currentUser;
  @override
  Widget build(BuildContext context) {
    final themeState=Provider.of<ThemeProvider>(context);
    final Color color=themeState.getDarkTheme?Colors.white:Colors.black;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var usermodel=NewsCubit.get(context).usermodel;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:usermodel!=null? Column(
              children: [
                Container(
                  height: 190.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
          
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: NetworkImage('${usermodel.image}'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${usermodel.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '${usermodel.bio}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  '${usermodel.shopping_address}',
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
          
                ),
                Text(
                  '${usermodel.phone}',
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   child: Container(
                      //     height: 40.0,
                      //     width: double.infinity,
                      //     color: Colors.white,
                      //     child: OutlinedButton(
                      //       onPressed: ()async{
                      //         await launchUrl(Uri.parse("tel:+201125301312"));
                      //       },
                      //       child:Row(
                      //         children: [
                      //           Icon(Icons.phone_callback_outlined,color: Colors.blue,),
                      //           SizedBox(width: 5,),
                      //           Text("Contact us",style: TextStyle(
                      //             color: Colors.blue,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 14.0,
                      //           ),),
                      //         ],
                      //
                      //       ),
                      //     ),
                      //
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 10.0,
                      // ),
                      Container(
                                         height: 35,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                       border: Border.all(
                         color: Colors.black,
                         width: 1
                       )
                        ),
                        child:InkWell(
                          onTap: (){
                            navigateTo(context, EditProfile());
                            },
                          child: Center(
                            child: Text(
                            'Edit Profile',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                            ),
                          ),
                        ),
          
                      ),
                    ],
                  ),
                ),
                SwitchListTile(
                  title:Textwidget(
                    text:themeState.getDarkTheme?'DarkMode':'LightMode',
                    color: color,
                    textsize: 18.0,
                  ),
                  secondary: Icon(
                      themeState.getDarkTheme?Icons.dark_mode_outlined
                          :Icons.light_mode_outlined),
                  value:themeState.getDarkTheme ,
                  onChanged: (bool value){
                    setState(() {
                      themeState.setDarkTheme=value;
                    });
                  },
                ),
                CustomListTile(
                  text: "Wishlist",
                  imagePath: AssetsManager.wishlistSvg,
                  function: () {
                    Navigator.pushNamed(context, WishlistScreen.routName);
                  },
                ),
                CustomListTile(
                  text: "Viewed recently",
                  imagePath: AssetsManager.recent,
                  function: () {
                    Navigator.pushNamed(
                        context, ViewedRecentlyScreen.routName);
                  },
                ),

                listtile(
                    title:'Forget password',
                    icon:IconlyLight.unlock,
                    color: color,
                    onpressed: (){
                      navigateTo(context, ForgetPasswordScreen());
                    }),
                listtile(
                    title:user==null?'Login':'LogOut',
                    icon:user==null?IconlyLight.login:IconlyLight.logout,
                    color: color,
                    onpressed: (){
                      if(user==null)
                      {
                        navigateTo(context, Login());
                        return;
                      }
                      warningDialog(title: 'Sign out', subtitle: 'Do you want sign out?', fct:()async{
                        await authInstance.signOut();
                        navigateTo(context, Login());
                      }, context: context);
                    }
                ),
              ],
            ):SizedBox(),
          ),
        );
      },
    );
  }
}