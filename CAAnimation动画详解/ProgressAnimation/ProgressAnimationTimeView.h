//
//  ProgressAnimationTimeView.h
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/19.
//  Copyright © 2017年 tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressAnimationTimeView : UIView
@property (nonatomic,assign)CGFloat toValue;
@property (nonatomic,strong)CAShapeLayer * shapeLayer;
@property (nonatomic,strong)CAShapeLayer * backShapeLayer;
-(void)setStartMove:(CGFloat)value;
@end
