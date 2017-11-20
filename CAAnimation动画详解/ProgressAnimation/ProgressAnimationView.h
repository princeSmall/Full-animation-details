//
//  ProgressAnimationView.h
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/18.
//  Copyright © 2017年 tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressAnimationView : UIView
@property (nonatomic,assign)CGFloat  endAngle;

-(void)setStartMove:(CGFloat)value;
@end
