### BasicAnimation

![animation](./Animation.gif)

1、keyPath

       rotation 旋轉
    
       scale 缩放
     
       translation 平移
       
       CGPoint Key Paths : (example)position.x 位移
    
       CGRect Key Paths : (example)bounds.size.width 伸缩
    
       origin 原点
       
       size 大小
       
       opacity 透明度
       
       backgroundColor  背景 颜色
     
       contents  内容
       
       Shadow Key Path: 阴影
       
2、

     duration：动画的持续时间
     
     
3、
　　<pre>repeatCount：动画的重复次数</pre>

4、
　　<pre>timingFunction：动画的时间节奏控制</pre>
       
  
### SpringAnimation

1、

    mass:
 
    质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
 
    动画的速度变慢，并且波动幅度变大
2、 

    stiffness:
 
    刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
3、
 
    damping:
 
    阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
4、

    initialVelocity:
 
    初始速率，动画视图的初始速度大小

    速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
5、

     +(void)animateWithDuration:(NSTimeInterval)duration 
     delay:(NSTimeInterval)delay 
     usingSpringWithDamping:(CGFloat)dampingRatio   
     initialSpringVelocity:(CGFloat)velocity 
     options:(UIViewAnimationOptions)options 
     animations:(void (^)(void))animations 
     completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
     
          duration: 动画时长
          delay: 动画延迟
          damping: 弹簧效果
          springVelocity: 初始速度
          options: 过度效果
          
          
### keyFrameAnimation

draw  a curve

    keyFrame：
    path：路径
    duration：单次时间
    rotationMode：旋转样式
    repeatCount：重复次数
   
1、弧形
 
    - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise ;
    center ： 弧形的中心
    radius： 弧形的半径
    startAngle：弧形开始弧度
    endAngle：弧形结束弧度
    colockwise：顺逆时针
 
2、抛物线

    - (void)moveToPoint:(CGPoint)point
    - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
    point：开始位置
    endPoint：结束位置
    controlPoint：拐点位置
 
3、椭圆形
 
    + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
    rect： x起点
           y起点
           width宽度
           height高度
          
4、圆形

    rect：
    width = height
 
   
### TransitionAnimation

* duration

<pre>设置动画时间</pre>

* type

<pre>设置运动类型

1、公有API的Type

    Fade,                       淡入淡出
    Push,                       推挤
    Reveal,                     揭开
    MoveIn,                     覆盖
    
2、私有API的Type

    Cube,                       立方体
    SuckEffect,                 吮吸
    OglFlip,                    翻转
    RippleEffect,               波纹
    PageCurl,                   翻页
    PageUnCurl,                 反翻页
    CameraIrisHollowOpen,       开镜头
    CameraIrisHollowClose,      关镜头
    
3、UIView翻页Type

    CurlDown,                   下翻页
    CurlUp,                     上翻页
    FlipFromLeft,               左翻转
    FlipFromRight,              右翻转
</pre>
    
* subtype

<pre>设置运动方向

    kCATransitionFromLeft
    kCATransitionFromBottom
    kCATransitionFromRight
    kCATransitionFromTop
    
</pre>

* timingFunction

<pre>设置运动轨迹

 kCAMediaTimingFunctionLinear            线性,即匀速
 kCAMediaTimingFunctionEaseIn            先慢后快
 kCAMediaTimingFunctionEaseOut           先快后慢
 kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
 kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
 
</pre>
    
    
4、使用方法

    - (void) transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView:(UIView *)view{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.7f;
    animation.type = type;
    if (subtype != nil) {
        animation.subtype = subtype;
    }
    [view.layer addAnimation:animation forKey:@"animation"];
     }
     
5、实例应用，UIView上下左右翻页

    - (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition{
    [UIView animateWithDuration:1.0f animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    } completion:^(BOOL finished) {
        self.title = @"0000";
    }];
    }

