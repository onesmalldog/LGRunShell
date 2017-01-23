#import "LGRunShell.h"
@implementation LGRunShell
+ (NSString *)runShellWithBundleName:(NSString *)name {
    
//    NSArray *array;
//    array = [NSBundle pathsForResourcesOfType:@"sh" inDirectory:[[NSBundle mainBundle]resourcePath]];
//    NSLog(@"%@", array);
    NSString* scriptPath = [[NSBundle mainBundle] pathForResource:name ofType:@"sh"];
    NSLog(@"path:\n%@\n", scriptPath);
    if(scriptPath){
        NSArray* theArguments = [NSArray arrayWithObjects: @"/bin/sh", scriptPath,nil];
        NSTask* scriptTask = [[NSTask alloc] init];
        NSPipe *pipe;
        pipe = [NSPipe pipe];
        [scriptTask setStandardOutput: pipe];
        [scriptTask setStandardError: pipe];
        NSFileHandle *file;
        file = [pipe fileHandleForReading];
        [scriptTask setLaunchPath: [theArguments objectAtIndex:0]];
        [scriptTask setArguments: [theArguments subarrayWithRange: NSMakeRange (1,([theArguments count] - 1))]];
        [scriptTask launch];
        NSData *data;
        data = [file readDataToEndOfFile];
        NSString *string;
        string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        NSLog (@"got\n%@", string);
        return string;
    } else {
        NSLog(@"That dosn't exist");
        return nil;
    }
}
