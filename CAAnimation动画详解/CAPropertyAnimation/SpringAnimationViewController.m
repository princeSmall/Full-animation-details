//
//  SpringAnimationViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/15.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "SpringAnimationViewController.h"

@interface SpringAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * springAnimationTableView;
@property (nonatomic,strong)NSArray * animationArray;
@property (nonatomic,strong)UIView * redView;

@property (nonatomic,strong)UIView * blueView;

@end

@implementation SpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.springAnimationTableView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
    // Do any additional setup after loading the view.
}
/**
 懒加载生成对象
 
 @return tableView，array，view
 */
- (UITableView *)springAnimationTableView{
    if (_springAnimationTableView == nil) {
        _springAnimationTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,200, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _springAnimationTableView.delegate = self;
        _springAnimationTableView.dataSource = self;
    }
    return _springAnimationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"Mass",@"Stiffness", @"Damping",@"initialVelocity",@"UIViewAnimationMove",@"UIViewAnimationBounds",nil];
    }
    return _animationArray;
}
- (UIView *)redView{
    if (_redView == nil) {
        _redView = [[UIView alloc]initWithFrame:CGRectMake(250, 250, 100, 100)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}
- (UIView *)blueView{
    if (_blueView == nil) {
        _blueView = [[UIView alloc]initWithFrame:CGRectMake(10, 450, 20, 20)];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"SpringAnimationCell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 4) {
        [self animationSelected:indexPath.row];
    }else if (indexPath.row == 4){
        //        duration: 动画时长
        //        delay: 动画延迟
        //        damping: 弹簧效果
        //        springVelocity: 初始速度
        //        options: 过度效果
        [UIView animateWithDuration:5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            CGPoint point =self.redView.center;
            point.y += 150;
            [self.redView setCenter:point];
        } completion:^(BOOL finished) {
            CGPoint point =self.redView.center;
            point.y -= 150;
            [self.redView setCenter:point];
            [self.redView setBackgroundColor:[UIColor redColor]];
        }];
    }else {
        [UIView animateWithDuration:1 animations:^{
            CGRect rect = self.blueView.frame;
            rect.size.width += self.view.frame.size.width;
            rect.size.height += self.view.frame.size.height;
            [self.blueView setFrame:rect];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                CGRect rect = self.blueView.frame;
                rect.size.width -= self.view.frame.size.width;
                rect.size.height -= self.view.frame.size.height;
                [self.blueView setFrame:rect];
            }];
        }];
        
      
    }
    
}

/**
 参数说明

 mass:
 
 质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
 
 动画的速度变慢，并且波动幅度变大
 
 stiffness:
 
 刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
 
 damping:
 
 阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
 
 initialVelocity:
 
 初始速率，动画视图的初始速度大小
 速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
 
 */
- (void)animationSelected:(NSInteger)row{
    CGFloat damping = 0.0;
    CGFloat stiffness = 0.0;
    CGFloat mass = 0.0;
    CGFloat initialVelocity = 0.0;
    switch (row) {
        case 0:
            damping = 10;
            stiffness = 100;
            mass = 1;
            initialVelocity = 0;
            break;
        case 1:
            damping = 5;
            stiffness = 200;
            mass = 1;
            initialVelocity = 0;
            break;
        case 2:
            damping = 5;
            stiffness = 100;
            mass = 2;
            initialVelocity = 0;
            break;
        case 3:
            damping = 5;
            stiffness = 100;
            mass = 1;
            initialVelocity = 1;
            break;
        default:
            break;
    }
    CASpringAnimation * springAnimation = [CASpringAnimation animationWithKeyPath:@"position"];
    springAnimation.damping = damping;
    springAnimation.stiffness = stiffness;
    springAnimation.mass = mass;
    springAnimation.initialVelocity = initialVelocity;
    springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(self.redView.layer.position.x, self.redView.layer.position.y + 200)];
    springAnimation.duration = springAnimation.settlingDuration;
    [self.redView.layer addAnimation:springAnimation forKey:springAnimation.keyPath];
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
