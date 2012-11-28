//
//  AppDelegate.h
//  BetterCalendarNotifier
//
//  Created by Peter Beardsley on 11/27/12.
//  Copyright (c) 2012 Peter Beardsley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSMenu *bcnMenu;
    NSStatusItem *bcnItem;
}

- (IBAction) quit: (id)pId;

@property (assign) IBOutlet NSWindow *window;

@end
