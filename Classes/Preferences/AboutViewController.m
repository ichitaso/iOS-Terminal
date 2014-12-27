// AboutViewController.m
// MobileTerminal

#import "AboutViewController.h"
#import "Settings.h"

static BOOL Alert1;
static BOOL Alert2;

@implementation AboutViewController

@synthesize versionLabel;

- (void)awakeFromNib
{
  [super awakeFromNib];
  //Settings* settings = [Settings sharedInstance];
  versionLabel.text = [NSString stringWithFormat:@"v1.0.2-3beta"];
}

- (IBAction)openDonate:(id)sender
{
    UIAlertView *alert1 =
    [[UIAlertView alloc] initWithTitle:@"Open Browser?"
                               message:nil
                              delegate:self
                     cancelButtonTitle:@"Cancel"
                     otherButtonTitles:@"Okay",nil];
    [alert1 show];
    [alert1 release];
    Alert1 = YES;
}

- (IBAction)openTwitter:(id)sender {
    UIAlertView *alert2 =
    [[UIAlertView alloc] initWithTitle:@"Open Twitter?"
                               message:nil
                              delegate:self
                     cancelButtonTitle:@"Cancel"
                     otherButtonTitles:@"Okay",nil];
    [alert2 show];
    [alert2 release];
    Alert2 = YES;
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 && Alert1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://willfeeltips.appspot.com/depiction/donate.html"]];
        Alert1 = NO;
    } else if (buttonIndex == 1 && Alert2) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"theworld:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"theworld://scheme/user/?screen_name=ichitaso"]];
        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetbot:///user_profile/ichitaso"]];
        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetlogix:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetlogix:///home?username=ichitaso"]];
        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitterrific:///profile?screen_name=ichitaso"]];
        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetings:///user?screen_name=ichitaso"]];
        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=ichitaso"]];
        else
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ichitaso/"]];
        Alert2 = NO;
    } else {
        Alert1 = NO;
        Alert2 = NO;
    }
}

@end
