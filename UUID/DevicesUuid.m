//
//  DevicesUuid.m
//  UUID
//
//  Created by 王滔 on 15/9/19.
//  Copyright © 2015年 王滔. All rights reserved.
//

#import "DevicesUuid.h"
#import <Security/Security.h>

@implementation DevicesUuid

+ (void)addDevicesUuid:(NSString *)devicesId
{
    NSData *data = [devicesId dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        
        NSMutableDictionary *keychainDic = [NSMutableDictionary dictionaryWithCapacity:3];
        keychainDic[CFBridgingRelease(kSecClass)] = CFBridgingRelease(kSecClassGenericPassword);
        keychainDic[CFBridgingRelease(kSecAttrService)] = @"DeviceId";
        keychainDic[CFBridgingRelease(kSecValueData)] = data;
        SecItemDelete(CFBridgingRetain(keychainDic));
        SecItemAdd(CFBridgingRetain(keychainDic), nil);
    }
}

+ (NSString *)fetchDevicesUuid
{
    NSMutableDictionary *keychainDic = [NSMutableDictionary dictionaryWithCapacity:4];
    keychainDic[CFBridgingRelease(kSecClass)] = CFBridgingRelease(kSecClassGenericPassword);
    keychainDic[CFBridgingRelease(kSecAttrService)] = @"DeviceId";
    keychainDic[CFBridgingRelease(kSecReturnData)] = CFBridgingRelease(kCFBooleanTrue);
    keychainDic[CFBridgingRelease(kSecMatchLimit)] = CFBridgingRelease(kSecMatchLimitOne);

    CFDataRef dataRef = NULL;
    if (SecItemCopyMatching(CFBridgingRetain(keychainDic), (CFTypeRef *)&dataRef) == noErr) {
        return [[NSString alloc] initWithData:(NSData *)CFBridgingRelease(dataRef) encoding:NSUTF8StringEncoding];
        
    } else {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        NSString *deviceId = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        [self addDevicesUuid:deviceId];
        return deviceId;
        
    }
    return nil;
}

+ (void)removeDevicesUuid
{
    NSMutableDictionary *keychainDic = [NSMutableDictionary dictionaryWithCapacity:2];
    keychainDic[CFBridgingRelease(kSecClass)] = CFBridgingRelease(kSecClassGenericPassword);
    keychainDic[CFBridgingRelease(kSecAttrService)] = @"DeviceId";
    SecItemDelete(CFBridgingRetain(keychainDic));
}


@end
