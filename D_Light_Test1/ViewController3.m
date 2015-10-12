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
@property NSString *currentGlassesString;
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
    NSInteger headType = [defaults integerForKey:@"head"];
    NSString *currentHead;
    if (headType == 0) {
        currentHead = @"1 7 Head 0 Default.png";
    } else {
        currentHead = @"1 7 Head 1 Egg.png";
    }
    NSInteger hairType = [defaults integerForKey:@"hair"];
    NSString *currentHair, *currentHairBack;
    if (hairType == 0) {
        currentHair = @"1 13 Hair Front 0 Short.png";
        currentHairBack = nil;
    } else if (hairType == 1) {
        currentHair = @"1 13 Hair Front 1 Long.png";
        currentHairBack = @"1 0 Hair Back 1 Long.png";
    } else if (hairType == 2) {
        currentHair = @"1 13 Hair Front 2 Short B.png";
        currentHairBack = nil;
    } else {
        currentHair = @"1 13 Hair Front 3 Long B.png";
        currentHairBack = @"1 0 Hair Back 3 Long B.png";
    }
    
    //Set up images that wont be changed
    self.torsoView.image = [self changeImage:self.torsoView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.legsView.image = [self changeImage:self.legsView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.armsView.image = [self changeImage:self.armsView.image toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.headView.image = [self changeImage:[UIImage imageNamed:currentHead] toColour:[UIColor colorWithRed:skinRed green:skinGreen blue:skinBlue alpha:1]];
    self.hairBackView.image = [self changeImage:[UIImage imageNamed:currentHairBack] toColour:[UIColor colorWithHue:hairHue saturation:0.7 brightness:0.7 alpha:1]];
    self.hairFrontView.image = [self changeImage:[UIImage imageNamed:currentHair] toColour:[UIColor colorWithHue:hairHue saturation:0.7 brightness:0.7 alpha:1]];
    
    self.eyesView.image = [self changeImage:self.eyesView.image toColour:[UIColor colorWithHue:eyeHue saturation:0.7 brightness:0.7 alpha:1]];
    
    //default clothes
    //Top
    self.currentTop = 0; //singlet
    self.currentTopString = @"1 6 Clothing Front 6 Singlet.png";
    self.currentTopHue = 0.5;

    //Bottom
    self.currentBottom = 1; //shorts
    self.currentBottomString = @"1 6 Clothing Front 4 Shorts.png";
    self.currentBottomHue = 0.5;
    
    //Glasses
    self.currentGlasses = -1; //none
    self.currentGlassesString = nil;
    self.currentGlassesHue = 0.5;
    
    //Shoes
    self.currentShoes = 1; //thongs
    self.currentShoeString = @"1 4 Shoes 1 Thongs.png";
    self.currentShoeHue = 0.5;
    
    //Hat
    self.currentHat = -1; //none
    self.currentHatHue = 0.5;

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
    self.glassesView.image = [self changeImage:[UIImage imageNamed:self.currentGlassesString] toColour:[UIColor colorWithHue:self.currentGlassesHue saturation:0.7 brightness:0.7 alpha:1]];
    //set hat
    if (self.currentHat == 1) {
        self.hatView.image = [self changeImage:[UIImage imageNamed:@"1 15 Hat 1 Wide-brimmed.png"] toColour:[UIColor colorWithHue:self.currentHatHue saturation:0.7 brightness:0.5 alpha:1]];
    } else {
        self.hatView.image = nil;
    }
}

- (void) setDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //Set top
    [defaults setInteger:self.currentTop forKey:@"top"];
    [defaults setFloat:self.currentTopHue forKey:@"topHue"];
    //Set bottom
    [defaults setInteger:self.currentBottom forKey:@"bottom"];
    [defaults setFloat:self.currentBottomHue forKey:@"bottomHue"];
    //Set Glasses
    [defaults setInteger:self.currentGlasses forKey:@"glasses"];
    [defaults setFloat:self.currentGlassesHue forKey:@"glassesHue"];
    //Set Hat
    [defaults setInteger:self.currentHat forKey:@"hat"];
    [defaults setFloat:self.currentHatHue forKey:@"hatHue"];
    //Set Shoes
    [defaults setInteger:self.currentShoes forKey:@"shoes"];
    [defaults setFloat:self.currentShoeHue forKey:@"shoeHue"];

}

//BUTTONS
//Change to Dress
- (IBAction)Dress:(UIButton *)sender {
    self.currentTop = 2;
    self.currentTopString = @"1 6 Clothing Front 2 Dress.png";
    self.currentBottomString = nil;
    self.currentBottom = 0;
    [self updateLook];
}

- (IBAction)Singlet:(UIButton *)sender {
    self.currentTop = 0;
    self.currentTopString = @"1 6 Clothing Front 6 Singlet.png";
    if (self.currentBottom == 0) {
        self.currentBottomString = @"1 6 Clothing Front 4 Shorts.png";
        self.currentBottom = 1;
    }
    [self updateLook];
}

- (IBAction)Shirt:(UIButton *)sender {
    self.currentTop = 1;
    self.currentTopString = @"1 6 Clothing Front 3 Shirt.png";
    if (self.currentBottom == 0) {
        self.currentBottomString = @"1 6 Clothing Front 4 Shorts.png";
        self.currentBottom = 1;
    }
    [self updateLook];
}

//Change Bottoms
- (IBAction)Shorts0:(UIButton *)sender {
    self.currentBottom = 1;
    self.currentBottomString = @"1 6 Clothing Front 4 Shorts.png";
    [self updateLook];
}
- (IBAction)Pants:(UIButton *)sender {
    self.currentBottom = 2;
    self.currentBottomString = @"1 6 Clothing Front 8 Pants.png";
    [self updateLook];
}
//Change Shoes
- (IBAction)Shoes0:(UIButton *)sender {
    self.currentShoes = 1;
    self.currentShoeString = @"1 4 Shoes 1 Thongs.png";
    [self updateLook];
}
- (IBAction)Shoes1:(UIButton *)sender {
    self.currentShoes = 2;
    self.currentShoeString = @"1 4 Shoes 2 Shoes A.png";
    [self updateLook];
}
- (IBAction)Shoes2:(UIButton *)sender {
    self.currentShoes = 3;
    self.currentShoeString = @"1 4 Shoes 3 Shoes B.png";
    [self updateLook];
}
//select glasses
- (IBAction)Glasses0:(UIButton *)sender {
    if (self.currentGlasses == 1) {
        self.currentGlasses = -1;
        self.currentGlassesString = nil;
    } else {
        self.currentGlasses = 1;
        self.currentGlassesString = @"1 14 Accessories 1 Aviators.png";
    }
    [self updateLook];
}
- (IBAction)Glasses1:(UIButton *)sender {
    if (self.currentGlasses == 2) {
        self.currentGlasses = -1;
        self.currentGlassesString = nil;
    } else {
        self.currentGlasses = 2;
        self.currentGlassesString = @"1 14 Accessories 2 Ray Bans.png";
    }
    [self updateLook];
}

//select hat
- (IBAction)Hat:(UIButton *)sender {
    //Toggle hat on or off
    if (self.currentHat == -1) {
        self.currentHat = 1;
    } else {
        self.currentHat = -1;
    }
    [self updateLook];
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
    if (self.currentGlasses != -1) {
        self.glassesView.image = [self changeImage:[UIImage imageNamed:self.currentGlassesString] toColour:[UIColor colorWithHue:self.currentGlassesHue saturation:0.7 brightness:0.7 alpha:1]];
    } else {
        self.glassesView.image = nil;
    }
}
- (IBAction)hatColorSlider:(UISlider *)sender {
    self.currentHatHue = sender.value;
    if (self.currentHat == 1) {
        self.hatView.image = [self changeImage:[UIImage imageNamed:@"1 15 Hat 1 Wide-brimmed.png"] toColour:[UIColor colorWithHue:self.currentHatHue saturation:0.7 brightness:0.5 alpha:1]];
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
- (IBAction)NextButton:(UIButton *)sender {
    [self setDefaults];
}
@end