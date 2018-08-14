//
//  DaoBusiness.m
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/14.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//

#import "DaoBusiness.h"
#import "AppDelegate.h"
#import "AccountList+CoreDataProperties.h"
#import "AccountDetail+CoreDataProperties.h"

@interface DaoBusiness ()
@property(nonatomic,strong)NSManagedObjectContext *mainContext;
@end

@implementation DaoBusiness

- (id)init{
    if (self = [super init]) {
        AppDelegate *delegate =(AppDelegate *) [[UIApplication sharedApplication]delegate];
        self.mainContext = delegate.persistentContainer.viewContext;
    }
    return self;
}

#pragma mark batch
- (void)batchInsert{
    for (int i = 0; i < 10000; i++) {
        AccountList *list = [NSEntityDescription insertNewObjectForEntityForName:@"AccountList" inManagedObjectContext:self.mainContext];
        list.date = [[NSDate date] description];
        list.money = @"$";
        list.isInCome = @"NO";
    }
    [self.mainContext save:nil]; 
}

- (void)batchUpdate{
    NSArray *dataArr = [self read];
    [dataArr enumerateObjectsUsingBlock:^(AccountList *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.date = [[NSDate date] description];
        obj.money = [NSString stringWithFormat:@"%zd",idx];
    }];
    [self.mainContext save:nil];
}

- (void)batchDelete{
    NSMutableArray *dataArr = [NSMutableArray arrayWithArray:[self read]];
    [dataArr enumerateObjectsUsingBlock:^(AccountList *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.mainContext deleteObject:[dataArr lastObject]];
    }];
    [self.mainContext save:nil];
}

-(NSArray *)batchRead{
    
    NSFetchRequest *result = [NSFetchRequest fetchRequestWithEntityName:@"AccountList"];
    NSAsynchronousFetchResult *results = (NSAsynchronousFetchResult *)[self.mainContext executeRequest:result error:nil];
    NSLog(@"resultarr:%@",results.finalResult);
    for (int i = 0; i < results.finalResult.count; i++) {
        NSLog(@"%@",[results.finalResult objectAtIndex:i]);
    }
    return results.finalResult;
}

#pragma mark per
- (void)insert{
    for (int i  = 0; i < 10000; i++) {
        AccountList *list = [NSEntityDescription insertNewObjectForEntityForName:@"AccountList" inManagedObjectContext:self.mainContext];
        list.date = [[NSDate date] description];
        list.money = @"$";
        list.isInCome = @"NO";
        [self.mainContext save:nil];   
    }
}

- (void)update:(NSArray *)dataArr{
    [dataArr enumerateObjectsUsingBlock:^(AccountList *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.date = [[NSDate date] description];
        obj.money = [NSString stringWithFormat:@"%zd",idx];
    }];
    [self.mainContext save:nil];
}

- (void)delete{
    NSMutableArray *dataArr = [NSMutableArray arrayWithArray:[self read]];
    [self.mainContext deleteObject:[dataArr lastObject]];
    [self.mainContext save:nil];
}

-(NSArray *)read{
    NSFetchRequest *result = [NSFetchRequest fetchRequestWithEntityName:@"AccountList"];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userid == %@",[UserModel sharedInstance].userId];
//    [fetchRequest setPredicate:predicate]; //过滤条件 
    [result setFetchLimit:10000];
    NSAsynchronousFetchResult *results = (NSAsynchronousFetchResult *)[self.mainContext executeRequest:result error:nil];
//    NSLog(@"resultarr:%@",results.finalResult);
//    for (int i = 0; i < results.finalResult.count; i++) {
//        NSLog(@"%@",[results.finalResult objectAtIndex:i]);
//    }
    return results.finalResult;
}


//- (void)createManagedObjectContext {
//    // 创建PSC实例对象，还是用上面Demo的实例化代码
//    NSPersistentStoreCoordinator *PSC = [[(AppDelegate *)[UIApplication sharedApplication].delegate persistentContainer] persistentStoreCoordinator];
//    
//    // 创建主队列MOC，用于执行UI操作
//    NSManagedObjectContext *mainMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    mainMOC.persistentStoreCoordinator = PSC;
//    
//    // 创建私有队列MOC，用于执行其他耗时操作，backgroundMOC并不需要设置PSC
//    NSManagedObjectContext *backgroundMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
//    backgroundMOC.parentContext = mainMOC;
//    
//    // 私有队列的MOC和主队列的MOC，在执行save操作时，都应该调用performBlock:方法，在自己的队列中执行save操作。
//    // 私有队列的MOC执行完自己的save操作后，还调用了主队列MOC的save方法，来完成真正的持久化操作，否则不能持久化到本地
//    [backgroundMOC performBlock:^{
//        [backgroundMOC save:nil];
//        
//        [mainMOC performBlock:^{
//            [mainMOC save:nil];
//        }];
//    }];
//    self.mainContext = mainMOC;
//    self.bgContext =  backgroundMOC;
//}


@end
