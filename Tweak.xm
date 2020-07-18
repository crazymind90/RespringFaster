
// Dev.@CrazyMind90

#pragma GCC diagnostic ignored "-Wunused-variable"


#import <UIKit/UIKit.h>
#include <spawn.h>


#define PLIST_PATH @"/var/mobile/Library/Preferences/com.crazymind90.respringfaster.plist"



@interface SBVolumeHardwareButtonActions : NSObject

-(void) Refresh;

@end




NSUInteger PressedTimes = 0;

%hook SBVolumeHardwareButtonActions

%group ValumeDown
-(void)volumeDecreasePressDown { // PressDown



	NSMutableDictionary *MutDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

	NSUInteger PressedValue = [[MutDictionary objectForKey:@"PressTimes"] integerValue];

	PressedTimes ++;

 // This means it will respring after the fourth press
  if (PressedTimes == PressedValue) {

 // Respring Code
 	 pid_t pid;
 	 const char* args[] = {"killall", "backboardd", NULL};
 	 posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);

  }


 // This time means that you will need to finish all four presses before it's up .. Yup it's only 1 sec
  [self performSelector:@selector(Refresh) withObject:nil afterDelay:1.1];





    return %orig;

}

%end






%group ValumeUp
- (void)volumeIncreasePressDown { // PressUP


	NSMutableDictionary *MutDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

	NSUInteger PressedValue = [[MutDictionary objectForKey:@"PressTimes"] integerValue];

	PressedTimes ++;

 // This means it will respring after the fourth press
  if (PressedTimes == PressedValue) {

 // Respring Code
 	 pid_t pid;
 	 const char* args[] = {"killall", "backboardd", NULL};
 	 posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);

  }

 // This time means that you will need to finish all four presses before it's up .. Yup it's only 1 sec
  [self performSelector:@selector(Refresh) withObject:nil afterDelay:1.1];




    return %orig;

}

%end


%new
-(void) Refresh {

  PressedTimes = 0;

}




%end






%ctor {

	%init();

  NSMutableDictionary *MutDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	int GetIntValue = [[MutDictionary objectForKey:@"PressDirection"] intValue];


	  if (GetIntValue == 1)
	  %init(ValumeUp);
	 	else
		%init(ValumeDown);



};


























//
