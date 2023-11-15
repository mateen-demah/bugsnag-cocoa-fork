/*
 * Copyright (c) 2014 HockeyApp, Bit Stadium GmbH.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#import "MarkUnhandledHandledScenario.h"
#import "Logging.h"

/**
 * Throw an uncaught Objective-C exception. It's possible to generate a better crash report here
 * compared to the C++ Exception case because NSUncaughtExceptionHandler can be used,
 * which isn't available for C++ extensions.
 */
@interface ObjCExceptionScenario : Scenario
@end

@implementation ObjCExceptionScenario

- (void)startBugsnag {
    self.config.autoTrackSessions = NO;
    [super startBugsnag];
}

- (void)run  __attribute__((noreturn)) {
    [[NSThread mainThread] setName:@"BSG MAIN THREAD"];
    @throw [NSException exceptionWithName:NSGenericException reason:@"An uncaught exception! SCREAM."
                                 userInfo:@{NSLocalizedDescriptionKey: @"I'm in your program, catching your exceptions!"}];
}

@end
