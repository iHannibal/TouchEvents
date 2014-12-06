//
//  ViewController.m
//  NSCoding
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "NSCAnimal.h"
#import "NSCDog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)save {
    
//    NSCAnimal *cat = [[NSCAnimal alloc] init];
//    cat.furColor = @"Brown";
//    cat.weight = 20;
//    cat.isFly = NO;
    NSCDog *dog = [[NSCDog alloc] init];
    dog.furColor = @"Yellow";
    dog.weight = 50;
    dog.isFly = NO;
    dog.legs = 4;
    
//    NSString *filePath = @"/Users/yons/Desktop/test.data";
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"test.data"];
    [NSKeyedArchiver archiveRootObject:dog toFile:filePath];
    NSLog(@"%@", filePath);
}

- (IBAction)read {
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"test.data"];
    
//    NSCAnimal *cat = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//    NSLog(@"%@", cat.furColor);
//    NSLog(@"%f", cat.weight);
//    NSLog(@"%d", cat.isFly);
    
    NSCDog *dog = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", dog.furColor);
    NSLog(@"%f", dog.weight);
    NSLog(@"%d", dog.isFly);
    NSLog(@"%d", dog.legs);
}
@end
