//
//  AccountDetail+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/12.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//
//

#import "AccountDetail+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface AccountDetail (CoreDataProperties)

+ (NSFetchRequest<AccountDetail *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *price;

@end

NS_ASSUME_NONNULL_END
