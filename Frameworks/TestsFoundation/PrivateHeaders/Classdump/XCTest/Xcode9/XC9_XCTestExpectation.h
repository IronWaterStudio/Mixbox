#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120000

#import "XC9_XCTest_CDStructures.h"
#import "XC9_SharedHeader.h"
#import <Foundation/Foundation.h>
#import <XCTest/XCTestExpectation.h>

@protocol XCTestExpectationDelegate;

@class XCTestExpectationImplementation, _XCTestExpectationImplementation;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTestExpectation ()
{
    id _internalImplementation;
}

+ (id)expectationWithDescription:(id)arg1;
@property(readonly) _XCTestExpectationImplementation *internalImplementation; // @synthesize internalImplementation=_internalImplementation;
- (void)cleanup;
@property _Bool hasBeenWaitedOn;
@property id <XCTestExpectationDelegate> delegate;
@property(readonly, copy) NSArray *fulfillCallStackReturnAddresses;
@property(readonly, copy) NSArray *creationCallStackReturnAddresses;
@property(readonly) _Bool fulfilled;
@property _Bool hasInverseBehavior;
@property(nonatomic) unsigned long long fulfillmentCount;
@property(readonly) unsigned long long fulfillmentToken;
@property(readonly) unsigned long long creationToken;
- (void)_queue_fulfillWithCallStackReturnAddresses:(id)arg1;
- (void)fulfill;
- (id)description;
@property(readonly, nonatomic) NSObject *delegateQueue;
@property(readonly, nonatomic) NSObject *queue;

- (id)init;

@end

#endif