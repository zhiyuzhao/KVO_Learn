//
//  StudentKvoObserver.m
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import "StudentKvoObserver.h"
#import "Student.h"
@interface StudentKvoObserver()
@property (nonatomic, strong) Student* student;
@property (nonatomic, strong) NSMutableArray<NSString *> *keypaths;
@end

@implementation StudentKvoObserver
- (instancetype)initWithStudent:(Student *)str {
    self = [super init];
    if (self) {
        _student = str;
    }
    
    return self;
}

- (void)addObserverForKeyPath:(NSString *)keypath {
    [self.keypaths addObject:keypath];
    [_student addObserver:self forKeyPath:keypath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:(__bridge void*)self];
}


- (void)dealloc {
    for (NSString *keyPath in self.keypaths) {
        [_student removeObserver:self forKeyPath:keyPath];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == (__bridge void*)self) {
        NSLog(@"%@\n%@\n%@\n%@",keyPath,object,change,context);

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (NSMutableArray<NSString *> *)keypaths {
    if (_keypaths) {
        return _keypaths;
    }
    else {
        _keypaths = [[NSMutableArray alloc] init];
        return _keypaths;
    }
}
@end
