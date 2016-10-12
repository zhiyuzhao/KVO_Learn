//
//  PersonKvoObserver.m
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import "PersonKvoObserver.h"
#import "Person.h"

@interface PersonKvoObserver ()
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) NSMutableArray<NSString *> *keypaths;

@end
@implementation PersonKvoObserver
- (instancetype)initWithPerson:(Person *)person
{
    self = [super init];
    if (self) {
        _person = person;
        
    }
    return self;
}

- (void)addObserverForKeyPath:(NSString *)keypath {
    [self.keypaths addObject:keypath];

    [_person addObserver:self forKeyPath:keypath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void*)self];

}

- (void)dealloc {
    for (NSString *keyPath in self.keypaths) {
        [_person removeObserver:self forKeyPath:keyPath];
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == (__bridge void*)self) {
        NSLog(@"%@\n%@\n%@\n%@",keyPath,object,change,context);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
