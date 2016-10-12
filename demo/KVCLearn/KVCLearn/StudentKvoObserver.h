//
//  StudentKvoObserver.h
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;

@interface StudentKvoObserver : NSObject
- (instancetype)initWithStudent:(Student *)str;

- (void)addObserverForKeyPath:(NSString *)keypath;

@end
