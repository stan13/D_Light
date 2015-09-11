//
//  ViewController2.h
//  D_Light_Test1
//
//  Created by Nathan Stanley on 14/08/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>


@interface ViewController2 : ViewController

@property (weak, nonatomic) IBOutlet UILabel *Scene2;
//@property (weak, nonatomic) IBOutlet UIImageView *Character;
@property (weak, nonatomic) IBOutlet UIImageView *face;
@property (weak, nonatomic) IBOutlet UIImageView *eyes;
@property (weak, nonatomic) IBOutlet UIImageView *hair;
- (IBAction)hair1:(UIButton *)sender;
- (IBAction)hair2:(UIButton *)sender;
- (IBAction)hair3:(UIButton *)sender;
- (IBAction)hair4:(UIButton *)sender;
- (IBAction)hair5:(UIButton *)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *hairImages;




//Public Variables

@end