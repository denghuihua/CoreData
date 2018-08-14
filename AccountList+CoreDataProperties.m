//
//  AccountList+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/12.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//
//

#import "AccountList+CoreDataProperties.h"

@implementation AccountList (CoreDataProperties)

+ (NSFetchRequest<AccountList *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"AccountList"];
}

@dynamic date;
@dynamic money;
@dynamic isInCome;
@dynamic type;
@dynamic detail;

@end
