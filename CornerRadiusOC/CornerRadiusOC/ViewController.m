//
//  ViewController.m
//  CornerRadiusOC
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CornerRadius.h"
#import "UIImageView+CornerRadius.m"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *logoView = [[UIView alloc]initWithFrame:CGRectMake(150, 150, 100, 150)];
    [self.view addSubview:logoView];
    
//    [logoView view_addCorner:6];
    [logoView view_addCorner:20.0 borderWidth:2 borderColor:[UIColor redColor] backgroundColor:[UIColor orangeColor]];
    
    
    UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 350, 150, 150)];
    logoImageView.image = [UIImage imageNamed:@"logo.jpeg"];
    [self.view addSubview:logoImageView];
    
    [logoImageView image_addCornerRadius:6];    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
