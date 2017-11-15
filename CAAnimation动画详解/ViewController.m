//
//  ViewController.m
//  CAAnimation动画详解
//
//  Created by tongle on 2017/11/14.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimationViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * AnimationTableView;
@property (nonatomic,strong)NSArray * AnimationArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.AnimationTableView];
}
- (UITableView *)AnimationTableView{
    if (_AnimationTableView == nil) {
        _AnimationTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _AnimationTableView.delegate = self;
        _AnimationTableView.dataSource = self;
    }
    return _AnimationTableView;
}
- (NSArray *)AnimationArray{
    if (_AnimationArray == nil) {
        _AnimationArray = [NSArray arrayWithObjects:@"basicAnimation",@"SpringAnimation", nil];
    }
    return _AnimationArray;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.AnimationArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"AnimationCell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.AnimationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BasicAnimationViewController * basicAnimation = [[BasicAnimationViewController alloc]init];
        [self.navigationController pushViewController:basicAnimation animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
