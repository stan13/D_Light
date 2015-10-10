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



@property NSString *currentFace;
@property NSString *currentHair;
@property NSString *currentHairBack;
@property int currentHairInt;
@property int currentHeadInt;
@property CGFloat currentEyeHue;
@property CGFloat currentSkinRed;
@property CGFloat currentSkinGreen;
@property CGFloat currentSkinBlue;
@property CGFloat currentHairHue;
@property CGFloat currentSkinTone;

@end

@implementation ViewController2
//Methods



//Eye Slider
- (IBAction)eyeSlider:(UISlider *)sender {
    
    self.currentEyeHue = sender.value;
    
    [self setDefaults];
    [self updateLook];
}

//Skin Slider
- (IBAction)skinSlider:(UISlider *)sender {
    
    self.currentSkinTone = sender.value;
    
    /*
     *These algorithms were obtained byusing two values from bitstrips.com/r/RK8C0
     *converting to RGB values and using algebra to determine a linear equation
     *to get these values with sliderVal from 0 to 1.
     */

    self.currentSkinRed = (248.0 - 161.0*self.currentSkinTone)/255;
    self.currentSkinGreen = (205.0 - 150.0*self.currentSkinTone)/255;
    self.currentSkinBlue = (168.0 - 145.0*self.currentSkinTone)/255;
    
    [self setDefaults];
    [self updateLook];
}

//Hair Slider
- (IBAction)hairSlider:(UISlider *)sender {
    
    self.currentHairHue = sender.value;
    
    [self setDefaults];
    [self updateLook];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self setUp];
}

-(void) setUp
{
    self.currentHair = @"0 13 Hair Front 0 Short.png";
    self.currentHairBack = @"";
    self.currentFace = @"0 7 Head 0 Default.png";
    
    self.currentSkinRed = 167.5/255;
    self.currentSkinGreen = 130.0/255;
    self.currentSkinBlue = 95.5/255;
    self.currentSkinTone = 0.5;
    self.currentHairHue = 0.5;
    self.currentEyeHue = 0.5;
    self.currentHairInt = 0;
    self.currentHeadInt = 0;
    
    [self setDefaults];
    [self updateLook];
}




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

//updates the images based on what is stored in the variables
- (void) updateLook
{
    
    self.face.image = [self changeImage:[UIImage imageNamed:self.currentFace] toColour:[UIColor colorWithRed:self.currentSkinRed green:self.currentSkinGreen blue:self.currentSkinBlue alpha:1]];
    self.hair.image = [self changeImage:[UIImage imageNamed:self.currentHair] toColour:[UIColor colorWithHue:self.currentHairHue saturation:0.5 brightness:0.5 alpha:1]];
    if(self.currentHairInt == 1){
        self.hairBack.image = [self changeImage:[UIImage imageNamed:self.currentHairBack] toColour:[UIColor colorWithHue:self.currentHairHue saturation:0.5 brightness:0.5 alpha:1]];
    } else {
        self.hairBack.image = nil;
    }
    self.eyes.image = [self changeImage:[UIImage imageNamed:@"0 10 Eye Pupils 0 Default"] toColour:[UIColor colorWithHue:self.currentEyeHue saturation:0.5 brightness:0.5 alpha:1]];
    

}

//sets all user defaults based on variables
- (void) setDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.currentEyeHue forKey:@"eyeHue"];
    [defaults setFloat:self.currentSkinRed forKey:@"skinRed"];
    [defaults setFloat:self.currentSkinGreen forKey:@"skinGreen"];
    [defaults setFloat:self.currentSkinBlue forKey:@"skinBlue"];
    [defaults setFloat:self.currentSkinTone forKey:@"skinTone"];
    [defaults setFloat:self.currentHairHue forKey:@"hairHue"];
    [defaults setInteger:self.currentHairInt forKey:@"hair"];
    [defaults setInteger:self.currentHeadInt forKey:@"head"];
}


// CHange hair styles
- (IBAction)hair1:(UIButton *)sender {
   
    
    self.currentHair = @"0 13 Hair Front 0 Short.png";
    self.currentHairBack = @"";
    self.currentHairInt = 0;
    [self setDefaults];
    [self updateLook];
}

- (IBAction)hair2:(UIButton *)sender {

    self.currentHair = @"0 13 Hair Front 1 Long.png";
    self.currentHairBack = @"0 0 Hair Back 1 Long.png";
    self.currentHairInt = 1;
    [self setDefaults];
    [self updateLook];
}

- (IBAction)hair3:(UIButton *)sender {
}

- (IBAction)hair4:(UIButton *)sender {
}

//Change head shapes
- (IBAction)head1:(UIButton *)sender {
    self.currentFace = @"0 7 Head 0 Default.png";
    self.currentHeadInt = 0;
    [self setDefaults];
    [self updateLook];
}

- (IBAction)head2:(UIButton *)sender {
    self.currentFace = @"0 7 Head 1 Egg.png";
    self.currentHeadInt = 1;
    [self setDefaults];
    [self updateLook];
}


- (IBAction)eyelashes:(UISwitch *)sender {
    
}
@end
