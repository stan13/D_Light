//
//  ViewController3.m
//  D_Light_Test1
//
//  Created by Nathan Stanley on 14/08/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
//Private Variables
//cust variables
@property int currentTop;
@property CGFloat currentTopHue;
@property int currentBottom;
@property CGFloat currentBottomHue;
@property int currentShoes;
@property CGFloat currentShoeHue;
@property int currentglasses;
@property CGFloat currentGlassesHue;
@property int currentHat;
@property CGFloat currentHatHue;
//loaded from defaults
@property NSInteger sex;


@end

@implementation ViewController3


//How to auto complete action based on previous userData
- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self setUp];
}

- (void) setUp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.sex = [defaults integerForKey:@"sex"];
    CGFloat eyeHue = [defaults floatForKey:@"eyeHue"];
    CGFloat skinRed = [defaults floatForKey:@"skinRed"];
    CGFloat skinGreen = [defaults floatForKey:@"skinGreen"];
    CGFloat skinBlue = [defaults floatForKey:@"skinBlue"];
    CGFloat hairHue = [defaults floatForKey:@"hairHue"];
    //set buttons to images based on gender
    NSString *sexString;
    if (self.sex == 1) {
        sexString = @"girl";
    } else {
        sexString = @"boy";
    }
    //sets up image for base
    UIImage *temp = [UIImage imageNamed:[NSString stringWithFormat:@"%@Face",sexString]];
    //applies image with skin tone from presets
    self.baseView.image = [self changeImage:temp toColour: [UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    
}


//BUTTONS
//Change tops
- (IBAction)Singlet:(UIButton *)sender {
}
- (IBAction)Shirt0:(UIButton *)sender {
}
- (IBAction)Shirt1:(UIButton *)sender {
}
//Change Bottoms
- (IBAction)Shorts0:(UIButton *)sender {
}
- (IBAction)Shorts1:(UIButton *)sender {
}
- (IBAction)Pants:(UIButton *)sender {
}
//Change Shoes
- (IBAction)Shoes0:(UIButton *)sender {
}
- (IBAction)Shoes1:(UIButton *)sender {
}
- (IBAction)Shoes2:(UIButton *)sender {
}
//select glasses
- (IBAction)glasses:(UIButton *)sender {
}
//select hat
- (IBAction)hat0:(UIButton *)sender {
}
- (IBAction)hat1:(UIButton *)sender {
}


//changes the colour of images - for eyes, hair, clothes etc
- (UIImage *) changeImage: (UIImage *)img toColour: (UIColor *)colour
{
    //code modified from https://coffeeshopped.com/2010/09/iphone-how-to-dynamically-color-a-uiimage
    
    UIGraphicsBeginImageContext(img.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [colour setFill];
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeOverlay);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, rect, img.CGImage);
    CGContextClipToMask(context, rect, img.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}


@end
