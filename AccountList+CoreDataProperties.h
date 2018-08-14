//
//  AccountList+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/12.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//
//

#import "AccountList+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface AccountList (CoreDataProperties)

+ (NSFetchRequest<AccountList *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *date;
@property (nullable, nonatomic, copy) NSString *money;
@property (nullable, nonatomic, copy) NSString *isInCome;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) AccountDetail *detail;

@end

NS_ASSUME_NONNULL_END
