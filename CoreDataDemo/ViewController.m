//
//  ViewController.m
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/12.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "AccountList+CoreDataProperties.h"
#import "AccountDetail+CoreDataProperties.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)NSManagedObjectContext *bgContext;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.dataArray = [NSMutableArray array];
    [self configTableView];
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(dataChanged:)
//                                                 name:NSManagedObjectContextObjectsDidChangeNotification
//                                               object:self.mainContext];
}


- (void)configTableView{
    //一开始数据库表中内容为空的时候，建立的结果映射没有任何意义，先保证建立数据库
    
    __weak typeof(self) weakSelf = self;
//    self.notification = [weakSelf.dataArray addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable changes, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"failed to open realm on background worker:%@",error);
//            return;
//        }
//
//        UITableView *tv = weakSelf.tableView;
//        if (!changes) {
//            [tv reloadData];
//            return;
//        }
//
//        [tv beginUpdates];
//        [tv deleteRowsAtIndexPaths:[changes deletionsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [tv insertRowsAtIndexPaths:[changes insertionsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [tv reloadRowsAtIndexPaths:[changes modificationsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [tv endUpdates];
//    }];
    
    [self addActionButtons];
    CGRect tableViewFrame = CGRectInset(self.view.frame, 0, 64);
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
}

-(void)addActionButtons{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    
    CGFloat buttonWidth = 60;
    CGFloat space = (self.view.frame.size.width - buttonWidth *3)/4;
    for (int i  = 0; i <3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        switch (i) {
            case 0:
            {
                [button setTitle:@"add" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(insert) forControlEvents:UIControlEventTouchUpInside];
            }
                break;
            case 1:
            {
                [button setTitle:@"update" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
                
            }
                break;
            case 2:
            {
                [button setTitle:@"delete" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
                
            }
                break;
                
            default:
                break;
        }
        button.frame = CGRectMake(space*(i + 1) + i *buttonWidth, 0, buttonWidth, 44);
        [view addSubview:button];
    }
    
}
#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"realmCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    AccountList *account = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = account.money;
    cell.detailTextLabel.text = account.date;
    return cell;
}


#pragma mark - actions

-(void)dataChanged:(NSManagedObjectContext *)context{

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
