//
//  GroupAnimationViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/20.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "GroupAnimationViewController.h"
#import "HeartAnimationView.h"

@interface GroupAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * groupAnimationTableView;
@property (nonatomic,strong)NSArray * animationArray;
@property (nonatomic,strong)UIView * redView;
@property (nonatomic,strong)HeartAnimationView * heartAnimationView;

@end

@implementation GroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GroupAnimation";
    [self.view addSubview:self.groupAnimationTableView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.heartAnimationView];

    // Do any additional setup after loading the view.
}
- (UITableView *)groupAnimationTableView{
    if (_groupAnimationTableView == nil) {
        _groupAnimationTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _groupAnimationTableView.delegate =self;
        _groupAnimationTableView.dataSource = self;
    }
    return _groupAnimationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [[NSArray alloc]initWithObjects:@"缩放旋转位移",@"缩放透明度",@"心形闪烁", nil];
    }
    return _animationArray;
}
- (UIView *)redView{
    if (_redView == nil) {
        _redView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2.0 - 50, self.view.frame.size.height /2.0 - 50, 100, 100)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}
- (HeartAnimationView *)heartAnimationView{
    if (_heartAnimationView == nil) {
        _heartAnimationView = [[HeartAnimationView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2.0 - 50, self.view.frame.size.height /2.0 + 100, 100, 100)];
        _heartAnimationView.backgroundColor = [UIColor whiteColor];
    }
    return _heartAnimationView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"GroupAnimationViewCell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [self.redView.layer removeAllAnimations];
     [self.heartAnimationView.layer removeAllAnimations];
    if (indexPath.row == 0) {
        [self setGroupScaleAndPositionAndRotation];
    }else if (indexPath.row == 1){
        [self setGroupScaleAndOpacity];
    }else if (indexPath.row == 2){
        [self setGroupBounds];
    }
}
- (void)setGroupBounds{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    [animation setToValue:[NSValue valueWithCGRect:CGRectMake(self.redView.frame.origin.x, self.redView.frame.origin.y, 200, 200)]];
    animation.duration = 2;
    animation.repeatCount = INFINITY;
    
   CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation1 setFromValue:@0];
    [animation1 setToValue:@1];
    animation1.duration = 2;
    animation1.repeatCount = INFINITY;
   
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.0;
    animationGroup.animations = @[animation,animation1];
    animationGroup.repeatCount = INFINITY;
    [self.heartAnimationView.layer addAnimation:animationGroup forKey:@"group3"];
}

- (void)setGroupScaleAndOpacity{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(1);
    animation.toValue = @(0);
    animation.duration = 4.0;
    animation.autoreverses = YES;
    animation.repeatCount = INFINITY;
    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation1.duration = 4.0;
    [animation1 setFromValue:@1];
    [animation1 setToValue:@0];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 4.0;
    animationGroup.animations = @[animation,animation1];
    animationGroup.repeatCount = INFINITY;
    [self.redView.layer addAnimation:animationGroup forKey:@"group2"];
}
- (void)setGroupScaleAndPositionAndRotation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 4.0;
    animation.fromValue = @(0.5);
    animation.toValue = @(2);
    animation.autoreverses = YES;
    animation.repeatCount = INFINITY;
    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation1.duration = 4.0;
    [animation1 setToValue:[NSValue valueWithCGPoint:CGPointMake(self.redView.center.x, self.redView.center.y + 200)]];
    animation1.repeatCount = INFINITY;
    
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation2.fromValue = @(0);
    animation2.toValue = @(6*M_PI);
    animation2.duration = 4.0;
    animation2.repeatCount = INFINITY;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 4.0;
    animationGroup.animations = @[animation,animation1,animation2];
    animationGroup.repeatCount = INFINITY;
    [self.redView.layer addAnimation:animationGroup forKey:@"group1"];
    
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
