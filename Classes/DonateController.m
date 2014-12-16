// DonateController.m
// MobileTerminal

#import <UIKit/UIKit.h>


@interface DonateController : UIViewController
@end

@implementation DonateController

- (void)openDonate:(id)sendar
{
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Open Browser?"
                               message:nil
                              delegate:self
                     cancelButtonTitle:@"Cancel"
                     otherButtonTitles:@"Okay",nil];
    [alert show];
    [alert release];
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://willfeeltips.appspot.com/depiction/donate.html"]];
    }
}

@end