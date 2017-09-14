//
//  MineViewController.m
//  yxtd
//
//  Created by qin on 2017/9/13.
//  Copyright © 2017年 qin. All rights reserved.
//

#import "MineViewController.h"



#define  btnLineColor [UIColor colorWithHexString:@"E7E7E7" alpha:1];


@interface MineViewController ()<UITextFieldDelegate,UIScrollViewDelegate>

@property (nonatomic,weak) UITextField *textField;
/**
 *  密码textfield
 */
@property (nonatomic,weak) UITextField *textField2;

@property (nonatomic,weak) UITextField *timeTextField;


@property (nonatomic,weak) UITextField *regTextField;

@property (nonatomic,weak) UITextField *regTextField2;

;

@property (nonatomic,strong) UIButton *headerIcon;

@property (nonatomic,strong)  UIScrollView *scView ;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIScrollView *scView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 49)];
    
    self.scView=scView;
    scView.backgroundColor = [UIColor whiteColor];
    scView.delegate=self;
    
    scView.showsVerticalScrollIndicator = NO;
    
    //设置可以滚动的范围，只能上下滚动
    scView.contentSize = CGSizeMake(0, CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.view.frame)/5*2 -49);
    
    //往顶部增加了CGRectGetHeight(self.view.frame)/5*2高度的滚动范围
    scView.contentInset = UIEdgeInsetsMake(CGRectGetHeight(self.view.frame)/5*2, 0, 0, 0);
    
    [self.view addSubview:scView];

    
    //添加相关控件
    [self addView:scView];
    
    //添加登录注册按钮
    [self createLogBtn:scView];
    
    [self setUpTextfileView:scView];
    
    
}


#pragma mark - 创建登录和注册按钮
- (void)createLogBtn:(UIScrollView *)scView
{
    
    UIView *itemsBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 1000)];
    
    itemsBackView.backgroundColor = [UIColor whiteColor];
    
    [scView addSubview:itemsBackView];
    
    NSArray*titleArr=@[@"登录",@"注册"];
    
    for (int i=0; i<titleArr.count; i++) {
        
        //登录
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
        bt.frame = CGRectMake(self.view.frame.size.width/2*i, 0, self.view.frame.size.width/2, 100);
        [bt setTitle:[NSString stringWithFormat:@"%@",titleArr[i]] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
        bt.tag=100+i;
        [itemsBackView addSubview:bt];
    }
    
        //中间竖线
        UIView *btnLineC = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 , 0, 1, 100 )];
        
        btnLineC.backgroundColor = [UIColor colorWithHexString:@"E7E7E7" alpha:1];

        [itemsBackView addSubview:btnLineC];
        
        //底部横线
        UIView *btnLineR = [[UIView alloc] initWithFrame:CGRectMake( 0,CGRectGetMaxY(btnLineC.frame) , self.view.frame.size.width, 1)];
        
       btnLineR.backgroundColor = [UIColor colorWithHexString:@"E7E7E7" alpha:1];

        [itemsBackView addSubview:btnLineR];
    
    
    }
    


#pragma mark---登录按钮点击事件
-(void)btClick:(UIButton*)Bt{
    
    if (Bt.tag==100) {
        
         [self setUpTextfileView:_scView];
    }else{
        
         [self setRefisterView:_scView];
        
    }
        

}

