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

@property (nonatomic, strong) GDTensionView *netImageView;

@property (nonatomic, strong) UIView *NavbgImg;
@end

@implementation ViewController
//1024:600
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.GDView = [[GDTensionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 600 * [UIScreen mainScreen].bounds.size.width/1024) WithImages:@"localImg"];

//    self.NavbgImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
//    self.NavbgImg.image = [UIImage imageNamed:@"Shop_NavBackgroundImg"];
//    
//    [self.navigationController.navigationBar insertSubview:self.NavbgImg atIndex:0];
    
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Shop_NavBackgroundImg"] forBarMetrics:0];
//    NavigationAlpha_0
    self.navigationController.navigationBarHidden = YES;
    
    
    self.netImageView = [[GDTensionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 600*[UIScreen mainScreen].bounds.size.width/1024) WithImages:[NSURL URLWithString:@"http://ws.xzhushou.cn/focusimg/201508201549023.jpg"] PlaceholderImage:[UIImage imageNamed:@"localImg"]];
    
    
    
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView = tableView1;
    tableView1.delegate = self;
    tableView1.dataSource = self;
    [self.view addSubview:tableView1];
    
    //改这里
    self.tableView.tableHeaderView = self.netImageView;
    
    [self NavigationCustomBar];//自定义的导航栏
    
}
- (UIView *)NavigationCustomBar {
    
    
    self.NavbgImg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.NavbgImg.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.NavbgImg];

    return self.NavbgImg;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
#if 1
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY < -1) {
        if (offsetY > -100) {
            //修改本地
            [self.netImageView imageViewStretchingWithOffSet:offsetY];
            self.NavbgImg.hidden = YES;
        }
    }
    //导航栏
    if (offsetY > -19) {
//        CGFloat y = 600*[UIScreen mainScreen].bounds.size.width/1024;
        
        if (offsetY < 210) {
            self.NavbgImg.hidden = NO;
//            NSLog(@"%.2lf",y);
            self.NavbgImg.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.8 alpha:offsetY/210];
        }
        else{
            self.NavbgImg.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.8 alpha:1];
            
            self.NavbgImg.hidden = NO;
        }
        
    }else{
        self.NavbgImg.hidden = YES;
        
    }
#endif
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
