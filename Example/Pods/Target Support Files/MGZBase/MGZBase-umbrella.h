#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MGZBaseListViewController.h"
#import "MGZBaseListViewModel.h"
#import "MGZBaseNavgationController.h"
#import "MGZBaseViewController.h"
#import "MGZBaseViewModel.h"
#import "MGZListConfig.h"

FOUNDATION_EXPORT double MGZBaseVersionNumber;
FOUNDATION_EXPORT const unsigned char MGZBaseVersionString[];

