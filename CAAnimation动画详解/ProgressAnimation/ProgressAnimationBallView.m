//
//  ProgressAnimationBallView.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/18.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ProgressAnimationBallView.h"

@implementation ProgressAnimationBallView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    CGPoint point = CGPointMake(100, 100);
    CGFloat radius = 95.0f;
    
    UIBezierPath *ballPath = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:self.startAngle endAngle:self.endAngle clockwise:YES];
    
    [[UIColor greenColor]set];
    [ballPath fill];
    
    //    在球形的外面绘制一个描边空心的圆形，不然很难看
    UIBezierPath *strokePath = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:0 endAngle:-0.00000001 clockwise:YES];
    [[UIColor lightGrayColor]set];
    [strokePath stroke];
}


-(void)setStartMove:(CGFloat)value{
    
    //    设置起始点，位置是根据进度动态变换的
    self.startAngle = M_PI_2 - value * M_PI;
    self.endAngle = M_PI_2 + value * M_PI;
    
    [self setNeedsDisplay];
}


@end
