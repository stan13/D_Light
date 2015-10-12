//
//  Decision7.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision7.h"

@interface Decision7 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Decision7

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    self.nextButton.enabled = NO;
    [self healthBar];
    [self characterSettings:1];

}

- (IBAction)chooseMore:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor grayColor];
    self.sameButton.backgroundColor = [UIColor clearColor];
    self.lessButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"timeInSunSmoke"];
}
- (IBAction)chooseSame:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor clearColor];
    self.sameButton.backgroundColor = [UIColor grayColor];
    self.lessButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"timeInSunSmoke"];
}
- (IBAction)chooseLess:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor clearColor];
    self.sameButton.backgroundColor = [UIColor clearColor];
    self.lessButton.backgroundColor = [UIColor grayColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:3 forKey:@"timeInSunSmoke"];
}
//Function that loads health bar
- (void) healthBar {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger health = [defaults integerForKey:@"health"];
    //check that health not over boundaries
    if (health < 0) {
        health = 0;
    }
    if (health > 10) {
        health = 10;
    }
    [defaults setInteger:health forKey:@"health"];
    //make rectangle inside - green with size = health*40
    UIImageView *healthAmount = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, health*39, 24)];
    if (health <= 3) {
        healthAmount.backgroundColor = [UIColor redColor];
    } else {
        healthAmount.backgroundColor = [UIColor greenColor];
    }
    [self.HeathBar addSubview:healthAmount];
}

