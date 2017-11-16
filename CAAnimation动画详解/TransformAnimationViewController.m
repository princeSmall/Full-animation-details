//
//  TransformAnimationViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/15.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "TransformAnimationViewController.h"

@interface TransformAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * transformAnimationTableView;
@property (nonatomic,strong)NSArray * animationArray;
@property (nonatomic,strong)UIView * redView;

@end

@implementation TransformAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UITableView *)transformAnimationTableView{
    if (_transformAnimationTableView == nil) {
        _transformAnimationTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _transformAnimationTableView.delegate = self;
        _transformAnimationTableView.dataSource = self;
    }
    return _transformAnimationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"", nil];
    }
    return _animationArray;
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
