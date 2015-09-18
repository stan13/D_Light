//
//  Decision3.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface Decision3 : ViewController

//Public Variables
@property (weak, nonatomic) IBOutlet UIButton *insideButton;
@property (weak, nonatomic) IBOutlet UIButton *outsideButton;
- (IBAction)chooseInside:(UIButton *)sender;
- (IBAction)chooseOutside:(UIButton *)sender;

@end

