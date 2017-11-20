//
//  ProgressAnimationView.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/18.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ProgressAnimationView.h"

@implementation ProgressAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect{
    CGPoint point = CGPointMake(100 , 100);
    CGFloat radius = 95.0f;
//    开始的角度
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = startAngle + self.endAngle;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:point];
    [[UIColor greenColor]set];
    [path fill];
    UIBezierPath *strokePath = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:0 endAngle:-0.00000001 clockwise:YES];
    [[UIColor lightGrayColor]set];
    [strokePath stroke];
    
}
- (void)setStartMove:(CGFloat)value{
    self.endAngle = value * M_PI * 2;
    [self setNeedsDisplay];
}
@end
