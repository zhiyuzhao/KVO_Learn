//
//  Student.m
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import "Student.h"
@interface Student ()
@end

@implementation Student

@synthesize mark = abc;


-(void)dealloc {
    
}

- (void)setFirstName:(NSString *)firstName {
    NSLog(@"重写的setFirstName方法");
}

- (void)setLoveFood:(NSString *)food {
    NSLog(@"调用了lovefood set方法");
    loveFood = food;
}

- (NSString *)loveFood {
    NSLog(@"调用了lovefood get方法");
    return loveFood;
}

+ (BOOL) automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"lovefood"]) {
        return NO;
    }
    
    return [super automaticallyNotifiesObserversForKey:key];
}


- (void)setMark:(NSString *)newMark {
    abc = newMark;
}

- (NSString *)mark {
    
    return abc;
}
@end
