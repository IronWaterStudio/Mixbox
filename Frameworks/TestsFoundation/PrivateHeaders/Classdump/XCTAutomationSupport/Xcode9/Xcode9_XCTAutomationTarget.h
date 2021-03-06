#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120000

#import "Xcode9_XCTAutomationSupport_CDStructures.h"
#import "Xcode9_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCTElementQuery, XCTElementQueryResults;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTAutomationTarget <NSObject>
- (void)fetchMatchesForQuery:(XCTElementQuery *)arg1 reply:(void (^)(XCTElementQueryResults *, NSError *))arg2;
- (void)requestHostAppExecutableNameWithReply:(void (^)(NSString *))arg1;
@end

#endif
