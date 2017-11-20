//
//  BasicAnimationViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/15.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>
@property (nonatomic,strong)UITableView * basicAnimationTableView;
@property (nonatomic,strong)NSArray * animationArray;
@property (nonatomic,strong)UIView * redView;

@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[ UIColor whiteColor];
    [self.view addSubview:self.basicAnimationTableView];
    [self.view addSubview:self.redView];
    // Do any additional setup after loading the view.
}

/**
 懒加载生成对象

 @return tableView，array，view
 */
- (UITableView *)basicAnimationTableView{
    if (_basicAnimationTableView == nil) {
        _basicAnimationTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,200, self.view.frame.size.height) style:UITableViewStylePlain];
        _basicAnimationTableView.delegate = self;
        _basicAnimationTableView.dataSource = self;
    }
    return _basicAnimationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"RotationX",@"RotationY",@"RotationZ",@"Move",@"0pacity",@"BackgroundColor",@"Scale",@"ScaleX",@"ScaleY",@"Bounds", nil];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"BasicAnimationCell";
     UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self animationSelected:indexPath.row];
}
- (void)animationSelected:(NSInteger)row{
    CABasicAnimation * animation = nil;
    switch (row) {
             //旋转
        case 0:
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            [animation setToValue:@(2 * M_PI)];
            break;
        case 1:
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            [animation setToValue:@(2 * M_PI)];
            break;
        case 2:
            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            [animation setToValue:@(2 * M_PI)];
            break;
        case 3:
            //平移
            animation = [CABasicAnimation animationWithKeyPath:@"position"];
            [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.redView.center.x, self.redView.center.y + 200)]];
            break;
        case 4:
            // 透明度
            animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            [animation setFromValue:@1.0];
            [animation setToValue:@0.1];
            break;
        case 5:
            // 背景颜色
            animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
            animation.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
            animation.toValue = (__bridge id _Nullable)([UIColor greenColor].CGColor);
           
            break;
        case 6:
            // 缩放
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            [animation setFromValue:@1.0];
            [animation setToValue:@0.1];
            break;
        case 7:
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            [animation setFromValue:@1.0];
            [animation setToValue:@0.1];
            break;
        case 8:
            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
            [animation setFromValue:@1.0];
            [animation setToValue:@0.1];
            break;
        case 9:
            // 弹性
            animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
            [animation setToValue:[NSValue valueWithCGRect:CGRectMake(self.redView.frame.origin.x, self.redView.frame.origin.y, 200, 200)]];
            break;
            
        default:
            break;
    }
    [animation setDelegate:self];//代理回调
    [animation setDuration:1];//设置动画时间，单次动画时间
    [animation setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setAutoreverses:YES];
    [animation setFillMode:kCAFillModeBoth];
    [self.redView.layer addAnimation:animation forKey:@"basicAnimation"];
}
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始------：%@",    NSStringFromCGPoint(self.redView.center));
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束------：%@",    NSStringFromCGPoint(self.redView.center));
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
