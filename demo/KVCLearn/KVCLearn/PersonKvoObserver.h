//
//  PersonKvoObserver.h
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface PersonKvoObserver : NSObject
- (instancetype)initWithPerson:(Person *)person;

- (void)addObserverForKeyPath:(NSString *)keypath;

@end
