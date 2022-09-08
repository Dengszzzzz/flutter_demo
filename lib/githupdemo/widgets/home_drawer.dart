import 'package:flutter/material.dart';
import 'package:flutter_demo/githupdemo/common/user_model.dart';
import 'package:flutter_demo/githupdemo/common/utils/avatar_util.dart';
import 'package:flutter_demo/l10n/localization_intl.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _builderHeader(), //构建抽屉菜单头部
            Expanded(child: _buildMenus()), //构建功能菜单
          ],
        ),
        removeTop: true,
      ),
    );
  }

  Widget _builderHeader() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel value, Widget? child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    child: value.isLogin
                        ? gmAvatar(value.user!.avatar_url, width: 80)
                    ///BoxFit.cover 会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被裁剪。
                    ///BoxFit.contain  默认适应规则，保证图片本身 “ 长宽比 ” 不变情况下，缩放以适应当前显示空间，图片不会变形。
                        : Image.asset("images/ic_img_avatar.png",width: 50,height:50,fit: BoxFit.cover,),
                  ),
                ),
                Text(
                  value.isLogin
                      ? value.user!.login
                      : GmLocalizations.of(context)!.login,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) {
              Navigator.of(context).pushNamed("login");
            }
          },
        );
      },
    );
  }

  //构建菜单项
  Widget _buildMenus() {
    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel userModel, Widget? child) {
      var gm = GmLocalizations.of(context)!;
      return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: Text(gm.theme),
            onTap: () => Navigator.pushNamed(context, "themes"),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(gm.language),
            onTap: () => Navigator.pushNamed(context, "language"),
          ),
          if (userModel.isLogin)
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text(gm.logout),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    //退出账号前先弹二次确认窗
                    return AlertDialog(
                      content: Text(gm.logoutTip),
                      actions: <Widget>[
                        TextButton(
                          child: Text(gm.cancel),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text(gm.yes),
                          onPressed: () {
                            //该赋值语句会触发MaterialApp rebuild
                            userModel.user = null;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
        ],
      );
    });
  }
}
