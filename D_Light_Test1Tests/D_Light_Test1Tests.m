//
//  D_Light_Test1Tests.m
//  D_Light_Test1Tests
//
//  Created by Nathan Stanley on 14/08/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//http://stackoverflow.com/questions/5625651/programmatically-fire-button-click-event
//http://www.preeminent.org/steve/iOSTutorials/XCTest/
//http://code.tutsplus.com/tutorials/introduction-to-testing-on-ios--cms-22394
#import "ViewController2.h"
#import "ViewController3.h"
#import "Decision1.h"
#import "Decision2.h"
#import "Decision3.h"
#import "Decision4.h"
#import "Decision5.h"
#import "Decision6.h"
#import "Decision7.h"
#import "Decision8.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface D_Light_Test1Tests : XCTestCase

@property (nonatomic) ViewController2 *charScreen;

@property (nonatomic) Decision1 *d1;
@property (nonatomic) Decision2 *d2;
@property (nonatomic) Decision3 *d3;
@property (nonatomic) Decision4 *d4;
@property (nonatomic) Decision5 *d5;
@property (nonatomic) Decision6 *d6;
@property (nonatomic) Decision7 *d7;
@property (nonatomic) Decision8 *d8;

@end

@implementation D_Light_Test1Tests

- (void)setUp {
    [super setUp];
//    self.charScreen = [[ViewController2 alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//CharCustomization tests: Setting Clothing, skin tone, hair and colors.
//after applying transformations and scaling to images it may produce 2 different pngs, thus rendering this test unusable.
//Best to check graphically via playthroughs
- (void)changeHair {
    self.charScreen = [[ViewController2 alloc] init];
    int i = 0;
    
    //only 2 hair options
    NSString *array[2] = {@"0 13 Hair Front 0 Short.png", @"0 13 Hair Front 1 Long.png"};
    
    for (UIButton *b in self.charScreen.hairImages){
        [b sendActionsForControlEvents: UIControlEventTouchUpInside];
        
        UIImage *currImage = self.charScreen.hair.image;
        UIImage *original = [UIImage imageNamed:array[i]];
        
        NSData *d1 = UIImagePNGRepresentation(currImage);
        NSData *d2 = UIImagePNGRepresentation(original);
        XCTAssertTrue([d1 isEqual:d2]);
        //XCTAssert(self.charScreen.);
        i++;
    }
}

    //Other tests: Check hp bar working as intended, quits when hp drops to 0,
    //check next button always disabled until an option has been chosen//
//- (void) testCanUseDefaultCharacter {
//	    self.charScreen1 = [[ViewController2 alloc] init];
//}


/*
 Progression tests to ensure player can only progress when user has made expected selections
 Decision1
 */
- (void) testSkipDecision1 {
	self.d1 = [[Decision1 alloc] init];
	XCTAssert(self.d1.nextButton.enabled == NO);
}

- (void) testDecision1ProgressionYes {
	self.d1 = [[Decision1 alloc] init];
	[self.d1.yesButton sendActionsForControlEvents:UIControlEventTouchDown];
	XCTAssertTrue(self.d1.nextButton.enabled == YES);
}

- (void) testDecision1ProgressionNo {
    self.d1 = [[Decision1 alloc] init];
    [self.d1.noButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d1.nextButton.enabled == YES);
}

//decision 2
- (void) testSkipDecision2 {
    self.d2 = [[Decision2 alloc] init];
    XCTAssertTrue(self.d2.nextButton.enabled == NO);
}
    
- (void) testDecision2ProgressionLess {
    self.d2 = [[Decision2 alloc] init];
    [self.d2.lessButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d2.nextButton.enabled == YES);
}

- (void) testDecision2ProgressionMore {
    self.d2 = [[Decision2 alloc] init];
    [self.d2.moreButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d2.nextButton.enabled == YES);
}
//decision 3
- (void) testSkipDecision3 {
    self.d3 = [[Decision3 alloc] init];
    XCTAssertTrue(self.d3.nextButton.enabled == NO);
}

- (void) testDecision3ProgressionInside {
    self.d3 = [[Decision3 alloc] init];
    [self.d3.insideButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d3.nextButton.enabled == YES);
}

- (void) testDecision3ProgressionOutside {
    self.d3 = [[Decision3 alloc] init];
    [self.d3.outsideButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d3.nextButton.enabled == YES);
}


//Decision 4 is at the beach choosing sun protection items, choosing no items is a legitimate choice here
- (void) testCanSkipDecision4 {
    self.d4 = [[Decision4 alloc] init];
    XCTAssertTrue(self.d4.nextButton.enabled == YES);
}

- (void) testDecision4ProgressionSunScreen {
    self.d4 = [[Decision4 alloc] init];
    [self.d4.SunscreenButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d4.nextButton.enabled == YES);
}
- (void) testDecision4ProgressionHat {
    self.d4 = [[Decision4 alloc] init];
    [self.d4.HatButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d4.nextButton.enabled == YES);
}
- (void) testDecision4ProgressionCover {
    self.d4 = [[Decision4 alloc] init];
    [self.d4.CoverButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d4.nextButton.enabled == YES);
}

//Decision 5
- (void) testSkipDecision5 {
    self.d5 = [[Decision5 alloc] init];
    XCTAssertTrue(self.d5.nextButton.enabled == NO);
}

- (void) testDecision5ProgressionMid {
    self.d5 = [[Decision5 alloc] init];
    [self.d5.middayButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d5.nextButton.enabled == YES);
}

- (void) testDecision5ProgressionAfternoon {
    self.d5 = [[Decision5 alloc] init];
    [self.d5.afternoonButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d5.nextButton.enabled == YES);
}

- (void) testDecision5ProgressionNight {
    self.d5 = [[Decision5 alloc] init];
    [self.d5.nightButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d5.nextButton.enabled == YES);
}

//Decision 6 foodplate
- (void) testSkipDecision6 {
    self.d6 = [[Decision6 alloc] init];
    XCTAssertTrue(self.d6.nextButton.enabled == NO);
}

//check for this manually
//- (void) testDecision6ProgressionFoodwNone {
//    self.d6 = [[Decision6 alloc] init];
//    [self.d6.foodWithNone sendActionsForControlEvents:UIControlEventTouchDown];
//    XCTAssertTrue(self.d6.nextButton.enabled == YES);
//}

//decision 7
-(void) testSkipDecision7 {
    self.d7 = [[Decision7 alloc] init];
    XCTAssertTrue(self.d7.nextButton.enabled == NO);
}

-(void) testDecision7More {
    self.d7 = [[Decision7 alloc] init];
    [self.d7.moreButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d7.nextButton.enabled == YES);
}
-(void) testDecision7Less {
    self.d7 = [[Decision7 alloc] init];
    [self.d7.lessButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d7.nextButton.enabled == YES);
}
-(void) testDecision7Same {
    self.d7 = [[Decision7 alloc] init];
    [self.d7.sameButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d7.nextButton.enabled == YES);
}

//Decision 8
-(void)testSkipDecision8 {
    self.d8 = [[Decision8 alloc] init];
    XCTAssertTrue(self.d8.nextButton.enabled == NO);
}
-(void) testDecision8More {
    self.d8 = [[Decision8 alloc] init];
    [self.d8.moreButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d8.nextButton.enabled == YES);
}
-(void) testDecision8Less {
    self.d8 = [[Decision8 alloc] init];
    [self.d8.lessButton sendActionsForControlEvents:UIControlEventTouchDown];
    XCTAssertTrue(self.d8.nextButton.enabled == YES);
}
	//visuals: char customization options stay throughout whole game
	//cannot go naked
	//can remove sunglasses/accessories
	//few sample paths to ensure all graphics remain throughout story, particularly beach scene where hat/sunscreen etc added
	
	//expected values of wearing different clothing options
	//making 5 failures, having all success, having 5 failures broken up by some success


- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

/* Notes from development
 Now all decisions are based on more/less rather then set amounts we no longer track sunResist and how clothing/skkin color affect that. This was all values are relative and more accurate to real world scenario

*/