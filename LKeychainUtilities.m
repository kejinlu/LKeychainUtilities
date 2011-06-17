//
//  LKeychainUtilities.m
//  LKeychainUtilities
//
//  Created by Luke on 6/17/11.
//  Copyright 2011 Taobao.com. All rights reserved.
//

#import "LKeychainUtilities.h"

static const char *serviceName = "YourServiceName";

@implementation LKeychainUtilities

+ (NSString*)passwordWithUserId:(NSString*)userId{
	const char* cUserId = [userId cStringUsingEncoding:NSUTF8StringEncoding];
	const char* cPassword;
	UInt32 length = 0;
	OSStatus error = SecKeychainFindGenericPassword(NULL,
													strlen(serviceName), 
													serviceName, 
													strlen(cUserId), 
													cUserId,
													&length, 
													(void**)&cPassword, 
													NULL);
	if (error != noErr) {
		//如果出错,打出log,返回空字符串
		NSLog (@"SecKeychainFindGenericPassword () For User:%@ error: %d",userId, error);
		return @"";
	}
	
	NSString *passwordString = [[[NSString alloc] initWithBytes:cPassword 
												 length:length 
											   encoding:NSUTF8StringEncoding] autorelease];
	return passwordString;
	
}

+ (BOOL)setPassword:(NSString *)newPassword WithUserId:(NSString*)userId{
	if (![LKeychainUtilities removePasswordWithUserId:userId]) {
		return NO;
	}
	
	const char* cUserId = [userId cStringUsingEncoding:NSUTF8StringEncoding];
	const char* cPassword = [newPassword cStringUsingEncoding:NSUTF8StringEncoding];
	OSStatus error = SecKeychainAddGenericPassword(nil,
												   strlen(serviceName),
												   serviceName, 
												   strlen(cUserId),
												   cUserId,
												   strlen(cPassword), 
												   cPassword,
												   nil);
	if (error == noErr) {
		return YES;
	}else {
		NSLog(@"SecKeychainAddGenericPassword() error:%d",error);
		return NO;
	}
}

+ (BOOL)removePasswordWithUserId:(NSString*)userId{
	const char* cUserId=[userId cStringUsingEncoding:NSUTF8StringEncoding];
	SecKeychainItemRef keychainItemRef;
	OSStatus error=SecKeychainFindGenericPassword(nil,
												  strlen(serviceName),
												  serviceName, 
												  strlen(cUserId),
												  cUserId, 
												  nil, nil, &keychainItemRef);
	if (error == noErr) {
		error = SecKeychainItemDelete(keychainItemRef);
		if (error == noErr) {
			return YES;
		}else {
			NSLog(@"SecKeychainItemDelete() Error:%d",error);
			return NO;
		}
	}else if (error == errSecItemNotFound) {
		//如果当前的userId不存在就不用删除了,返回YES,说明一切正常
		return YES;
	}else{
		return NO;
		NSLog(@"SecKeychainFindGenericPassword() Error:%d when remove password",error);
		return NO;
	}
}


@end
