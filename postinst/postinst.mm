#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    if (argc < 2 || strcmp(argv[1], "configure") != 0)
        return 0;
    
    @autoreleasepool {
        NSString *path1 = @"/Applications/Terminal.app/Icon40x40@2x.png";
        NSString *path2 = @"/Applications/Terminal.app/Icon40x40@2x~ipad.png";
        NSString *path3 = @"/Applications/Terminal.app/Icon40x40~ipad.png";
        NSString *path4 = @"/Applications/Terminal.app/Icon40x40@3x.png";
        NSString *path5 = @"/Applications/Terminal.app/Icon60x60@2x.png";
        NSString *path6 = @"/Applications/Terminal.app/Icon60x60@3x.png";
        NSString *path7 = @"/Applications/Terminal.app/Icon76x76@2x~ipad.png";
        NSString *path8 = @"/Applications/Terminal.app/Icon76x76~ipad.png";
        BOOL isFirmware7_x = (kCFCoreFoundationVersionNumber < 847.20) ? YES : NO;
        
        NSFileManager *manager = [NSFileManager defaultManager];
        
        if (isFirmware7_x/* && [manager fileExistsAtPath:lPath] && [manager fileExistsAtPath:sPath]*/) {
            [manager removeItemAtPath:path1 error:nil];
            [manager removeItemAtPath:path2 error:nil];
            [manager removeItemAtPath:path3 error:nil];
            [manager removeItemAtPath:path4 error:nil];
            [manager removeItemAtPath:path5 error:nil];
            [manager removeItemAtPath:path6 error:nil];
            [manager removeItemAtPath:path7 error:nil];
            [manager removeItemAtPath:path8 error:nil];
        }
    }
    return 0;
}