//
//  NSObject+NSObject___TerryConvenience.m
//  ComicsHelperApp
//
//  Created by Terry Bu on 10/31/14.
//  Copyright (c) 2014 TerryBuOrganization. All rights reserved.
//

#import "NSObject+NSObject___TerryConvenience.h"

@implementation NSObject (NSObject___TerryConvenience)

- (NSString *) quickStringFromInt: (int) someInt {
    return [NSString stringWithFormat: @"%d", someInt];
}

- (NSString *) turnSecondsIntegerIntoMinuteAndSecondsFormat: (int) seconds {
    
    int minutes = seconds / 60;
    int secondsLeftover = seconds % 60;
    
    if (minutes == 0) {
        return [NSString stringWithFormat:@"%d seconds", seconds];
    }
    else if (minutes == 1) {
        return [NSString stringWithFormat:@"1 minute %d seconds", secondsLeftover];
    }
    
    return [NSString stringWithFormat:@"%d minutes %d seconds", minutes, secondsLeftover];
}

@end