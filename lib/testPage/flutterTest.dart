// aysnc/await 消除回调地狱
task() async {
  try {
    String id = await login("Bob", "123");
    String userInfo = await getUserInfo(id);
    await saveUserInfo(userInfo);
  } catch (e) {
    print("回调出错===$e");
  }
}

Future<dynamic> login(String userName, String id) {
  return Future<dynamic>(() {
    return "用户登录======$userName";
  });
}

getUserInfo(String id) {
  return "获取用户信息===$id";
}

saveUserInfo(String userInfo) {
  return "保存用户信息====$userInfo";
}
