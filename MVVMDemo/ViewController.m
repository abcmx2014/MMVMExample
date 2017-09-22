//
//  ViewController.m
//  MVVMDemo
//
//  Created by lbxia on 2017/3/21.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import "ViewController.h"
#import "ExampleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




- (IBAction)next:(id)sender {
    
    ExampleViewController *vc = [[ExampleViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
