//
//  Joke.h
//  ComicsHelperApp
//
//  Created by Terry Bu on 10/23/14.
//  Copyright (c) 2014 TerryBuOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Joke : NSObject

@property (nonatomic, strong) NSString* name;
@property int score;
@property int length;
@property (nonatomic, strong) NSDate *writeDate;
@property (nonatomic, strong) NSString* bodyText; 

//this uniqueID is used for User Interface ordering purposes (joke #4) so that people can easily identify and order their jokes
@property (nonatomic, strong) NSNumber *uniqueID;

//this ID is used for matching up presentation and core data layer objects
@property (nonatomic, strong) NSManagedObjectID *managedObjectID;

//this checkmarkFlag is used to Set Creation view to see if one's been checked off or not
@property BOOL checkmarkFlag;
//This setORder button is used for MultiJokesSelectionController - same as checkmarkFlag - to denote what's been selected
@property NSUInteger setOrder;


@end
