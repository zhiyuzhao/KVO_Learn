//
//  Teacher.h
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import "Person.h"
#import "Student.h"

@interface Teacher : Person
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSArray<Student *> *student;
@end
