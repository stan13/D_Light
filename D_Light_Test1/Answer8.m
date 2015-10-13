//
//  Answer8.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer8.h"

//Private Variables
@interface Answer8 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property NSString *audioFile;
@property int correct;

@end

@implementation Answer8

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:self.audioFile
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
    [self healthBar];
    if (self.correct == 0) {
        [self characterSettings:5];
    } else {
        [self characterSettings:1];
    }
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"equator"];
    NSInteger health = [defaults integerForKey:@"health"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"That’s right! Closer to the equator, UV rays from the sun have an easier time getting through the atmosphere.";
            self.audioFile = @"Slide 15 - correct";
            health++;
            self.correct = 1;
            break;
        case 2:
            self.answerLabel.text = @"Close to the equator, UV rays from the sun have an easier time getting through the atmosphere, so you create more vitamin D from the sun on your skin, not less. ";
            self.audioFile = @"Slide 15 - incorrect";
            health--;
            self.correct = 0;
            break;
            
        default:
            break;
    }
    [defaults setInteger:health forKey:@"health"];
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
    
    if(health == 0) [self gameOver];
}

//dull the screen and force the player to return to the start if they get health = 0.
-(void) gameOver {
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIButton *gameOverButton = [[UIButton alloc] initWithFrame:frame];
    UIImage *gameOverImage = [UIImage imageNamed:@"GameOverScreen.png"];
    [gameOverButton setImage: gameOverImage forState:UIControlStateNormal];
    [gameOverButton addTarget:self action:@selector(youLose) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gameOverButton];
}

//Method attached to the button in gameOver method. Sends the player back to the start menu.
- (void) youLose {
    ViewController *final = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Start"];
    [self presentViewController:final animated:YES completion:nil];
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

- (IBAction)listenToVoiceOver:(UIButton *)sender {
    
    self.nextButton.enabled = NO;
    [_audioPlayer play];
}

- (IBAction)stopVoiceOver:(UIButton *)sender {
    [_audioPlayer stop];
    self.nextButton.enabled = YES;
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.nextButton.enabled = YES;
}

@end
