//
//  ViewController.m
//  NavigationBarTranslusent
//
//  Created by 陈博文 on 16/8/9.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.title = @"131231212";
    
    //设置一张空的图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //清除边框，设置一张空的图片
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    self.tableView.rowHeight = 100;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"标题" style:0 target:nil action:nil];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}


/**
 *  遵守协议,注意不是代理
 *
 *  @param scrollView 会传入一个 scrollView
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"%f",scrollView.contentOffset.y);
    
    CGFloat alpha = scrollView.contentOffset.y/100.0;
    self.navigationController.navigationBar.subviews.firstObject.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.subviews.firstObject.alpha = alpha;
    
    //设置导航条上的标签是否跟着透明
    self.navigationItem.leftBarButtonItem.customView.alpha = alpha;
    self.navigationItem.rightBarButtonItem.customView.alpha = alpha;
//    NSLog(@"%@",self.navigationItem.leftBarButtonItem.customView);
}
@end
