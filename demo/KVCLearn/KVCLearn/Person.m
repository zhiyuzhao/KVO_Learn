//
//  Person.m
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import "Person.h"
@interface Person ()
@property (nonatomic,strong) NSString *innerName;
@end
@implementation Person
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@%@",_firstName,_lastName];
}

+ (NSSet *)keyPathsForValuesAffectingFullName
{
    return [NSSet setWithObjects:@"firstName",@"lastName", nil];
}

- (void)setNewInnerName:(NSString *)str {
    self.innerName = str;// 通过get、set访问  触发KVO
//    [self setValue:str forKey:@"innerName"];// KVC方式,其实调用的也是setter方法 触发KVO
//    _innerName = str;// 直接访问成员变量，不触发KVO
}
@end
