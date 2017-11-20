//
//  ProgressAnimationTimeView.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/19.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ProgressAnimationTimeView.h"

@implementation ProgressAnimationTimeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect{

    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 6.0f;
    self.shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    
  
    self.backShapeLayer = [CAShapeLayer layer];
    self.backShapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.backShapeLayer.lineWidth = 6.0f;
    self.backShapeLayer.strokeColor = [UIColor darkGrayColor].CGColor;

//    UIBezierPath用于定义一个由直线/曲线组合而成的路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(50, 50) radius:40 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    self.shapeLayer.path = path.CGPath;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = self.toValue;
    self.backShapeLayer.path = path.CGPath;
    self.backShapeLayer.strokeStart = 0;
    self.backShapeLayer.strokeEnd = 1;
    [self.layer addSublayer:self.backShapeLayer];
    [self.layer addSublayer:self.shapeLayer];

}


- (void)setStartMove:(CGFloat)value{
    self.toValue = value;
    [self setNeedsDisplay];
}

@end
