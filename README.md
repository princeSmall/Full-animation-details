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