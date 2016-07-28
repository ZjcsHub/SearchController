//
//  BallTeams.m
//  UISearchController
//
//  Created by ma c on 16/7/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "BallTeams.h"

@implementation BallTeams
+(NSArray *)loadMessage{
    NSArray *dataArr =[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"]];
    NSMutableArray * arr =[NSMutableArray array];
    for (NSDictionary * dict in dataArr) {
        BallTeams * ball =[[BallTeams alloc] init];
        [ball setValuesForKeysWithDictionary:dict];
        [arr addObject:ball];
    }
    return arr;
}
+(NSArray*)allName{
    NSMutableArray * arr =[NSMutableArray array];
    for (BallTeams * ball in [self loadMessage]) {
        [arr addObject:ball.name];
    }
    return arr;
}

@end
