//
//  TransitionAnimationViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/17.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "TransitionAnimationViewController.h"

@interface TransitionAnimationViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>
@property (nonatomic,strong)UITableView * transitionAnimationTableView;
@property (nonatomic,strong)NSArray * animationArray1;
@property (nonatomic,strong)NSArray * animationArray2;
@property (nonatomic,strong)NSArray * animationArray3;
@property (nonatomic,strong)UIImageView * imageView;

@end

@implementation TransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.transitionAnimationTableView];
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}
- (UITableView *)transitionAnimationTableView{
    if (_transitionAnimationTableView == nil) {
        _transitionAnimationTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/ 2.0, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _transitionAnimationTableView.delegate = self;
        _transitionAnimationTableView.dataSource = self;
    }
    return _transitionAnimationTableView;
}
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0,self.view.frame.size.height / 4.0 , self.view.frame.size.width / 2.0, self.view.frame.size.height / 2)];
    }
    return _imageView;
}
- (NSArray *)animationArray1{
    if (_animationArray1 == nil) {
        _animationArray1 = [NSArray arrayWithObjects:@"Fade",@"Push",@"Reveal",@"MoveIn", nil];
    }
    return _animationArray1;
}
- (NSArray *)animationArray2{
    if (_animationArray2 == nil) {
        _animationArray2 = [NSArray arrayWithObjects:@"Cube",@"SuckEffect",@"OglFlip",@"RippleEffect",@"PageCurl",@"PageUnCurl",@"CameraIrisHollowOpen",@"CameraIrisHollowClose", nil];
    }
    return _animationArray2;
}
- (NSArray *)animationArray3{
    if (_animationArray3 == nil) {
        _animationArray3 = [NSArray arrayWithObjects:@"CurlDown",@"CurlUp",@"FlipFromLeft",@"FlipFromRight", nil];
    }
    return _animationArray3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.animationArray1.count;
    }else if (section == 1){
        return self.animationArray2.count;
    }else
        return self.animationArray3.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"公有API";
    }else if (section == 1){
        return @"私有API";
    }else
        return @"封装UIView";
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"TransitionAnimationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier] ;
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = self.animationArray1[indexPath.row];
    }else if (indexPath.section == 1){
        cell.textLabel.text = self.animationArray2[indexPath.row];
    }else if (indexPath.section == 2){
        cell.textLabel.text = self.animationArray3[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self viewAnimation:indexPath];
}
- (void)viewAddBackGroundImageName:(NSString *)imageName{
    self.imageView.image = [UIImage imageNamed:imageName];
}
- (void)viewAnimation:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self transitionWithType:kCATransitionFade WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"Fade";
                break;
            case 1:
                 [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"Push";
                break;
            case 2:
                 [self transitionWithType:kCATransitionReveal WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"Reveal";
                break;
            case 3:
                [self transitionWithType:kCATransitionMoveIn WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"MoveIn";
                break;
                
            default:
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                 [self transitionWithType:@"cube" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                self.title = @"Cube";
                break;
            case 1:
                 [self transitionWithType:@"suckEffect" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"SuckEffect";
                break;
            case 2:
                [self transitionWithType:@"oglFlip" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"OglFlip";
                break;
            case 3:
                 [self transitionWithType:@"rippleEffect" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"RippleEffect";
                break;
            case 4:
                [self transitionWithType:@"pageCurl" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"PageCurl";
                break;
            case 5:
                  [self transitionWithType:@"pageUnCurl" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"PageUnCurl";
                break;
            case 6:
                [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"CameraIrisHollowClose";
                break;
                
            case 7:
                [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:kCATransitionFromLeft ForView:self.imageView];
                 self.title = @"CameraIrisHollowClose";
                break;
                
            default:
                break;
        }
    }else if (indexPath.section == 2){
        switch (indexPath.row) {
            case 0:
                 [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionCurlDown];
                 self.title = @"CurlDown";
                break;
            case 1:
                  [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionCurlUp];
                 self.title = @"CurlUp";
                break;
            case 2:
                 [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
                 self.title = @"FlipFromLeft";
                break;
            case 3:
                 [self animationWithView:self.imageView WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
                 self.title = @"FlipFromRight";
                break;
                
            default:
                break;
        }
    }
    if (indexPath.row / 2 == 0 ) {
          [self viewAddBackGroundImageName:@"KIT"];
    }else{
          [self viewAddBackGroundImageName:@"STELLAR"];
    }
  
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView:(UIView *)view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 0.7f;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    [view.layer addAnimation:animation forKey:@"animation"];
}



#pragma UIView实现动画

- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:1.0f animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    } completion:^(BOOL finished) {
        
    }];
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
