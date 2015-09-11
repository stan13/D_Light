//
//  ViewController2.m
//  D_Light_Test1
//
//  Created by Nathan Stanley on 14/08/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController2.h"
#import "Character.h"

@interface ViewController2 ()
//Private Variables



@property NSString *currentFace;
@property NSString *currentHair;
@property int sex;
@property CGFloat currentEyeHue;
@property CGFloat currentSkinRed;
@property CGFloat currentSkinGreen;
@property CGFloat currentSkinBlue;
@property CGFloat currentHairHue;


@end

@implementation ViewController2
//Methods
//Boy box
- (IBAction)chooseBoy:(id)sender {
    
    //store values as variables
    self.sex = 0;
    self.currentFace = @"boyFace";
    self.face.image = [UIImage imageNamed:self.currentFace];
    self.currentHair = @"boyHair0";
    self.hair.image = [UIImage imageNamed:self.currentHair];
    
    //TODO change this to number of hair images
    for (int i=0; i<2; i++) {
        UIButton *hair = self.hairImages[i];
        hair.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"boyHair%i", i]];
    }
    
    [self setDefaults];
    [self updateLook];
}


//Girl box
- (IBAction)chooseGirl:(id)sender {
    
    //store values as variables
    self.sex = 1;
    self.currentFace = @"girlFace";
    self.face.image = [UIImage imageNamed:self.currentFace];
    self.currentHair = @"girlHair0";
    self.hair.image = [UIImage imageNamed:self.currentHair];
    
    
    //TODO change this to number of hair images
    for (int i=0; i<2; i++) {
        UIButton *hair = self.hairImages[i];
        hair.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"girlHair%i", i]];
    }
    
    [self setDefaults];
    [self updateLook];

}


//Eye Slider
- (IBAction)eyeSlider:(UISlider *)sender {
    
    self.currentEyeHue = sender.value;
    
    [self setDefaults];
    [self updateLook];
}

//Skin Slider
- (IBAction)skinSlider:(UISlider *)sender {
    
    CGFloat sliderVal = sender.value;
    
    /*
     *These algorithms were obtained byusing two values from bitstrips.com/r/RK8C0
     *converting to RGB values and using algebra to determine a linear equation
     *to get these values with sliderVal from 0 to 1.
     */

    self.currentSkinRed = (248.0 - 161.0*sliderVal)/255;
    self.currentSkinGreen = (205.0 - 150.0*sliderVal)/255;
    self.currentSkinBlue = (168.0 - 145.0*sliderVal)/255;
    
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
    //[self showDefaults];
    [self setUp];
}

-(void) setUp
{
    self.currentHair = @"boyHair1";
    self.currentFace = @"boyFace";
    [self updateLook];
}

/*- (void) showDefaults
{
    //self.boyOrGirl.textColor = [UIColor redColor];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger sex = [defaults integerForKey:@"sex"];
    if (sex == 0) {
        //self.Character.image = [UIImage imageNamed:@"boy1.png"];
        
    }
    else if (sex == 1) {
        //self.Character.image = [UIImage imageNamed:@"girl1.jpeg"];
        
    }
    
}*/



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

//updates the images based on what is stored in the variables
- (void) updateLook
{
    
    self.face.image = [self changeImage:[UIImage imageNamed:self.currentFace] toColour:[UIColor colorWithRed:self.currentSkinRed green:self.currentSkinGreen blue:self.currentSkinBlue alpha:1]];
    self.hair.image = [self changeImage:[UIImage imageNamed:self.currentHair] toColour:[UIColor colorWithHue:self.currentHairHue saturation:0.5 brightness:0.5 alpha:1]];
    self.eyes.image = [self changeImage:[UIImage imageNamed:@"eyes"] toColour:[UIColor colorWithHue:self.currentEyeHue saturation:0.5 brightness:0.5 alpha:1]];
}

//sets all user defaults based on variables
- (void) setDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.sex forKey:@"sex"];
    [defaults setFloat:self.currentEyeHue forKey:@"eyeHue"];
    [defaults setFloat:self.currentSkinRed forKey:@"skinRed"];
    [defaults setFloat:self.currentSkinGreen forKey:@"skinGreen"];
    [defaults setFloat:self.currentSkinBlue forKey:@"skinBlue"];
    [defaults setFloat:self.currentHairHue forKey:@"hairHue"];
}



- (IBAction)hair1:(UIButton *)sender {
    NSString *boyOrGirl;
    
    if (self.sex == 0) {
        boyOrGirl = @"boy";
    }else if (self.sex == 1){
        boyOrGirl = @"girl";
    }
    
    self.currentHair = [NSString stringWithFormat:@"%@Hair%i", boyOrGirl, 0];
    [self setDefaults];
    [self updateLook];
}

- (IBAction)hair2:(UIButton *)sender {
    NSString *boyOrGirl;
    
    if (self.sex == 0) {
        boyOrGirl = @"boy";
    }else if (self.sex == 1){
        boyOrGirl = @"girl";
    }
    
    self.currentHair = [NSString stringWithFormat:@"%@Hair%i", boyOrGirl, 1];
    [self setDefaults];
    [self updateLook];
}

- (IBAction)hair3:(UIButton *)sender {
}

- (IBAction)hair4:(UIButton *)sender {
}

- (IBAction)hair5:(UIButton *)sender {
}
@end