#pragma mark--注册控件
-(void)setRefisterView:(UIScrollView*)resgierView{
    
    UIButton*button=(UIButton*)[self.view viewWithTag:101];
    UIView *textfileBackView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame)+1, CGRectGetWidth(self.view.frame), 1000)];

    textfileBackView.backgroundColor = [UIColor whiteColor];
    
    [resgierView addSubview:textfileBackView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    
    [resgierView addGestureRecognizer:tap];
    
    NSArray *pla = @[@"请输入手机号",@"请输入密码",@"验证码"];
    NSArray *textleftImg = @[@"phoneNumber",@"password"];
    
    //-----------------添加文本输入框----------------------------
    //-----------------—_textField---------------------
    UITextField *regTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.frame) - 20 , CGRectGetWidth(self.view.frame)/7)];
    
    self.regTextField = regTextField;
    
    
    UITextField *regTextField2 = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetWidth(self.view.frame)/8, CGRectGetWidth(self.view.frame) - 20, CGRectGetWidth(self.view.frame)/7)];
    self.regTextField2 = regTextField2;
    
    
    //验证码
    UITextField *timeTextField = [[UITextField alloc] initWithFrame:CGRectMake(10,CGRectGetMaxY(regTextField2.frame), CGRectGetWidth(self.view.frame) - 20, CGRectGetWidth(self.view.frame)/7)];
    self.timeTextField = timeTextField;
    


    //设置文本框边界风格
    _regTextField.borderStyle = UITextBorderStyleNone;
    _regTextField2.borderStyle = UITextBorderStyleNone;
    _timeTextField.borderStyle = UITextBorderStyleNone;
 
    //设置字体大小
    _regTextField.font = [UIFont systemFontOfSize:15];
    _regTextField2.font = [UIFont systemFontOfSize:15];
    _timeTextField.font = [UIFont systemFontOfSize:15];
    
    
    //背景图片
    _regTextField.background = [UIImage imageWithStretchableName:@"textFieldImage"];
    _regTextField2.background = [UIImage imageWithStretchableName:@"textFieldImage"];
    _timeTextField.background = [UIImage imageWithStretchableName:@"textFieldImage"];
    
    //设置键盘样式
    _regTextField.returnKeyType = UIKeyboardTypeTwitter;
    _regTextField2.returnKeyType = UIKeyboardTypeTwitter;
    
    _regTextField.keyboardType = UIKeyboardTypeNumberPad;
    _timeTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    //设置密文
    _regTextField2.secureTextEntry = YES;
    
    //设置文本框代理
    _regTextField.delegate = self;
    _regTextField2.delegate = self;
    _timeTextField.delegate=self;
    
    //提示语
    _regTextField.placeholder = pla[0];
    _regTextField2.placeholder = pla[1];
    _timeTextField.placeholder=pla[2];
    
    //清除按钮
    _regTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _regTextField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    _timeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    //自动适应大小
    _regTextField.adjustsFontSizeToFitWidth = YES;
    _regTextField2.adjustsFontSizeToFitWidth = YES;
    _timeTextField.adjustsFontSizeToFitWidth = YES;
    
    //左侧视图:leftView
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    left.image = [UIImage imageNamed:textleftImg[0]];
    UIImageView *left2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    left2.image = [UIImage imageNamed:textleftImg[1]];
    
    UIImageView *left3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    
    _regTextField.leftView = left;
    _regTextField2.leftView = left2;
    _timeTextField.leftView=left3;
    
    //左侧视图显示模式:leftViewMode
    _regTextField.leftViewMode = UITextFieldViewModeAlways;
    _regTextField2.leftViewMode = UITextFieldViewModeAlways;
    _timeTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [textfileBackView addSubview:_regTextField];
    [textfileBackView addSubview:_regTextField2];
    [textfileBackView addSubview:_timeTextField];
    
    
}


#pragma mark--忘记密码点击事件
-(void)touchForgetPassword{
    
    
    UIAlertView*alter=[[UIAlertView alloc] initWithTitle:@"忘记密码提示" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alter show];

}


#pragma mark   添加控件
- (void)setUpTextfileView:(UIScrollView*)scView
{
    
    
    UIButton*button=(UIButton*)[self.view viewWithTag:100];
    
    UIView *textfileBackView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame)+1, CGRectGetWidth(self.view.frame), 1000)];
    
    textfileBackView.backgroundColor = [UIColor whiteColor];
    
    [scView addSubview:textfileBackView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    
    [scView addGestureRecognizer:tap];
    
    NSArray *pla = @[@"手机号",@"密码"];
    NSArray *textleftImg = @[@"phoneNumber",@"password"];
    
    //-----------------添加文本输入框----------------------------
    //-----------------—_textField---------------------
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.frame) - 20 , CGRectGetWidth(self.view.frame)/7)];
    
    self.textField = textField;
    

     UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetWidth(self.view.frame)/8, CGRectGetWidth(self.view.frame) - 20, CGRectGetWidth(self.view.frame)/7)];
     self.textField2 = textField2;
    
    //设置文本框边界风格
    _textField.borderStyle = UITextBorderStyleNone;
    _textField2.borderStyle = UITextBorderStyleNone;
    
    
    //设置字体大小
    _textField.font = [UIFont systemFontOfSize:15];
    _textField2.font = [UIFont systemFontOfSize:15];
    
    
    //背景图片
    _textField.background = [UIImage imageWithStretchableName:@"textFieldImage"];
    _textField2.background = [UIImage imageWithStretchableName:@"textFieldImage"];
    
    //设置键盘样式
    _textField.returnKeyType = UIKeyboardTypeTwitter;
    _textField2.returnKeyType = UIKeyboardTypeTwitter;
    
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    
    //设置密文
    _textField2.secureTextEntry = YES;
    
    //设置文本框代理
    _textField.delegate = self;
    _textField2.delegate = self;
    
    //提示语
    _textField.placeholder = pla[0];
    _textField2.placeholder = pla[1];
    
    //清除按钮
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //_textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    //自动适应大小
    _textField.adjustsFontSizeToFitWidth = YES;
    _textField2.adjustsFontSizeToFitWidth = YES;
    
    //左侧视图:leftView
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    left.image = [UIImage imageNamed:textleftImg[0]];
    UIImageView *left2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    left2.image = [UIImage imageNamed:textleftImg[1]];
    
    _textField.leftView = left;
    _textField2.leftView = left2;
    
    //左侧视图显示模式:leftViewMode
    _textField.leftViewMode = UITextFieldViewModeAlways;
    _textField2.leftViewMode = UITextFieldViewModeAlways;
    
    
    [textfileBackView addSubview:_textField];
    [textfileBackView addSubview:_textField2];
    
    
    
    
    //---------------忘记密码按钮---------------------
    UIButton *forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    
    forgetPassword.frame = CGRectMake(self.view.frame.size.width-80, 0, 80, 40);
    
    [forgetPassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    
    forgetPassword.titleLabel.font = [UIFont italicSystemFontOfSize:13];
    
    [forgetPassword setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [forgetPassword addTarget:self action:@selector(touchForgetPassword) forControlEvents:UIControlEventTouchUpInside];

 
    _textField2.rightView=forgetPassword;
    _textField2.rightViewMode=UITextFieldViewModeAlways;
    

    
    
}




#pragma mark    点击手势触发方法——隐藏键盘
- (void)hideKeyBoard
{
    //放弃第一响应者
    [self giveUpFirstResponder];
}

#pragma mark   放弃第一响应者
- (void)giveUpFirstResponder
{
    if(_textField.isEditing||_regTextField.isEditing)
    {
        [_textField resignFirstResponder];
        
        [_regTextField resignFirstResponder];
        
    }
    else if(_textField2.isEditing||_regTextField2.isEditing)
    {
        
        [_textField2 resignFirstResponder];
        
        [_regTextField2 resignFirstResponder];
        
    }else if (_timeTextField.isEditing){
        
        [_timeTextField resignFirstResponder];
    }
}

#pragma mark   点击return键时候触发
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    
    return YES;
}

