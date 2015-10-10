//
//  Decision7.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Decision7 : ViewController

@property (weak, nonatomic) IBOutlet UIButton *moreButton;
- (IBAction)chooseMore:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *sameButton;
- (IBAction)chooseSame:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *lessButton;
- (IBAction)chooseLess:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end