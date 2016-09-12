//
//  ViewController.m
//  Masonry
//
//  Created by liuxingchen on 16/9/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
//如果在有Masonry项目中添加一下两个宏，就不用添加mas_这个东西了什么东西都可以直接写见Masonry4
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

 - (void)viewDidLoad {
    [super viewDidLoad];
     [self Masonry5];
}
/**
 NSLayoutConstraint加约束1
 */
-(void)NSLayoutConstraint1
{
    UIView * greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    //不要AutoresizingMask转成AutoLayout的约束
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:greenView];
    /**
     - view1 ：要约束的控件
     - attr1 ：约束的类型（做怎样的约束）距离左右上下
     - relation ：与参照控件之间的关系
     - NSLayoutRelationLessThanOrEqual小于等于
     - NSLayoutRelationEqual  等于
     - NSLayoutRelationGreaterThanOrEqual 大于等于
     - toItem: 和其他控件做比较
     - view2 ：参照的控件
     - attr2 ：约束的类型（做怎样的约束）
     - multiplier ：乘数
     - c ：常量
     */
#pragma mark - 控件宽300高100距离父控件⬅️10 距离父控件⬆️40
    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:300];
    [greenView addConstraint:widthConstraint];
    
    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [greenView addConstraint:heightConstraint];
    
    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    [self.view addConstraint:leftConstraint];
    
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:40];
    [self.view addConstraint:topConstraint];
}
/**
 NSLayoutConstraint加约束2
 */
-(void)NSLayoutConstraint2
{
    UIView *blue  = [[UIView alloc]init];
    blue.backgroundColor = [UIColor blueColor];
    blue.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blue];
#pragma mark - 宽高是父控件的一半，水平居中，垂直居中
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:blue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blue.superview attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:widthConstraint];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:blue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blue.superview attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.view addConstraint:heightConstraint];
    //水平居中
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:blue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:blue.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:centerXConstraint];
    //垂直居中
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:blue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:blue.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centerYConstraint];
}
/**
 NSLayoutConstraint加约束3
 */
-(void)NSLayoutConstraint3
{

    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    // 不要将AutoresizingMask转为Autolayout的约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    // 不要将AutoresizingMask转为Autolayout的约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];//
    
    /************************** 蓝色 **************************/
    // 添加高度约束:40
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:40];
    [blueView addConstraint:heightConstraint];
    
    // 添加左边约束：blueView的左边距离父控件左边有20的间距
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:leftConstraint];
    
    
    // 添加右边约束：blueView的右边距离父控件右边有20的间距
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rightConstraint];
    
    // 添加顶部约束：blueView的顶部距离父控件顶部有20的间距
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:topConstraint];
    
    /************************** 红色 **************************/
    // 添加高度约束:蓝色等高
    NSLayoutConstraint *heightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:heightConstraint2];
    
    // 添加左边约束：redView的左边 == 父控件的中心x
    NSLayoutConstraint *leftConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:leftConstraint2];
    
    // 添加顶部约束：redView的顶部距离blueView的底部有20的间距
    NSLayoutConstraint *topConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    [self.view addConstraint:topConstraint2];
    
    // 添加右边约束：redView的右边 == blueView的右边
    NSLayoutConstraint *rightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:rightConstraint2];
}

-(void)Masonry
{
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    // 尺寸限制：100x100
    // 位置：粘着父控件右下角，间距是20
    //最具体的写法
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    //可以把(self.view的mas_right)删除也可以
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-20);
    }];
    
}
-(void)Masonry2
{
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    // 居中（水平+垂直）
    // 尺寸是父控件的一半
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view).multipliedBy(0.5);
        make.center.mas_equalTo(self.view);
//        make.centerX.mas_equalTo(self.view);
//        make.centerY.mas_equalTo(self.view);
    }];
}
-(void)Masonry3
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    // 距离父控件四周都是50间距
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
//        make.left.mas_equalTo(self.view.mas_left).offset(50);
//        make.right.mas_equalTo(self.view.mas_right).offset(-50);
//        make.top.mas_equalTo(self.view.mas_top).offset(50);
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
    }];
}
-(void)Masonry4
{
    UIView * grayView = [[UIView alloc]init];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    
    [grayView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(100);
        make.height.equalTo(100);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}
-(void)Masonry5
{
    
    UIView * blueView =[[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    UIView * redView =[[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(redView.left).offset(-20);
        make.bottom.mas_equalTo(self.view.bottom).offset(-20);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(redView.top);
        make.bottom.mas_equalTo(redView.bottom);
        make.width.mas_equalTo(redView.mas_width);
        
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(-20);
    }];
    
}
@end
