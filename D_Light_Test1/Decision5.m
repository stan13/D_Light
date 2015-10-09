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
                                         pathForResource:@"Slide 10 - initial"
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
    [self characterSettings];
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

- (void)characterSettings{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIColor *skinColour = [UIColor colorWithRed:[defaults floatForKey:@"skinRed"] green:[defaults floatForKey:@"skinGreen"] blue:[defaults floatForKey: @"skinBlue"] alpha:1.0];
    int head = (int)[defaults integerForKey:@"head"];
    
    
    self.skinArms.image = [self changeImage:self.skinArms.image toColour:skinColour];
    self.skinLegs.image = [self changeImage:self.skinLegs.image toColour:skinColour];
    if (head == 0) {
        self.skinHead.image = [self changeImage:[UIImage imageNamed:@"9000 7 Head 0 Default.png"] toColour:skinColour];
    }else if(head == 1){
        self.skinHead.image = [self changeImage:[UIImage imageNamed:@"9000 7 Head 1 Egg.png"] toColour:skinColour];
    }
    
    UIColor *hairColour = [UIColor colorWithHue:[defaults floatForKey:@"hairHue"] saturation:0.5 brightness:0.5 alpha:1];
    int hair = (int)[defaults integerForKey:@"hair"];
    
    switch (hair) {
        case 0:
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"9000 13 Hair Front 0 Short.png"] toColour:hairColour];
            break;
        case 1:
            self.hairBack.image = [self changeImage:[UIImage imageNamed:@"9000 0 Hair Back 1 Long.png"] toColour:hairColour];
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"9000 13 Hair Front 1 Long.png"] toColour:hairColour];
            break;
        case 2:
            //TODO
            break;
        case 3:
            //TODO
            break;
            
        default:
            break;
    }
    
    UIColor *eyeColour = [UIColor colorWithHue:[defaults floatForKey:@"eyeHue"] saturation:0.5 brightness:0.5 alpha:1];
    self.eyes.image = [self changeImage:self.eyes.image toColour:eyeColour];
    
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
    self.middayButton.backgroundColor = [UIColor grayColor];
    self.afternoonButton.backgroundColor = [UIColor clearColor];
    self.nightButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"prison"];
    
}

- (IBAction)chooseAfternoon:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor clearColor];
    self.afternoonButton.backgroundColor = [UIColor grayColor];
    self.nightButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"prison"];
}

- (IBAction)chooseNight:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor clearColor];
    self.afternoonButton.backgroundColor = [UIColor clearColor];
    self.nightButton.backgroundColor = [UIColor grayColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:3 forKey:@"prison"];
}

@end
