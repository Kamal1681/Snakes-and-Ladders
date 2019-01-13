//
//  Player.h
//  Snakes and Ladders
//
//  Created by Kamal Maged on 2019-01-13.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic) NSInteger currentSquare;
@property (nonatomic, readonly) NSDictionary * gameLadderLogic;
@property (nonatomic, readonly) NSDictionary * gameSnakeLogic;
@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSString * output;
- (void) roll;

@end

NS_ASSUME_NONNULL_END
