//
//  main.m
//  Snakes and Ladders
//
//  Created by Kamal Maged on 2019-01-13.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"------Welcome to Snakes and Ladders-------");
        NSLog(@"------Roll the dice. Type roll or r-------");
        Player * player1 = [[Player alloc]init];
        
        while (![player1 gameOver]) {
            char userInput[5];
            fgets(userInput, 5, stdin);
            NSString * input = [[NSString alloc]initWithCString:userInput encoding:NSUTF8StringEncoding];
            
            NSString * trimmedInput = [input stringByTrimmingCharactersInSet:(NSCharacterSet.whitespaceAndNewlineCharacterSet)];
            
            if ([trimmedInput isEqualToString:@"roll"] || [trimmedInput isEqualToString:@"r"]) {
                [player1 roll];
            }
        }
        NSLog(@"gameOver");
        
        
        
    }
    return 0;
}
