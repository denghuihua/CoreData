//
//  CoreDataDemoTests.m
//  CoreDataDemoTests
//
//  Created by huihuadeng on 2018/8/12.
//  Copyright © 2018年 huihuadeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DaoBusiness.h"

@interface CoreDataDemoTests : XCTestCase
@property(nonatomic, strong) DaoBusiness *dbSevice;
 
@end

@implementation CoreDataDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.dbSevice = [[DaoBusiness alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    NSDate *startDate = [NSDate date];
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
//        for (int i  = 0; i < 10000; i++) {
            [self.dbSevice insert];
//        }
    }];
}

- (void)testPerformanceUpdate{
    NSDate *startDate = [NSDate date];
    NSArray *dataArr = [self.dbSevice read];
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //        for (int i  = 0; i < 10000; i++) {
        [self.dbSevice update:dataArr];
        //        }
    }];
}


- (void)testPerformanceRead{
    NSDate *startDate = [NSDate date];
    [self measureBlock:^{
        [self.dbSevice read];
    }];
}
@end
