//
//  AppDelegate.m
//  BetterCalendarNotifier
//
//  Created by Peter Beardsley on 11/27/12.
//  Copyright (c) 2012 Peter Beardsley. All rights reserved.
//

#import "AppDelegate.h"
#import "EventKit/EKEventStore.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(void)awakeFromNib
{
    bcnItem = [[NSStatusBar systemStatusBar] statusItemWithLength: NSVariableStatusItemLength];
    [bcnItem setMenu: bcnMenu];
    [bcnItem setTitle: @"BetterCalendarNotifier"];
    [bcnItem setHighlightMode: YES];
    
    EKEventStore *store = [[EKEventStore alloc] initWithAccessToEntityTypes: EKEntityTypeEvent];

    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
     
    // Create the start date components
    NSDate *now = [NSDate date];
     
    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = 1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
     
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:now
                                                            endDate:oneYearFromNow
                                                          calendars:nil];
    
    NSEnumerator *e = [[store eventsMatchingPredicate: predicate] objectEnumerator];
    
    id event;
    while (event = [e nextObject]) {
        NSLog(@"%@", [event title]);
        NSLog(@"%@", [event date]);
    }
}

- (IBAction)quit: (id)pId
{
    [NSApp terminate:nil];
}

@end
