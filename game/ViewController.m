//
//  ViewController.m
//  game
//
//  Created by wanrun on 2016/11/15.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH CGRectGetWidth(self.view.bounds)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *numberIndex;
@end

@implementation ViewController

- (NSArray *)DataSource {
    if (!_DataSource) {
        _DataSource = [[NSArray alloc] initWithObjects:@[@"Kris",@"fiona",@"nina",@"angela",@"alice"],@[@"momo",@"dad",@"ancle",@"aunt",@"grandpa"],@[@"heji",@"杨恩泽",@"魏恺",@"王自晟",@"邵永国",@"袁竹康"], nil];
    }
    return _DataSource;
}

- (NSMutableArray *)numberIndex {
    if (!_numberIndex) {
        _numberIndex = [NSMutableArray array];
    }
    return _numberIndex;
}
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.DataSource.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[self.numberIndex objectAtIndex:section] isEqualToString:@"1"]) {
        return [[self.DataSource objectAtIndex:section] count];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [[self.DataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
        
}

- (void)viewDidLoad {
    [super viewDidLoad];

    for (NSInteger i = 0; i < self.DataSource.count; ++i) {
        [self.numberIndex addObject:@"0"];

    }
    [self.view addSubview:self.tableview];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    NSArray *name = @[@"classmates",@"family",@"friends"];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, view.frame.size.width, 40);
    [btn setImage:[UIImage imageNamed:@"标签-向上箭头"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"标签-向下箭头"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:name[section] forState:UIControlStateNormal];
    [btn setTintColor:[UIColor blackColor]];
    btn.tag = section;
    [view addSubview:btn];
    return view;
}

- (void)btnClick:(UIButton *)sender{
    if ([[self.numberIndex objectAtIndex:sender.tag] isEqualToString:@"0"]) {
        [self.numberIndex replaceObjectAtIndex:sender.tag withObject:@"1" ];
    } else {
        [self.numberIndex replaceObjectAtIndex:sender.tag withObject:@"0"];
    }
    [self.tableview reloadData];

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

@end
