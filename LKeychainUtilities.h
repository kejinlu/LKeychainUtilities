//
//  LKeychainUtilities.h
//  LKeychainUtilities
//
//  Created by Luke on 6/17/11.
//  Copyright 2011 Taobao.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface LKeychainUtilities : NSObject {

}

+ (NSString*)passwordWithUserId:(NSString*)userId;
+ (BOOL)setPassword:(NSString *)newPassword WithUserId:(NSString*)userId;
+ (BOOL)removePasswordWithUserId:(NSString*)userId;

@end
