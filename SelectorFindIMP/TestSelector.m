//
//  TestSelector.m
//  SelectorFindIMP
//
//  Created by Destiny on 2018/8/28.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "TestSelector.h"
#import <objc/runtime.h>

@implementation TestSelector


- (void)getIMPClassMethod
{
    [self getIMP_class_getMethodImplementationFromSelector:@selector(instanceMethod)];
    [self getIMP_class_getMethodImplementationFromSelector:@selector(classMethod)];
}

- (void)getIMPInstanceMethod
{
    [self getIMP_method_getImplementationFromSelector:@selector(instanceMethod)];
    [self getIMP_method_getImplementationFromSelector:@selector(classMethod)];
}

- (void)instanceMethod{
}

+ (void)classMethod{

}

- (void)getIMP_class_getMethodImplementationFromSelector:(SEL)aSelector{
    
    const char *className = object_getClassName([self class]);
    // 获取实例的IMP
    IMP instanceIMP = class_getMethodImplementation(objc_getClass(className), aSelector);
    // 获取类的IMP
    IMP classIMP = class_getMethodImplementation(objc_getMetaClass(className), aSelector);
    
    NSLog(@"instanceIMP:%p classIMP:%p",instanceIMP,classIMP);
}

- (void)getIMP_method_getImplementationFromSelector:(SEL)aSelector{
    
    const char *className = object_getClassName([self class]);
    // 获取类中的某个实例方法
    Method instanceMethod = class_getInstanceMethod(objc_getClass(className), aSelector);
    // 获取类中的某个类方法
    Method classMethod = class_getClassMethod(objc_getClass(className), aSelector);
    
    // 获取实例的IMP
    IMP instanceIMP = method_getImplementation(instanceMethod);
    // 获取类的IMP
    IMP classIMP = method_getImplementation(classMethod);
    
    NSLog(@"instanceIMP:%p classIMP:%p",instanceIMP,classIMP);
}

@end
