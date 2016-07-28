//
//  BallTeams.h
//  UISearchController
//
//  Created by ma c on 16/7/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BallTeams : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * image;
+(NSArray *)loadMessage;
+(NSArray*)allName;
@end
