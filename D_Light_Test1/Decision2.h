//
//  Decision2.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Decision2 : ViewController

//Public Variables
- (IBAction)changeMinutes:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;

@end
