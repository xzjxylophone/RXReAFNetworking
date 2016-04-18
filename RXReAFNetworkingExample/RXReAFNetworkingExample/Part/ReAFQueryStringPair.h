//
//  ReAFQueryStringPair.h
//  RXReAFNetworkingExample
//
//  Created by ceshi on 16/4/17.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <Foundation/Foundation.h>


NSArray * ReAFQueryStringPairsFromKeyAndValue(NSString *key, id value);


@interface ReAFQueryStringPair : NSObject


@property (readwrite, nonatomic, strong) id field;
@property (readwrite, nonatomic, strong) id value;

- (instancetype)initWithField:(id)field value:(id)value;


@end
