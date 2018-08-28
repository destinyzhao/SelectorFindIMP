//
//  ViewController.m
//  SelectorFindIMP
//
//  Created by Destiny on 2018/8/28.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "TestSelector.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestSelector *testSel = [[TestSelector alloc]init];
    [testSel getIMPInstanceMethod];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
