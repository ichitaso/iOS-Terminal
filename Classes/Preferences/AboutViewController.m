// AboutViewController.m
// MobileTerminal

#import "AboutViewController.h"
#import "Settings.h"

@implementation AboutViewController

@synthesize versionLabel;

- (void)awakeFromNib
{
  [super awakeFromNib];
  //Settings* settings = [Settings sharedInstance];
  versionLabel.text = [NSString stringWithFormat:@"r530"];
}

- (IBAction)openDonate:(id)sender
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