#pragma mark--输入框代理事件(限制密码输入过长)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if ((textField == self.textField2||(textField==self.regTextField2)) && range.location >= 16)
    {
        return NO;
    }
    
    return YES;
}


#pragma  mark   滚动视图的代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //放弃第一响应者
    [self giveUpFirstResponder];
}

#pragma mark     添加其他控件
- (void)addView:(UIScrollView *)scView
{
    
    //----创建一个UIView并放在UIScrollView上，将某些控件加在上面，-----
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -CGRectGetHeight(self.view.frame)/5*2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)/5*2)];
   
    headerView.backgroundColor =[UIColor grayColor];
    
    
    //----------------头像-----------------
    CGFloat headerIconW = 100;
    
    CGFloat headerIconH = headerIconW;
  
    _headerIcon = [UIButton buttonWithType:UIButtonTypeCustom];
    _headerIcon.frame = CGRectMake((CGRectGetWidth(headerView.frame) - headerIconW)/2, CGRectGetHeight(headerView.frame)/2 - headerIconH / 2 - 30, headerIconW, headerIconH);
    
     [_headerIcon addTarget:self action:@selector(touchHeaderIconBtn) forControlEvents:UIControlEventTouchUpInside];
    _headerIcon.backgroundColor = [UIColor whiteColor];
    
    _headerIcon.layer.cornerRadius = headerIconW/2.0;
    
    _headerIcon.clipsToBounds = YES;
    
     [headerView addSubview:_headerIcon];
    
     [scView addSubview:headerView];
    
    
    NSInteger width = 0;
    
    NSInteger height = width;
    
    width = 50;
    
    height = width;
    
    
    //-----------------------设置--------------------------
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    setBtn.frame = CGRectMake(CGRectGetWidth(self.view.frame)- width - 15,30,width,height);
    
   // [setBtn setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [setBtn setTitle:@"设置" forState:UIControlStateNormal];
    
    [setBtn addTarget:self action:@selector(touchSetBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:setBtn];
    
    
 
    //------------------------通知--------------------------------------
    UIButton *tongzhi = [UIButton buttonWithType:UIButtonTypeCustom];
    
    tongzhi.frame = CGRectMake(15,30,width,height);
    
   // [tongzhi setBackgroundImage:[UIImage imageNamed:@"notice"] forState:UIControlStateNormal];
    [tongzhi setTitle:@"通知" forState:UIControlStateNormal];
    
    [tongzhi addTarget:self action:@selector(touchTongzhi) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tongzhi];
    
    
}

#pragma mark - 点击通知按钮
- (void)touchTongzhi
{
 
    NSLog(@"---通知按钮点击了------");
}


#pragma mark - 点击设置按钮
- (void)touchSetBtn
{
    NSLog(@"---设置按钮点击了------");
}


#pragma mark     点击头像触发事件
- (void)touchHeaderIconBtn
{
    
    NSLog(@"-----头像点击了一次-----");
    
}



#pragma mark - 视图即将出现
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
 
    self.navigationController.navigationBar.hidden = YES;
    
    //修改状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //修改电池条
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

#pragma mark - 视图即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}




@end
