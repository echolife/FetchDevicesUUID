//
//  DevicesUuid.h
//  UUID
//
//  Created by 王滔 on 15/9/19.
//  Copyright © 2015年 王滔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DevicesUuid : NSObject

+ (void)addDevicesUuid:(NSString *)devicesId;
+ (void)removeDevicesUuid;
+ (NSString *)fetchDevicesUuid;


@end
