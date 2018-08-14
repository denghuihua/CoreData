//
//  DaoBusiness.h
//  CoreDataDemo
//
//  Created by huihuadeng on 2018/8/14.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaoBusiness : NSObject
- (void)insert;
- (void)update:(NSArray *)dataArr;
-(NSArray *)read;

- (void)batchInsert;
@end
