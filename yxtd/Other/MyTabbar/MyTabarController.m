//
//  MyTabarController.m
//  UitabarController
//
//  Created by qin on 2017/9/11.
//  Copyright © 2017年 qin. All rights reserved.
//

#import "MyTabarController.h"
#import "MyUINavigationController.h"
#import "RunViewController.h"
#import "RankingViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"




//#define TabbarNormalFontColor [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1]

@interface MyTabarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabarController



+(void)initialize{
    
    UITabBarItem*item=[UITabBarItem appearanceWhenContainedIn:self,nil];
    
    NSMutableDictionary*dictionary=[NSMutableDictionary dictionary];
    dictionary[NSForegroundColorAttributeName]=[UIColor redColor];
    [item setTitleTextAttributes:dictionary forState:UIControlStateSelected];
    
    NSMutableDictionary*normalDict=[NSMutableDictionary dictionary];
    normalDict[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    [item setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.delegate=self;
    
    UIView*whiteView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    whiteView.backgroundColor=[UIColor whiteColor];
    
    [self.tabBar insertSubview:whiteView atIndex:0];
    
    
    [self setUpAllChildViewController];
    
    
    
}


#pragma mark --添加标签栏全部子控制器
-(void)setUpAllChildViewController{
    
    RunViewController*run=[[RunViewController alloc] init];
    
    [self setupOneChildViewController:run image:[UIImage imageNamed:@"running"] selectedImage:[UIImage imageWithoriginName:@"selectImage"] title:@"跑券"];
    
    //run.firstTabBarComeTag=YES;
    
    run.view.backgroundColor=[UIColor greenColor];
    
    
    RankingViewController*rank=[[RankingViewController alloc] init];
    
    [self setupOneChildViewController:rank image:[UIImage imageNamed:@"ranking"] selectedImage:[UIImage imageWithoriginName:@"selectImage"] title:@"排行"];
    rank.view.backgroundColor=[UIColor yellowColor];
    

    
    FindViewController*find=[[FindViewController alloc] init];
    
    [self setupOneChildViewController:find image:[UIImage imageNamed:@"find"] selectedImage:[UIImage imageWithoriginName:@"selectImage"] title:@"发现"];
    find.view.backgroundColor=[UIColor purpleColor];
    
    MineViewController*mine=[[MineViewController alloc] init];
    
    [self setupOneChildViewController:mine image:[UIImage imageNamed:@"mine"] selectedImage:[UIImage imageWithoriginName:@"selectImage"] title:@"我的"];
    mine.view.backgroundColor=[UIColor purpleColor];
    
    
}

#pragma mark --添加标签栏一个子控制器

-(void)setupOneChildViewController:(UIViewController*)vc image:(UIImage*)image selectedImage:(UIImage*)selectedImage title:(NSString*)title{
    
    vc.tabBarItem.title=title;
    
    vc.tabBarItem.image=image;
    
    vc.tabBarItem.selectedImage=selectedImage;
    
    
    MyUINavigationController*navi=[[MyUINavigationController alloc] initWithRootViewController:vc];
    navi.navigationBar.translucent=NO;
    
    [self addChildViewController:navi];
    
}


#pragma mark- 选择控制器

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    MyUINavigationController*navi=(MyUINavigationController*)viewController;
    
    if ([navi.topViewController isKindOfClass:[RunViewController class]])
    {
        RunViewController *run = (RunViewController *)navi.topViewController;
        
        //first.firstTabBarComeTag=YES;
        
        
    }else if([navi.topViewController isKindOfClass:[RankingViewController class]]){
        
        
        RankingViewController *second = (RankingViewController *)navi.topViewController;
        
        //second.SecondTabBarComeTag=YES;
        
    }
    
    return YES;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self.selectedViewController beginAppearanceTransition:YES animated:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{

    [self.selectedViewController endAppearanceTransition];

}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
