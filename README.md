### 介绍
有的Mac应用需要存储用户的密码,存于数据库中不够安全,Mac自带了管理密码的工具:Keychain .
你可以在Keychain Access的Passwords 这一分类中看到系统中各个程序所保存的密码.
这个类的目的就是方便你的应用存取以及删除keychain的密码.

### 使用
1. 将代码加入到你的项目,你可以修改成自己的类名,设置好自己的serviceName
2. 使用代码

     `LKeychainUtilities setPassword:@"pass" WithUserId:@"Luke"];`

     `NSString *password = [LKeychainUtilities passwordWithUserId:@"Luke"];`

     `[LKeychainUtilities removePasswordWithUserId:@"Luke"];`


