//
//  WETaskModel.h
//  overDueApp
//
//  Created by walidelzo on 9/2/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WETaskModel : NSObject
@property (strong,nonatomic) NSString *taskName;
@property (strong,nonatomic) NSString *taskDetail;
@property (strong,nonatomic) NSDate *taskDate;
@property (nonatomic) Boolean isComplete;
-(id)initWithName :(NSDictionary *)dictionary ;
@end
