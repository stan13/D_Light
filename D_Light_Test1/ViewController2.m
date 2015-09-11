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

//@property (strong, nonatomic) Character *character;
@property NSString *currentFace;
@property NSString *currentHair;


@end

@implementation ViewController2
//Methods
//Boy box
- (IBAction)chooseBoy:(id)sender {
    //Set userDefaults to boy
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"sex"];
    //change the picture to boy
    //self.Character.image = [UIImage imageNamed:@"boy1.png"];
}
//Girl box
- (IBAction)chooseGirl:(id)sender {
    //self.character.sex = 1;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"sex"];
    //change the picture to girl
    //self.Character.image = [UIImage imageNamed:@"girl1.jpeg"];
}
//random

//Eye Slider
- (IBAction)eyeSlider:(UISlider *)sender {
    
    CGFloat sliderVal = sender.value;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:sliderVal forKey:@"eyeHue"];
    
    self.face.image = [self changeImage:[UIImage imageNamed:@"eyes"] toColour:[UIColor colorWithHue:sliderVal saturation:0.5 brightness:0.5 alpha:1]];
}

//Skin Slider
- (IBAction)skinSlider:(UISlider *)sender {
    
    CGFloat sliderVal = sender.value;
    
    /*
     *These algorithms were obtained byusing two values from bitstrips.com/r/RK8C0
     *converting to RGB values and using algebra to determine a linear equation
     *to get these values with sliderVal from 0 to 1.
     */
    
    CGFloat r = (248.0 - 161.0*sliderVal)/255;
    CGFloat g = (205.0 - 150.0*sliderVal)/255;
    CGFloat b = (168.0 - 145.0*sliderVal)/255;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:r forKey:@"skinRed"];
    [userDefaults setFloat:g forKey:@"skinGreen"];
    [userDefaults setFloat:b forKey:@"skinBlue"];
    
    self.face.image = [self changeImage:[UIImage imageNamed:@"face"] toColour:[UIColor colorWithRed:r green:g blue:b alpha:1]];
}

//Hair Slider
- (IBAction)hairSlider:(UISlider *)sender {
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
        //self.Character.image = [UIImage imageNamed:@"boy1.png"];
        
    }
    else if (sex == 1) {
        //self.Character.image = [UIImage imageNamed:@"girl1.jpeg"];
        
    }
    
}



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
