//
//  Player.m
//  Snakes and Ladders
//
//  Created by Kamal Maged on 2019-01-13.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import "Player.h"

@implementation Player
- (instancetype)init
{
    self = [super init];
    if (self) {
        _gameOver = NO;
        _currentSquare = 0;
        _gameLadderLogic = @{@4: @14, @9: @31, @20: @38, @28: @84, @40: @59, @51: @67, @63: @81};
        _gameSnakeLogic = @{@17: @7, @64: @60, @89: @26, @95: @75, @99: @78};
    }
    return self;
}
- (void) roll {
    NSInteger diceValue = 1 + arc4random_uniform(5);
    BOOL landedOnLadder = NO;
    BOOL landedOnSnake = NO;
    for (NSNumber *square in [self gameLadderLogic]) {
        if ((self.currentSquare + diceValue) == [square intValue])
        {
            self.currentSquare = [[[self gameLadderLogic]objectForKey:square]intValue];
            landedOnLadder = YES;
            self.output = [[[[[@"You rolled a " stringByAppendingString:[NSString stringWithFormat:@"%li",diceValue]]stringByAppendingString:@" and You jumped from "]stringByAppendingString:[NSString stringWithFormat:@"%@", square]]stringByAppendingString:@" to "]stringByAppendingString:[NSString stringWithFormat:@"%li", self.currentSquare]];
            NSLog(@"%@", [self output]);
            return;
        }
    }

    for (NSNumber *square in [self gameSnakeLogic]) {
        if ((self.currentSquare + diceValue) == [square intValue])
        {
            self.currentSquare = [[[self gameSnakeLogic]objectForKey:square]intValue];
            landedOnSnake = YES;
            self.output = [[[[[@"You rolled a " stringByAppendingString:[NSString stringWithFormat:@"%li",diceValue]]stringByAppendingString:@" and You dropped from "]stringByAppendingString:[NSString stringWithFormat:@"%@", square]]stringByAppendingString:@" to "]stringByAppendingString:[NSString stringWithFormat:@"%li", self.currentSquare]];
            NSLog(@"%@", [self output]);
            return;
        }
    }
    if(!landedOnLadder && !landedOnSnake){
        self.currentSquare = self.currentSquare + diceValue;
        if (self.currentSquare < 100){
            self.output = [[[@"You rolled a " stringByAppendingString:[NSString stringWithFormat:@"%li",diceValue]]stringByAppendingString:@" and You landed on "]stringByAppendingString:[NSString stringWithFormat:@"%li", self.currentSquare]];
            NSLog(@"%@", [self output]);
        }
        else {
            self.currentSquare = 100;
            self.output = @"Game Over";
            _gameOver = YES;
        }
    }
    
}
@end
