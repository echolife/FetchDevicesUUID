//
//  ViewController.m
//  UUID
//
//  Created by 王滔 on 15/9/19.
//  Copyright © 2015年 王滔. All rights reserved.
//

#import "ViewController.h"
#import "DevicesUuid.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /* Do any additional setup after loading the view, typically from a nib.
     iphone5
    5FA3EC1B-E953-4AC9-9EF3-A4F60A5BA9B9  // 第一次
    5FA3EC1B-E953-4AC9-9EF3-A4F60A5BA9B9  // 卸载后
     iphone6s 
     B070B5D4-607E-4C18-8E51-2CC4A53EC9F1 // 第一次
     B070B5D4-607E-4C18-8E51-2CC4A53EC9F1 // 卸载后

    */
    
    NSLog(@"uuid ==>%@",[DevicesUuid fetchDevicesUuid]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
