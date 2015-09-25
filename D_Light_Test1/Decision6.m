//
//  Decision6.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision6.h"

@interface Decision6 ()
//Private Variables

@end

@implementation Decision6

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:self.view];
    
    if([touch view] == self.foodWithNone){
        self.foodWithNone.center = location;
    } else if([touch view] == self.foodWithSome){
        self.foodWithSome.center = location;
    } else if([touch view] == self.foodWithEnough){
        self.foodWithEnough.center = location;
    }
    
    
    
    
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIImageView *food = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 220, 180)];
    
    if (CGRectIntersectsRect(self.foodWithNone.frame, self.plate.frame)) {
        food.image = [UIImage imageNamed:@"food1"];
        [defaults setInteger:1 forKey:@"food"];
    }
    if (CGRectIntersectsRect(self.foodWithSome.frame, self.plate.frame)) {
        food.image = [UIImage imageNamed:@"food2"];
        [defaults setInteger:2 forKey:@"food"];
    }
    if (CGRectIntersectsRect(self.foodWithEnough.frame, self.plate.frame)) {
        food.image = [UIImage imageNamed:@"food3"];
        [defaults setInteger:3 forKey:@"food"];
    }
    [self.plate addSubview:food];
    
    self.foodWithNone.center = CGPointMake(108, 209);
    self.foodWithSome.center = CGPointMake(300, 209);
    self.foodWithEnough.center = CGPointMake(492, 209);
}

@end
