//
//  Decision5.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "Decision5.h"

@interface Decision5 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property BOOL choiceMade;


@end

@implementation Decision5

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Slide 12 - initial"
                                         ofType:@"wav"]];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
    }
    
    self.nextButton.enabled = NO;
    self.choiceMade = NO;
    [self healthBar];
    [self characterSettings:1];

}

- (IBAction)listenToVoiceOver:(UIButton *)sender {
    
    self.nextButton.enabled = NO;
    [_audioPlayer play];
}

- (IBAction)stopVoiceOver:(UIButton *)sender {
    [_audioPlayer stop];
    if(self.choiceMade) self.nextButton.enabled = YES;
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if(self.choiceMade) self.nextButton.enabled = YES;
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

- (IBAction)chooseMidday:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor yellowColor];
    self.afternoonButton.backgroundColor = [UIColor clearColor];
    self.nightButton.backgroundColor = [UIColor clearColor];
    self.background.backgroundColor = [UIColor yellowColor];
    self.background.alpha = 0.2;
    self.choiceMade = true;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"Decision5"];
    
}

- (IBAction)chooseAfternoon:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor clearColor];
    self.afternoonButton.backgroundColor = [UIColor grayColor];
    self.nightButton.backgroundColor = [UIColor clearColor];
    self.background.backgroundColor = [UIColor grayColor];
    self.background.alpha = 0.3;
    self.choiceMade = true;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"Decision5"];
}

- (IBAction)chooseNight:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor clearColor];
    self.afternoonButton.backgroundColor = [UIColor clearColor];
    self.nightButton.backgroundColor = [UIColor blackColor];
    self.background.backgroundColor = [UIColor blackColor];
    self.background.alpha = 0.5;
    self.choiceMade = true;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:3 forKey:@"Decision5"];
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
    UIImageView *healthAmount = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, health*38, 10)];
    if (health <= 3) {
        healthAmount.backgroundColor = [UIColor redColor];
    } else {
        healthAmount.backgroundColor = [UIColor greenColor];
    }
    [self.HeathBar addSubview:healthAmount];
}

//Hero costume Version
- (void)characterSettings: (int)scene {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //cape 1
    self.capeBack.image = [self changeImage:[UIImage imageNamed:@"1 1 Clothing Back 1 Cape.png"] toColour:[UIColor colorWithHue:0.7 saturation:0.5 brightness:0.5 alpha:1]];
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
    self.shoes.image = [UIImage imageNamed:@"1 4 Shoes 4 Hero Boots.png"];
    //Cape front
    self.eyeLashes.image = [self changeImage:[UIImage imageNamed:@"1 6 Clothing Front 1 Cape.png"] toColour:[UIColor colorWithHue:0.7 saturation:0.7 brightness:0.7 alpha:1]];
    //clothing top 6B
    self.top.image = [UIImage imageNamed:@"1 6 Clothing Front 7 Hero Suit.png"];
    //clothing bot 6A - no pants
    self.bottom.image = [self changeImage:nil toColour:nil];
    
    //Expression changes
    UIColor *eyeColor = [UIColor colorWithHue:[defaults floatForKey:@"eyeHue"] saturation:0.7 brightness:0.7 alpha:1];
    self.eyes.image = [self changeImage:[UIImage imageNamed:@"1 10 Eye Pupils 0 Default.png"] toColour:eyeColor];
    self.eyesWhites.image = [self changeImage:[UIImage imageNamed:@"1 9 Eye Whites 0 Default.png"] toColour:[UIColor whiteColor]];
    self.eyeBrows.image = [self changeImage:[UIImage imageNamed:@"1 12 Eye Brows 0 Default.png"] toColour:[UIColor blackColor]];
    //Changes based on expression 8,9,10,12
    switch (scene) {
        case 0: //Default
            self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 0 Default.png"] toColour:[UIColor blackColor]];
            break;
        case 1: //Happy
            self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 1 Happy.png"] toColour:[UIColor blackColor]];
            break;
        case 2: //Worried
            self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 2 Worried.png"] toColour:[UIColor blackColor]];
            break;
        case 3: //Thoughtful
            self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 3 Thoughtful.png"] toColour:[UIColor blackColor]];
            self.eyes.image = [self changeImage:[UIImage imageNamed:@"1 10 Eye Pupils 3 Thoughtful.png"] toColour:eyeColor];
            self.eyeBrows.image = [self changeImage:[UIImage imageNamed:@"1 12 Eye Brows 3 Thoughtful.png"] toColour:[UIColor blackColor]];
            break;
        case 4: //Tired
            self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 4 Tired.png"] toColour:[UIColor blackColor]];
            self.eyes.image = [self changeImage:[UIImage imageNamed:@"1 10 Eye Pupils 4 Tired.png"] toColour:eyeColor];
            self.eyesWhites.image = [self changeImage:[UIImage imageNamed:@"1 9 Eye Whites 4 Tired.png"] toColour:[UIColor whiteColor]];
            self.eyeBrows.image = [self changeImage:[UIImage imageNamed:@"1 12 Eye Brows 4 Tired.png"] toColour:[UIColor blackColor]];
            break;
        case 5: //Pained
            self.mouth.image = [self changeImage:[UIImage imageNamed:@"1 8 Mouth 5 Pained.png"] toColour:[UIColor blackColor]];
            break;
            
    }
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
    self.hat.image = [self changeImage:nil toColour:nil];
}


@end
