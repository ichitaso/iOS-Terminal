// TerminalSettings.m
// MobileTerminal

#import "TerminalSettings.h"
#import "VT100/ColorMap.h"

#define NSFoundationVersionNumber_iOS_7_1 1047.25

@implementation TerminalSettings

@synthesize font;
@synthesize colorMap;
@synthesize args;

static NSString* kDefaultFontName = @"Courier";
static const CGFloat kDefaultIPhoneFont = 10.0f;
static const CGFloat kDefaultIPadFont = 18.0f;
static const CGFloat kDefaultIPadFontLandScape = 18.0f;
- (id) init
{
  return [self initWithCoder:nil];
}

//アドルフォイが追加
-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil) {
        if ([decoder containsValueForKey:@"args"]) {
            args = [[decoder decodeObjectForKey:@"args"] retain];
        } else {
            args = @"";
        }
        if ([decoder containsValueForKey:@"colorMap"]) {
            colorMap = [[decoder decodeObjectForKey:@"colorMap"] retain];
        } else {
            colorMap = [[ColorMap alloc] init];;
        }
        // UIFont does not implement NSCoding, so decode its arguments instead
        font = nil;
        if ([decoder containsValueForKey:@"fontName"] &&
            [decoder containsValueForKey:@"fontSize"]) {
            NSString* fontName = [decoder decodeObjectForKey:@"fontName"];
            CGFloat fontSize = [decoder decodeFloatForKey:@"fontSize"];
            font = [UIFont fontWithName:fontName size:fontSize];
        }
        if (font == nil) {
            // The iPad and iPhone have different default font sizes since the default
            // font on the iPad looks too small.
            float defaultFontSize = kDefaultIPhoneFont;
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
                
                if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)) {
                    CGSize screenSize = [self screenSize];
                    
                    if(screenSize.width < screenSize.height){
                        //Keyboard is in Portrait
                        defaultFontSize = kDefaultIPadFont;
                    } else {
                        //Keyboard is in Landscape
                        defaultFontSize = kDefaultIPadFontLandScape;
                    }
                } else {
                    CGSize screenSize = [self screenSize];
                    
                    if(screenSize.width > screenSize.height){
                        //Keyboard is in Landscape
                        defaultFontSize = kDefaultIPadFontLandScape;
                    } else {
                        //Keyboard is in Portrait
                        defaultFontSize = kDefaultIPadFont;
                    }
                }
            }
            font = [UIFont fontWithName:kDefaultFontName size:defaultFontSize];
        }
        if (font == nil) {
            NSLog(@"Default font unavailable, using system font");
            font = [[UIFont systemFontOfSize:[UIFont systemFontSize]] retain];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
  [encoder encodeObject:args forKey:@"args"];
  [encoder encodeObject:colorMap forKey:@"colorMap"];
  // UIFont does not implement NSCoding, so encode its arguments instead
  NSString* fontName = [font fontName];
  CGFloat fontSize = [font pointSize];
  [encoder encodeObject:fontName forKey:@"fontName"];
  [encoder encodeFloat:fontSize forKey:@"fontSize"];
}

@end
