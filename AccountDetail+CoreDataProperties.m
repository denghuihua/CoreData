//
//  AccountDetail+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/12.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//
//

#import "AccountDetail+CoreDataProperties.h"

@implementation AccountDetail (CoreDataProperties)

+ (NSFetchRequest<AccountDetail *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"AccountDetail"];
}

@dynamic name;
@dynamic price;

@end
