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
    
    EKEventStore *store = [EKEventStore new];
    
    store = [store initWithAccessToEntityTypes: EKEntityTypeEvent];
    NSLog(@"%@", [store sources]);
}

- (IBAction)quit: (id)pId
{
    [NSApp terminate:nil];
}

@end
