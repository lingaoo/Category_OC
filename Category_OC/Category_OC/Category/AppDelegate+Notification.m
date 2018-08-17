//
//  AppDelegate+Notification.m
//  NSNotificationDemo
//
//  Created by teamotto on 2018/8/15.
//  Copyright © 2018年 teamotto. All rights reserved.
//

#import "AppDelegate+Notification.h"

@implementation AppDelegate (Notification)

static BOOL kHIDDEN_NOTIFICATION_LOG = YES;

#pragma mark- 注册通知
-(void)addNotification {
    UIMutableUserNotificationCategory *category = [AppDelegate notificationActionFormTest];
    
    NSSet *categorySet = [NSSet setWithObject:category];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:categorySet];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];// 注册通知
}

/// 添加 NotificationAction 注意在注册通知前调用
+(UIMutableUserNotificationCategory *)notificationActionFormTest {
    // 创建分类，注意使用可变子类
    // 设置标识符，注意与发送通知设置的category标识符一致~！
    // 注册，请求授权的时候将分类设置给授权，注意是 NSSet 集合
    UIMutableUserNotificationCategory *category = [UIMutableUserNotificationCategory new];

    category.identifier = @"category";
    
    // 设置按钮，注意使用可变子类UIMutableUserNotificationAction
    UIMutableUserNotificationAction *action1 = [UIMutableUserNotificationAction new];
    action1.identifier = @"qiantai";
    //UIUserNotificationActivationModeForeground 点击后打开app前台
    //UIUserNotificationActivationModeBackground 点击后保持后台
    action1.activationMode = UIUserNotificationActivationModeForeground;
    /// 动作是否安全并且在执行之前需要解锁
    action1.authenticationRequired = true;
    /// 红字，重点提示按钮
    action1.destructive = true;
    if (@available(iOS 9.0, *)) {
        // 输入内容
        action1.behavior = UIUserNotificationActionBehaviorTextInput;
        action1.parameters = @{UIUserNotificationTextInputActionButtonTitleKey: @"拒绝原因",UIUserNotificationActionResponseTypedTextKey:@"kdkfd"};
        //UIUserNotificationActionResponseTypedTextKey 代理方法内的info key
    }
    action1.title = @"呵呵";
    
    // 设置后台按钮，点击后程序还在后台执行，如QQ的消息
    UIMutableUserNotificationAction *action2 = [UIMutableUserNotificationAction new];
    action2.identifier = @"houtai";
    action2.activationMode = UIUserNotificationActivationModeBackground;
    // 设置按钮的标题，即按钮显示的文字
    action2.title = @"后台呵呵";
    
    // 设置后台按钮，点击后程序还在后台执行，如QQ的消息
    UIMutableUserNotificationAction *action3 = [UIMutableUserNotificationAction new];
    action3.identifier = @"houtai3";
    action3.activationMode = UIUserNotificationActivationModeBackground;
    // 设置按钮的标题，即按钮显示的文字
    action3.title = @"后台呵呵3";
    
    // 给分类设置按钮
    [category setActions:@[action2,action3,action1] forContext:UIUserNotificationActionContextDefault];

    return category;
}

/// 成功注册
-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    //成功注册registerUserNotificationSettings:后，回调的方法
    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"成功注册");
    
    //  推送json格式
    //    {
    //        "aps" : {
    //            "alert" : {
    //                "title" : "iOS远程消息，我是主标题！-title",
    //                "subtitle" : "iOS远程消息，我是副标题！-Subtitle",
    //                "body" : "iOS远程消息，我是主体内容！-body"
    //            },
    //            "category" : "locationCategory",
    //            "badge" : "2"
    //        }
    //    }
    
}

#pragma mark- 本地推送消息
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    // 前台状态 收到本地推送消息后调用的方法
    // 后台状态 点击了本地推送消息后调用的方法
    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"本地推送消息: %@",notification);
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(nonnull UILocalNotification *)notification withResponseInfo:(nonnull NSDictionary *)responseInfo completionHandler:(nonnull void (^)(void))completionHandler {
    
    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"%@---%@",identifier,notification);
    
    completionHandler();
}



#pragma mark- 远程推送消息
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //向APNS注册成功，收到返回的deviceToken
    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"向APNS注册成功");
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //向APNS注册失败，返回错误信息error
    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"向APNS注册失败");
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //收到远程推送通知消息
    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"收到远程推送通知消息 : %@",userInfo);
    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)(void))completionHandler{

    kHIDDEN_NOTIFICATION_LOG?:NSLog(@"%@---%@",identifier,userInfo);
    completionHandler();
}

#pragma mark- Response TextInput

-(void)notificationActionTextInputWithIdentifier:(nullable NSString *)identifier withResponseInfo:(NSDictionary *)responseInfo {
    NSString *response = responseInfo[UIUserNotificationActionResponseTypedTextKey];
    NSLog(@"%@",response);
    
    
}

@end
