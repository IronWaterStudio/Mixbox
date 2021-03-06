#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120000

#import "Xcode9_XCTest_CDStructures.h"
#import "Xcode9_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCTestCase, XCTestSuite;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTestObservation <NSObject>

@optional
- (void)testCaseDidFinish:(XCTestCase *)arg1;
- (void)testCase:(XCTestCase *)arg1 didFailWithDescription:(NSString *)arg2 inFile:(NSString *)arg3 atLine:(unsigned long long)arg4;
- (void)testCaseWillStart:(XCTestCase *)arg1;
- (void)testSuiteDidFinish:(XCTestSuite *)arg1;
- (void)testSuite:(XCTestSuite *)arg1 didFailWithDescription:(NSString *)arg2 inFile:(NSString *)arg3 atLine:(unsigned long long)arg4;
- (void)testSuiteWillStart:(XCTestSuite *)arg1;
- (void)testBundleDidFinish:(NSBundle *)arg1;
- (void)testBundleWillStart:(NSBundle *)arg1;
@end

#endif
