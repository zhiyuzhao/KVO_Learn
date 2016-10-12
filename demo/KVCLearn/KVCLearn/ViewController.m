//
//  ViewController.m
//  KVCLearn
//
//  Created by zhiyu.zhao on 16/9/2.
//  Copyright © 2016年 BJF. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "PersonKvoObserver.h"
#import "Student.h"
#import "StudentKvoObserver.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *fp = [[Person alloc] init];
    fp.firstName = @"zhao";
    fp.lastName = @"laoda";
    
    Person *fri1 = [[Person alloc] init];
    fri1.firstName = @"wang";
    fri1.lastName = @"hao";
    
    Person *fri2 = [[Person alloc] init];
    fri2.firstName = @"chunge";
    fri2.lastName = @"li";

    
    Person *p = [[Person alloc] init];
    p.firstName = @"zhao";
    p.lastName = @"zhiyu";
    p.father = fp;
    p.friends = @[fri1, fri2];
    
    PersonKvoObserver *personKvoObserver = [[PersonKvoObserver alloc] initWithPerson:p];
    [personKvoObserver addObserverForKeyPath:@"fullName"];  // 属性关联
    [personKvoObserver addObserverForKeyPath:@"father.fullName"];   // 对象属性的属性
    [personKvoObserver addObserverForKeyPath:@"friends"];   // 对象数组
    [personKvoObserver addObserverForKeyPath:@"innerName"]; // 内部属性

    p.firstName = @"zhao1";
    p.lastName = @"zhiyu1";
    fp.lastName = @"laoda1";
    p.friends = @[fri1, fri2];
    [p setNewInnerName:@"newInnerNmame"];// 没有暴露的属性的get、set方法被调用时，也会发送通知

    // 对象属性
    Student *stu = [[Student alloc] init];
    stu.firstName = @"stu";
    stu.lastName = @"dent";
    stu.mark = @"65";
    [stu setValue:@"jiaozi" forKey:@"loveFood"];
    
    StudentKvoObserver *stuObserver = [[StudentKvoObserver alloc] initWithStudent:stu];
    [stuObserver addObserverForKeyPath:@"fullName"];// 子类继承属性依旧被监听
    [stuObserver addObserverForKeyPath:@"firstName"];   // 重写方法,不加super,依旧会监听kvo
    [stuObserver addObserverForKeyPath:@"mark"];   // 使用@synthesize将实例变量重命名
    [stuObserver addObserverForKeyPath:@"loveFood"];   // 重命名get方法
    [stuObserver addObserverForKeyPath:@"innerName"];

    stu.firstName = @"stu1";
    stu.lastName = @"dent1";
    stu.mark = @"85";
    [stu setValue:@"baozi" forKey:@"loveFood"];
    [stu setNewInnerName:@"newInnerNmame"];// 没有暴露的属性的get、set方法被调用时，也会发送通知
    
    
    // 1.通过多线程对值去改变
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        stu.lastName = @"stu_asyn_change";
    });
    
    
    // 2.在两个线程定义目标和观察者
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    __block Student *stu1 = nil;
    dispatch_async(concurrentQueue, ^{
        // 对象属性
        stu1 = [[Student alloc] init];
        NSLog(@"Student %@",[NSDate new]);

        stu1.lastName = @"yyyyyyy";
        
    });
    
    __block StudentKvoObserver *stuObserver1;
    dispatch_async(concurrentQueue, ^{
        sleep(2);

        stuObserver1 = [[StudentKvoObserver alloc] initWithStudent:stu1];
        [stuObserver1 addObserverForKeyPath:@"fullName"];// 子类继承属性依旧被监听
        NSLog(@" StudentKvoObserver %@",[NSDate new]);

    });
    
    dispatch_barrier_async(concurrentQueue, ^{
        NSLog(@"dispatch_barrier_async %@",[NSDate new]);
        NSLog(@"zzzzzz start%@",[NSDate new]);
        stu1.lastName = @"zzzzzz";
        NSLog(@"zzzzzz end%@",[NSDate new]);

    });

    
    sleep(100);
}


@end
