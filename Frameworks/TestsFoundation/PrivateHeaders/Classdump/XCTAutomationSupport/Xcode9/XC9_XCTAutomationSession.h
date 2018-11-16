#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120000

#import "XC9_XCTAutomationSupport_CDStructures.h"
#import "XC9_SharedHeader.h"
#import "XC9_XCTAutomationTarget.h"
#import "XC9_XCTConnectionAccepting.h"
#import <Foundation/Foundation.h>

@class XCTElementQueryProcessor;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTAutomationSession : NSObject <XCTConnectionAccepting, XCTAutomationTarget>
{
    NSMutableArray *_connections;
    XCTElementQueryProcessor *_queryProcessor;
}

@property(retain) XCTElementQueryProcessor *queryProcessor; // @synthesize queryProcessor=_queryProcessor;
@property(retain) NSMutableArray *connections; // @synthesize connections=_connections;
- (void)fetchMatchesForQuery:(id)arg1 reply:(CDUnknownBlockType)arg2;
- (void)requestHostAppExecutableNameWithReply:(CDUnknownBlockType)arg1;
- (_Bool)acceptNewConnection:(id)arg1;
- (id)init;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

#endif