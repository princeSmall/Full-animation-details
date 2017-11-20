//
//  ViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/14.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "AnimationViewController.h"
#import "BasicAnimationViewController.h"
#import "SpringAnimationViewController.h"
#import "KeyFrameAnimationViewController.h"
#import "TransitionAnimationViewController.h"
#import "ProgressAnimationViewController.h"
#import "GroupAnimationViewController.h"

@interface AnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * animationTableView;
@property (nonatomic,strong)NSArray * animationArray;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"CAAnimation动画";
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.animationTableView];
}
- (UITableView *)animationTableView{
    if (_animationTableView == nil) {
        _animationTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _animationTableView.delegate = self;
        _animationTableView.dataSource = self;
    }
    return _animationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"BasicAnimation-基础动画",@"SpringAnimation-移动动画",@"KeyFrameAnimation-关键帧动画",@"TransitionAnimation-过渡动画",@"ProgressAnimation-进度条动画",@"GroupAnimation-组合动画", nil];
    }
    return _animationArray;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"AnimationCell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        BasicAnimationViewController * basicAnimation = [[BasicAnimationViewController alloc]init];
        [self.navigationController pushViewController:basicAnimation animated:YES];
    }else if (indexPath.row == 1){
        SpringAnimationViewController * springAnimation = [[SpringAnimationViewController alloc]init];
        [self.navigationController pushViewController:springAnimation animated:YES];
    }else if (indexPath.row == 2){
        KeyFrameAnimationViewController * keyFrameAnimation = [[KeyFrameAnimationViewController alloc]init];
        [self.navigationController pushViewController:keyFrameAnimation animated:YES];
    }else if (indexPath.row == 3){
        TransitionAnimationViewController * transitionAnimation = [[TransitionAnimationViewController alloc]init];
        [self.navigationController pushViewController:transitionAnimation animated:YES];
    }else if (indexPath.row == 4){
        ProgressAnimationViewController * progressAnimation = [[ProgressAnimationViewController alloc]init];
        [self.navigationController pushViewController:progressAnimation animated:YES];
    }else if (indexPath.row == 5){
        GroupAnimationViewController * groupAnimation = [[GroupAnimationViewController alloc]init];
        [self.navigationController pushViewController:groupAnimation animated:YES];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