- (void)characterSettings: (int)scene {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //cape 1
    //self.capeBack.image = [self changeImage:[UIImage imageNamed:@"1 1 Clothing Back 1 Cape.png"] toColour:[UIColor colorWithHue:0.7 saturation:0.5 brightness:0.5 alpha:1]];
    //skin 2,3,5,7
    UIColor *skinColour = [UIColor colorWithRed:[defaults floatForKey:@"skinRed"] green:[defaults floatForKey:@"skinGreen"] blue:[defaults floatForKey: @"skinBlue"] alpha:1.0];
    int head = (int)[defaults integerForKey:@"head"];
    self.skinArms.image = [self changeImage:[UIImage imageNamed:@"1 5 Arms 0 Default.png"] toColour:skinColour];
    self.skinLegs.image = [self changeImage:[UIImage imageNamed:@"1 3 Legs 0 Default.png"] toColour:skinColour];
    self.torso.image = [self changeImage:[UIImage imageNamed:@"1 2 Torso 0 Default.png"] toColour:skinColour];
    //head
    if (head == 0) {
        self.skinHead.image = [self changeImage:[UIImage imageNamed:@"1 7 Head 0 Default.png"] toColour:skinColour];
    }else if(head == 1){
        self.skinHead.image = [self changeImage:[UIImage imageNamed:@"1 7 Head 1 Egg.png"] toColour:skinColour];
    }
    //Hair 0,13
    UIColor *hairColour = [UIColor colorWithHue:[defaults floatForKey:@"hairHue"] saturation:0.7 brightness:0.7 alpha:1];
    int hair = (int)[defaults integerForKey:@"hair"];
    switch (hair) {
        case 0:
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"1 13 Hair Front 0 Short.png"] toColour:hairColour];
            break;
        case 1:
            self.hairBack.image = [self changeImage:[UIImage imageNamed:@"1 0 Hair Back 1 Long.png"] toColour:hairColour];
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"1 13 Hair Front 1 Long.png"] toColour:hairColour];
            break;
        case 2:
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"1 13 Hair Front 2 Short B.png"] toColour:hairColour];
            break;
        case 3:
            self.hairBack.image = [self changeImage:[UIImage imageNamed:@"1 0 Hair Back 3 Long B.png"] toColour:hairColour];
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"1 13 Hair Front 3 Long B.png"] toColour:hairColour];
            break;
        default:
            break;
    }
    //Shoes 4
    int shoesInt = (int)[defaults integerForKey:@"shoes"];
    UIColor *shoeColor = [UIColor colorWithHue:[defaults floatForKey:@"shoeHue"] saturation:0.7 brightness:0.7 alpha:1];
    switch (shoesInt) {
        case 1:
            self.shoes.image = [self changeImage:[UIImage imageNamed:@"1 4 Shoes 1 Thongs.png"] toColour:shoeColor];
            break;
        case 2:
            self.shoes.image = [self changeImage:[UIImage imageNamed:@"1 4 Shoes 2 Shoes A.png"] toColour:shoeColor];
            break;
        case 3:
            self.shoes.image = [self changeImage:[UIImage imageNamed:@"1 4 Shoes 3 Shoes B.png"] toColour:shoeColor];
            break;
    }
    //clothing top 6B
    UIColor *topColor = [UIColor colorWithHue:[defaults floatForKey:@"topHue"] saturation:0.7 brightness:0.8 alpha:1];
    int topInt = (int)[defaults integerForKey:@"top"];
    switch (topInt) {
        case 2: //dress
            self.top.image = [self changeImage:[UIImage imageNamed:@"1 6 Clothing Front 2 Dress.png"] toColour:topColor];
            break;
        case 0: //singlet
            self.top.image = [self changeImage:[UIImage imageNamed:@"1 6 Clothing Front 6 Singlet.png"] toColour:topColor];
            break;
        case 1: //shirt
            self.top.image = [self changeImage:[UIImage imageNamed:@"1 6 Clothing Front 3 Shirt.png"] toColour:topColor];
            break;
    }
    //clothing bot 6A
    UIColor *bottomColor = [UIColor colorWithHue:[defaults floatForKey:@"bottomHue"] saturation:0.7 brightness:0.7 alpha:1];
    int bottomInt = (int)[defaults integerForKey:@"bottom"];
    switch (bottomInt) {
        case 0: //dress
            self.bottom.image = [self changeImage:nil toColour:nil];
            break;
        case 1: //shorts
            self.bottom.image = [self changeImage:[UIImage imageNamed:@"1 6 Clothing Front 4 Shorts.png"] toColour:bottomColor];
            break;
        case 2: //pants
            self.bottom.image = [self changeImage:[UIImage imageNamed:@"1 6 Clothing Front 8 Pants.png"] toColour:bottomColor];
            break;
    }
    //Mouth 8
    self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 0 Default.png"] toColour:[UIColor blackColor]];
    
    //eyes 9, 10, 11, 12
    UIColor *eyeColor = [UIColor colorWithHue:[defaults floatForKey:@"eyeHue"] saturation:0.7 brightness:0.7 alpha:1];
    self.eyes.image = [self changeImage:[UIImage imageNamed:@"1 10 Eye Pupils 0 Default.png"] toColour:eyeColor];
    self.eyesWhites.image = [self changeImage:[UIImage imageNamed:@"1 9 Eye Whites 0 Default.png"] toColour:[UIColor whiteColor]];
    self.eyeBrows.image = [self changeImage:[UIImage imageNamed:@"1 12 Eye Brows 0 Default.png"] toColour:[UIColor blackColor]];
    
    //Glasses 14
    UIColor *glassesColor = [UIColor colorWithHue:[defaults floatForKey:@"glassesHue"] saturation:0.7 brightness:0.7 alpha:1];
    int glassesInt = (int)[defaults integerForKey:@"glasses"];
    switch (glassesInt) {
        case -1: //none
            self.glasses.image = [self changeImage:nil toColour:nil];
            break;
        case 1: //Aviators
            self.glasses.image = [self changeImage:[UIImage imageNamed:@"1 14 Accessories 1 Aviators.png"] toColour:glassesColor];
            break;
        case 2: //Ray Bans
            self.glasses.image = [self changeImage:[UIImage imageNamed:@"1 14 Accessories 2 Ray Bans.png"] toColour:glassesColor];
            break;
    }
    //Hat
    UIColor *hatColor = [UIColor colorWithHue:[defaults floatForKey:@"hatHue"] saturation:0.7 brightness:0.5 alpha:1];
    int hatInt = (int)[defaults integerForKey:@"hat"];
    if (hatInt == 1) {
        self.hat.image = [self changeImage:[UIImage imageNamed:@"1 15 Hat 1 Wide-brimmed.png"] toColour:hatColor];
    } else {
        self.hat.image = [self changeImage:nil toColour:nil];
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

