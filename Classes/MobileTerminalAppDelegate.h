// MobileTerminalAppDelegate.h
// MobileTerminal

#import <UIKit/UIKit.h>
#import "MobileTerminalViewController.h"
#import "Preferences/PreferencesViewController.h"

@class Settings;

@implementation UINavigationController (Rotation)

- (NSUInteger)supportedInterfaceOrientations
{
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate
{
    return [self.viewControllers.lastObject shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}

@end

@interface MobileTerminalAppDelegate : NSObject <UIApplicationDelegate,
MobileTerminalInterfaceDelegate> {
@private
    UIWindow *window;
    UINavigationController *navigationController;
    MobileTerminalViewController *terminalViewController;
    PreferencesViewController *preferencesViewController;
    BOOL inPreferences;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet MobileTerminalViewController *terminalViewController;
@property (nonatomic, retain) IBOutlet PreferencesViewController *preferencesViewController;

- (void)preferencesButtonPressed;
- (void)rootViewDidAppear;

@end