//
//  RunViewController.m
//  yxtd
//
//  Created by qin on 2017/9/13.
//  Copyright © 2017年 qin. All rights reserved.
//

#import "RunViewController.h"

@interface RunViewController ()

@end

@implementation RunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //导航栏初始化及添加按钮
    [self setUpNavi];
    
    
   
}

//不显示状态栏
//-(BOOL)prefersStatusBarHidden{
//    
//    return YES;
//}

#pragma mark --导航栏初始化及添加按钮
-(void)setUpNavi{
    
    //导航栏标题设置
    self.title=@"跑卷";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    
    //设置导航栏左右两边按钮
    UIBarButtonItem*leftBarButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftButton)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    
    
    UIBarButtonItem*rightBarButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightButton)];
    self.navigationItem.rightBarButtonItem=rightBarButton;
    
}


-(void)leftButton{
    
    NSLog(@"左边按钮点击");
}

-(void)rightButton{
    
    NSLog(@"右边按钮点击");
}







@end
