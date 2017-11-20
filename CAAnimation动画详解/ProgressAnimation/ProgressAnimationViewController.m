//
//  ProgressAnimationViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/18.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ProgressAnimationViewController.h"
#import "ProgressAnimationView.h"
#import "ProgressAnimationBallView.h"
#import "ProgressAnimationTimeView.h"

#define winWidth self.view.frame.size.width
#define winHeight self.view.frame.size.height

@interface ProgressAnimationViewController ()
@property (nonatomic,strong)ProgressAnimationView * animationView;
@property (nonatomic,strong)ProgressAnimationBallView * animationBallView;
@property (nonatomic,strong)ProgressAnimationTimeView * animationTimeView;
@property (nonatomic,strong)UISlider * sectorSlider;
@property (nonatomic,strong)UILabel * percentLable;


@end

@implementation ProgressAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.sectorSlider];
    [self.view addSubview:self.animationView];
    [self.view addSubview:self.animationBallView];
    [self.view addSubview:self.animationTimeView];
    [self.view addSubview:self.percentLable];
   
    // Do any additional setup after loading the view.
}
- (ProgressAnimationView *)animationView{
    if (_animationView == nil) {
        _animationView = [[ProgressAnimationView alloc]initWithFrame:CGRectMake(winWidth / 2.0 - 100 , winHeight / 2.0 - 100, 200, 200)];
        _animationView.backgroundColor = [UIColor purpleColor];
    }
    return _animationView;
}
- (ProgressAnimationBallView *)animationBallView{
    if (_animationBallView == nil) {
        _animationBallView = [[ProgressAnimationBallView alloc]initWithFrame:CGRectMake(winWidth / 2.0 -100, winHeight /2.0 + 110, 200, 200)];
        _animationBallView.backgroundColor = [UIColor purpleColor];
    }
    return _animationBallView;
}
-(ProgressAnimationTimeView *)animationTimeView{
    if (_animationTimeView == nil) {
        _animationTimeView = [[ProgressAnimationTimeView alloc]initWithFrame:CGRectMake(winWidth / 2.0 - 50, 120, 100, 100)];
        _animationTimeView.backgroundColor = [UIColor purpleColor];
    }
    return _animationTimeView;
}
- (UISlider *)sectorSlider{
    if (_sectorSlider == nil) {
        _sectorSlider = [[UISlider alloc]initWithFrame:CGRectMake(winWidth/2.0 - 100, 100, 200, 10)];
        _sectorSlider.continuous = YES;
        [_sectorSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_sectorSlider setMinimumValue:0.0];
        [_sectorSlider setMaximumValue:1.0];
    }
    return _sectorSlider;
}
-(UILabel *)percentLable{
    if (_percentLable == nil) {
        _percentLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, winWidth, 40)];
        _percentLable.textAlignment = NSTextAlignmentCenter;
        _percentLable.font = [UIFont systemFontOfSize:20];
        _percentLable.textColor = [UIColor blackColor];
    }
    return _percentLable;
}
-(void)sliderValueChanged:(UISlider *)slider{
    NSLog(@"---%f", slider.value);
    self.percentLable.text = [NSString stringWithFormat:@"%.2f",slider.value * 100];
     [self.animationView  setStartMove:slider.value];
    [self.animationBallView setStartMove:slider.value];
    [self.animationTimeView setStartMove:slider.value];
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
