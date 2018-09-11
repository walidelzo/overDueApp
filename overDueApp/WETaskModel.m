//
//  WETaskModel.m
//  overDueApp
//
//  Created by walidelzo on 9/2/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "WETaskModel.h"

@implementation WETaskModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    self = [super init];
    }
    return self;
}

-(id)initWithName :(NSDictionary *)dictionary{
    self.taskName=dictionary[TASK_NAME];
    self.taskDetail=dictionary[TASK_DETAIAL];
    self.taskDate=dictionary[TASK_DATE];
    self.isComplete=[dictionary[TASK_ISCOMPLETE] boolValue] ;
    return self;
}


@end
