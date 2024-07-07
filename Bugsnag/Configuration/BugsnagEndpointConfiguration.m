//
//  BugsnagEndpointConfiguration.m
//  Bugsnag
//
//  Created by Jamie Lynch on 15/04/2020.
//  Copyright © 2020 Bugsnag. All rights reserved.
//

#import "BugsnagEndpointConfiguration.h"

@implementation BugsnagEndpointConfiguration

- (instancetype)init {
    if ((self = [super init])) {
        _notify = @"http://127.0.0.1:8000";
        _sessions = @"http://127.0.0.1:8000";
    }
    return self;
}

- (instancetype)initWithNotify:(NSString *)notify sessions:(NSString *)sessions {
    if ((self = [super init])) {
        _notify = notify;
        _sessions = sessions;
    }
    return self;
}
@end
