//
//  ViewController.m
//  GDTensionView
//
//  Created by xiaoyu on 16/1/25.
//  Copyright © 2016年 Guoda. All rights reserved.
//

#import "ViewController.h"
#import "GDTensionView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) GDTensionView *GDView;
@end

@implementation ViewController
//1024:600
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.GDView = [[GDTensionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 600 * [UIScreen mainScreen].bounds.size.width/1024) WithImages:@"localImg"];

    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView = tableView1;
    tableView1.delegate = self;
    tableView1.dataSource = self;
    [self.view addSubview:tableView1];
    
    self.tableView.tableHeaderView = self.GDView;
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < 0) {
        if (offsetY > -100) {
            [self.GDView imageViewStretchingWithOffSet:offsetY];
        }
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.textLabel.text = @"GD666666";
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
