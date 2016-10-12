//
//  Person.h
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong, readonly) NSString *fullName;


@property (nonatomic, strong) Person *father;
@property (nonatomic, strong) NSArray<Person *> *friends;


- (void)setNewInnerName:(NSString *)str;
@end
