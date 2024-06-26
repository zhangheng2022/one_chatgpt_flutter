import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:one_chatgpt_flutter/common/log.dart';
import 'package:one_chatgpt_flutter/ui/auth/widgets/email_login.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final supabase = Supabase.instance.client;

  Future<void> _githubLogin() async {
    try {
      Log.d('message');
      await supabase.auth.signInWithOAuth(OAuthProvider.github,
          redirectTo: 'onechat://onechatgpt/');
    } catch (e) {
      Log.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://api.miaomc.cn/image/other/bing", // 您的图片URL
                  height:
                      MediaQuery.of(context).size.height * 0.5, // 可选，根据需要调整高度
                  fit: BoxFit.cover, // 保持图片的宽高比
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/logos/logo.gif", // The path to your local image
                              height:
                                  70, // Optional, adjust the height as needed
                              fit: BoxFit
                                  .cover, // Maintain the aspect ratio of the image
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "你好，世界",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.oswald().fontFamily,
                                    ),
                                  ),
                                  Text(
                                    "OneChatGPT",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: FilledButton.icon(
                                icon: Image.asset(
                                  'assets/icons/google.png',
                                  width: 20,
                                  height: 20,
                                ),
                                label: const Text("Google登录"),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: "正在开发中...",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton.icon(
                                icon: Image.asset(
                                  'assets/icons/github.png',
                                  width: 20,
                                  height: 20,
                                ),
                                label: const Text("Github登录"),
                                onPressed: () {
                                  _githubLogin();
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                _showLoginSheet(context);
                              },
                              child: Text(
                                "邮箱登录",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "没有账号？",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.goNamed('register');
                              },
                              child: const Text(
                                "去注册",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _showLoginSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 这里是关键设置
      builder: (BuildContext context) {
        // 为了进一步改善体验，你可以包裹内容在 SingleChildScrollView 中，并且使用 Padding 包裹 SingleChildScrollView，设置其底部内边距为 MediaQuery.of(context).viewInsets.bottom，这样可以确保内容不会被键盘遮挡。
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 使内容大小适应
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/logos/logo.gif", // The path to your local image
                        height: 40, // Optional, adjust the height as needed
                        fit: BoxFit
                            .cover, // Maintain the aspect ratio of the image
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '邮箱登录',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const LoginEmail(), // 你的登录表单
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
