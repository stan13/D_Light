//
//  ViewController2.m
//  D_Light_Test1
//
//  Created by Nathan Stanley on 14/08/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
//Private Variables


@end

@implementation ViewController2
//Methods
//Boy box
- (IBAction)chooseBoy:(id)sender {
    //Set userDefaults to boy
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"sex"];
    //change the picture to boy
    self.Character.image = [UIImage imageNamed:@"boy1.png"];
}
//Girl box
- (IBAction)chooseGirl:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"sex"];
    //change the picture to girl
    self.Character.image = [UIImage imageNamed:@"girl1.jpeg"];
}
//random

//Eye Slider
- (IBAction)eyeSlider:(id)sender {
    
}

//Skin Slider
- (IBAction)skinSlider:(id)sender {
}

//Hair Slider
- (IBAction)hairSlider:(id)sender {
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showDefaults];
}
- (void) showDefaults
{
    //self.boyOrGirl.textColor = [UIColor redColor];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger sex = [defaults integerForKey:@"sex"];
    if (sex == 0) {
        self.Character.image = [UIImage imageNamed:@"boy1.png"];
        
    }
    else if (sex == 1) {
        self.Character.image = [UIImage imageNamed:@"girl1.jpeg"];
        
    }
    
}







@end
