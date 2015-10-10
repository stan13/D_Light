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
@property NSString *currentTopString;

@property int currentBottom;
@property CGFloat currentBottomHue;
@property NSString *currentBottomString;
@property int currentShoes;
@property CGFloat currentShoeHue;
@property NSString *currentShoeString;
@property int currentGlasses;
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
    [self updateLook];
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
    //UIImage *temp = [UIImage imageNamed:[NSString stringWithFormat:@"%@Face",sexString]];
    //applies image with skin tone from presets
    //self.baseView.image = [self changeImage:temp toColour: [UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    
    /*
     self.face.image = [self changeImage:[UIImage imageNamed:self.currentFace] toColour:[UIColor colorWithRed:self.currentSkinRed green:self.currentSkinGreen blue:self.currentSkinBlue alpha:1]];
     self.hair.image = [self changeImage:[UIImage imageNamed:self.currentHair] toColour:[UIColor colorWithHue:self.currentHairHue saturation:0.5 brightness:0.5 alpha:1]];
     self.eyes.image = [self changeImage:[UIImage imageNamed:@"eyes"] toColour:[UIColor colorWithHue:self.currentEyeHue saturation:0.5 brightness:0.5 alpha:1]];
     */
    
    self.torsoView.image = [self changeImage:self.torsoView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.legsView.image = [self changeImage:self.legsView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.armsView.image = [self changeImage:self.armsView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.headView.image = [self changeImage:self.headView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    
    self.hairBackView.image = [self changeImage:self.hairBackView.image toColour:[UIColor colorWithHue:hairHue saturation:0.5 brightness:0.5 alpha:1]];
    self.hairFrontView.image = [self changeImage:self.hairFrontView.image toColour:[UIColor colorWithHue:hairHue saturation:0.5 brightness:0.5 alpha:1]];
    
    self.eyesView.image = [self changeImage:self.eyesView.image toColour:[UIColor colorWithHue:eyeHue saturation:0.5 brightness:0.5 alpha:1]];
    
    //default clothes
    //Top
    self.currentTop = 0;
    self.currentTopString = @"9000 6 Clothing Front 6 Singlet.png";
    self.currentTopHue = 0.5;

    //Bottom
    self.currentBottom = 0;
    self.currentBottomString = @"9000 6 Clothing Front 4 Shorts.png";
    self.currentBottomHue = 0.5;

    

}

- (void) updateLook
{
    //set top
    self.topView.image = [self changeImage:[UIImage imageNamed:self.currentTopString] toColour:[UIColor colorWithHue:self.currentTopHue saturation:0.7 brightness:0.8 alpha:1]];
    //set bottom
    self.bottomView.image = [self changeImage:[UIImage imageNamed:self.currentBottomString] toColour:[UIColor colorWithHue:self.currentBottomHue saturation:0.7 brightness:0.7 alpha:1]];
    //set shoes
    self.shoesView.image = [self changeImage:[UIImage imageNamed:self.currentShoeString] toColour:[UIColor colorWithHue:self.currentShoeHue saturation:0.7 brightness:0.7 alpha:1]];
    
    //set glasses
    if (self.currentGlasses == 1) {
        self.glassesView.image = [self changeImage:[UIImage imageNamed:@"9000 6 Clothing Front 2 Dress.png"] toColour:[UIColor colorWithHue:self.currentGlassesHue saturation:0.7 brightness:0.7 alpha:1]];
    } else {
        self.glassesView.image = nil;
    }
    //set hat
    if (self.currentHat == 1) {
        self.hatView.image = [self changeImage:[UIImage imageNamed:@"HAT_PNG_NAME"] toColour:[UIColor colorWithHue:self.currentHatHue saturation:0.7 brightness:0.7 alpha:1]];
    } else {
        self.hatView.image = nil;
    }
    
}



//BUTTONS
//Change tops
- (IBAction)Singlet:(UIButton *)sender {
    self.currentTop = 0;
    self.currentTopString = @"9000 6 Clothing Front 6 Singlet.png";
    [self updateLook];
}
- (IBAction)Shirt0:(UIButton *)sender {
    self.currentTop = 1;
    self.currentTopString = @"9000 6 Clothing Front 3 Shirt.png";
    [self updateLook];
}
- (IBAction)Shirt1:(UIButton *)sender {
    self.currentTop = 2;
    self.currentTopString = @"9000 6 Clothing Front 3 Shirt.png";
    [self updateLook];
}
//Change Bottoms
- (IBAction)Shorts0:(UIButton *)sender {
    self.currentBottom = 0;
    self.currentBottomString = @"9000 6 Clothing Front 4 Shorts.png";
    [self updateLook];
}
- (IBAction)Shorts1:(UIButton *)sender {
    self.currentBottom = 1;
    self.currentBottomString = @"9000 6 Clothing Front 4 Shorts.png";
    [self updateLook];
}
- (IBAction)Pants:(UIButton *)sender {
    self.currentBottom = 2;
    self.currentBottomString = @"9000 6 Clothing Front 4 Shorts.png";
    [self updateLook];
}
//Change Shoes
- (IBAction)Shoes0:(UIButton *)sender {
    self.currentShoes = 0;
    self.currentShoeString = @"9000 6 Clothing Front 2 Dress.png";
    [self updateLook];
}
- (IBAction)Shoes1:(UIButton *)sender {
    self.currentShoes = 1;
    self.currentShoeString = @"FILL IN SHOE STRING HERE";
    [self updateLook];
}
- (IBAction)Shoes2:(UIButton *)sender {
    self.currentShoes = 2;
    self.currentShoeString = @"FILL IN SHOE STRING HERE";
    [self updateLook];
}
//select glasses
- (IBAction)glasses:(UIButton *)sender {
    //Toggle glasses on or off
    if (self.currentGlasses == 0) {
        self.currentGlasses = 1;
    } else {
        self.currentGlasses = 0;
    }
    [self updateLook];
}
//select hat
- (IBAction)hat0:(UIButton *)sender {
    //Toggle hat on or off
    if (self.currentHat == 0) {
        self.currentHat = 1;
    } else {
        self.currentHat = 0;
    }
    [self updateLook];
}
- (IBAction)hat1:(UIButton *)sender {
}

//Colour Sliders
- (IBAction)topColorSlider:(UISlider *)sender {
    self.currentTopHue = sender.value;
    self.topView.image = [self changeImage:[UIImage imageNamed:self.currentTopString] toColour:[UIColor colorWithHue:self.currentTopHue saturation:0.7 brightness:0.8 alpha:1]];
}
- (IBAction)bottomColorSlider:(UISlider *)sender {
    self.currentBottomHue = sender.value;
    self.bottomView.image = [self changeImage:[UIImage imageNamed:self.currentBottomString] toColour:[UIColor colorWithHue:self.currentBottomHue saturation:0.7 brightness:0.7 alpha:1]];
}
- (IBAction)shoeColorSlider:(UISlider *)sender {
    self.currentShoeHue = sender.value;
    self.shoesView.image = [self changeImage:[UIImage imageNamed:self.currentShoeString] toColour:[UIColor colorWithHue:self.currentShoeHue saturation:0.7 brightness:0.7 alpha:1]];
}
- (IBAction)glassesColorSlider:(UISlider *)sender {
    self.currentGlassesHue = sender.value;
    //set glasses
    if (self.currentGlasses == 1) {
        self.glassesView.image = [self changeImage:[UIImage imageNamed:@"9000 6 Clothing Front 2 Dress.png"] toColour:[UIColor colorWithHue:self.currentGlassesHue saturation:0.7 brightness:0.7 alpha:1]];
    } else {
        self.glassesView.image = nil;
    }
}
- (IBAction)hatColorSlider:(UISlider *)sender {
    self.currentHatHue = sender.value;
    if (self.currentHat == 1) {
        self.hatView.image = [self changeImage:[UIImage imageNamed:@"HAT_PNG_NAME"] toColour:[UIColor colorWithHue:self.currentHatHue saturation:0.7 brightness:0.7 alpha:1]];
    } else {
        self.hatView.image = nil;
    }
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
    CGContextSetBlendMode(context, kCGBlendModeDarken);
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
