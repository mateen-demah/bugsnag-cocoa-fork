//
//  CxxUnexpectedScenario.mm
//  iOSTestApp
//
//  Created by Delisa Fuller on 2/24/22.
//  Copyright © 2022 Bugsnag. All rights reserved.
//

#import "Scenario.h"
#import "Logging.h"
#import <stdexcept>

@interface CxxUnexpectedScenario : Scenario
@end

@implementation CxxUnexpectedScenario

- (void)run {
    [[NSThread mainThread] setName:@"BSG MAIN THREAD"];
    std::unexpected();
}

@end
