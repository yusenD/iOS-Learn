//
//  UIViewController+Swizzling.m
//  fish
//
//  Created by yuhao on 2019/6/17.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <Toast.h>
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        Class class = [self class];
        SEL originalSelector = @selector(viewDidAppear:);
        SEL swizzlingSelector = @selector(swizzling_viewDidAppear:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzlingMethod = class_getInstanceMethod(class, swizzlingSelector);
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
        if(didAddMethod){
            class_replaceMethod(class, swizzlingSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        }
        
    });
    
}
#pragma mark - Method Swizzling
- (void)swizzling_viewDidAppear:(BOOL)animated{
    [self swizzling_viewDidAppear:animated];
    [self.view makeToast:[[self class] description]];
}

@end
