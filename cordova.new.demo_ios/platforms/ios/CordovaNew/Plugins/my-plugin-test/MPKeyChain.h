//
//  MPKeyChain.h
//  MobilePortal
//
//  Created by YYLittleCat on 2018/6/5.
//  Copyright © 2018年 YYLittleCat. All rights reserved.
//

#import <Cordova/CDV.h>

@interface MPKeyChain : CDVPlugin

- (void)getValueForKey:(CDVInvokedUrlCommand *)command;

@end
