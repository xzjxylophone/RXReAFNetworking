//
//  MainViewController.m
//  RXReAFNetworkingExample
//
//  Created by ceshi on 16/4/14.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "MainViewController.h"
#import "ReAFQueryStringPair.h"
@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - ReAFQueryStringPair
- (void)test_AFQueryStringPair
{
    
    NSString *nullKey = nil;
    NSString *otherKey = @"totalKey";
    NSDictionary *dic = @{@"key1":@"value1",
                          @"key2":@"value2"};
    
    NSArray *array = @[@"key1", @"key2", @"key3", @"key4"];
    
    NSSet *set = [NSSet setWithArray:array];
    
    
    
    //
    NSArray *resultArray = ReAFQueryStringPairsFromKeyAndValue(nullKey, dic);
    NSLog(@"resultArray:%@", resultArray);
    
    //
    resultArray = ReAFQueryStringPairsFromKeyAndValue(nullKey, array);
    NSLog(@"resultArray:%@", resultArray);
    
    //
    resultArray = ReAFQueryStringPairsFromKeyAndValue(nullKey, set);
    NSLog(@"resultArray:%@", resultArray);
    
    //
    resultArray = ReAFQueryStringPairsFromKeyAndValue(otherKey, dic);
    NSLog(@"resultArray:%@", resultArray);
    
    //
    resultArray = ReAFQueryStringPairsFromKeyAndValue(otherKey, array);
    NSLog(@"resultArray:%@", resultArray);
    
    
    //
    resultArray = ReAFQueryStringPairsFromKeyAndValue(otherKey, set);
    NSLog(@"resultArray:%@", resultArray);
    
    
    
    
}


- (void)test_AcceptLanguages
{
    NSMutableArray *acceptLanguagesComponents = [NSMutableArray array];
    [[NSLocale preferredLanguages] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        float q = 1.0f - (idx * 0.1f);
        [acceptLanguagesComponents addObject:[NSString stringWithFormat:@"%@;q=%0.1g", obj, q]];
        *stop = q <= 0.5f;
    }];
    
    NSString *str = [acceptLanguagesComponents componentsJoinedByString:@", "];
    NSLog(@"str:%@", str);
}







#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        sleep(2);
        [weakSelf test_AcceptLanguages];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
