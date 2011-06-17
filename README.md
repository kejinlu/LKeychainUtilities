### 介绍
我们的应用有时候需要存储用户的账号密码,存放在数据库中有时候不够安全,Mac为我们提供了专门用来存放密码的地方:Keychain .
你可以在Keychain Access 这个工具的Passwords 这一分类中看到系统中各个程序所保存的密码.
这个工具类的目的就是方便你存取以及删除keychain中的应用的密码.

### 使用
1. 将代码加入到你的项目,你可以修改成自己的类名,设置好自己的serviceName
2. 使用代码
    '
    LKeychainUtilities setPassword:@"pass" WithUserId:@"Luke"];
    NSString *password = [LKeychainUtilities passwordWithUserId:@"Luke"];
    [LKeychainUtilities removePasswordWithUserId:@"Luke"];
    '


