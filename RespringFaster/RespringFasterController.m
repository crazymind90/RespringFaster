#include "RespringFasterController.h"
#include <spawn.h>

#define PreferencesChangedNotification "com.crazymind90.respringfaster/ReloadPrefs"


@implementation RespringFasterController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void) ApplyChanges {
    
    pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    
}


-(void) CrazyTwitter {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/CrazyMind90"] options:@{} completionHandler:nil];
    
}

@end
