//
//  KeyFrameViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/16.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "KeyFrameAnimationViewController.h"

@interface KeyFrameAnimationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * keyFrameAnimationTableView;
@property (nonatomic,strong)NSArray * animationArray;
@property (nonatomic,strong)UIView * redView;
@property (nonatomic,strong)UIBezierPath * path;



@end

@implementation KeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.keyFrameAnimationTableView];
    [self.view addSubview:self.redView];
    // Do any additional setup after loading the view.
}
- (UITableView *)keyFrameAnimationTableView{
    if (_keyFrameAnimationTableView == nil) {
        _keyFrameAnimationTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _keyFrameAnimationTableView.delegate = self;
        _keyFrameAnimationTableView.dataSource = self;
    }
    return _keyFrameAnimationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"ArcLine",@"parapolaLine",@"ovalLine",@"RoundLine",@"Timeout",@"strike", nil];
    }
    return _animationArray;
}
- (UIView *)redView{
    if (_redView == nil) {
        _redView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2-5, self.view.frame.size.height / 2-5, 10, 10)];
        _redView.backgroundColor = [UIColor redColor];
        _redView.layer.cornerRadius = 5;
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
    NSString * identifier = @"TransformAnimationCell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 4) {
        [self keyFrameAnimation:indexPath.row];
    }else if(indexPath.row == 4){
        [self timeout];
    }else if (indexPath.row == 5){
        [self makeUse];
    }else if (indexPath.row == 6){
        
    }
}


/**
 draw a strike
 */
- (void)makeUse{
    CAShapeLayer * shapelayer = [CAShapeLayer layer];
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:CGPointMake(150, 200)];
    [self.path addLineToPoint:CGPointMake(170, 220)];
    [self.path addLineToPoint:CGPointMake(190, 180)];
    shapelayer.path = self.path.CGPath;
    shapelayer.fillColor = [UIColor clearColor].CGColor;
    shapelayer.lineWidth = 4.0f;
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapelayer];
    
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [shapelayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}

/**
 draw a round
 shapelayer：路径画好，设置clearcolor
    path：路径
    fillColor：路径颜色
    strokeColor：填充颜色
    lineWidth：线条宽度
 animation：动画画圆
 */
- (void)timeout{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(self.view.frame.size.width / 2-50, 500, 100, 100);
    self.path = [UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds];
    shapeLayer.path = self.path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];

    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;

    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];

}

/**
 draw  a curve
  弧形
- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise ;
 center ： 弧形的中心
 radius： 弧形的半径
 startAngle：弧形开始弧度
 endAngle：弧形结束弧度
 colockwise：顺逆时针
 
  抛物线
 - (void)moveToPoint:(CGPoint)point
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
 point：开始位置
 endPoint：结束位置
 controlPoint：拐点位置
 
  椭圆形
 + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
 rect： x起点
       y起点
       width宽度
       height高度
 圆形
 rect：
 width = height
 
 keyFrame：
    path：路径
    duration：单次时间
    rotationMode：旋转样式
    repeatCount：重复次数
 */
- (void)keyFrameAnimation:(NSInteger)row{
    CAKeyframeAnimation * keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    if (row == 0) {
        self.path = [UIBezierPath bezierPath];
        [self.path addArcWithCenter:self.view.center radius:80 startAngle:M_PI endAngle:M_PI * 2 clockwise:YES];
    }else if (row == 1){
        self.path = [UIBezierPath bezierPath];
        [self.path moveToPoint:CGPointMake(350, 300)];
        [self.path addQuadCurveToPoint:CGPointMake(50, 300)
                          controlPoint:CGPointMake(150, 650)];
    }else if (row == 2){
        self.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 300, 200, 300)];
    }else if (row == 3){
        self.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height /2 - 50, 100, 100)];
    }
    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.strokeColor =[UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = self.path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    [keyFrameAnimation setPath:self.path.CGPath];
    keyFrameAnimation.rotationMode = kCAAnimationRotateAuto;
    keyFrameAnimation.duration = 5;
    keyFrameAnimation.repeatCount = INFINITY;
    [self.redView.layer addAnimation:keyFrameAnimation forKey:@"parapolaAnimation"];
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
