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

#import "BaseModel.h"
#import "BaseCollectionViewController.h"
#import "BaseTableViewController.h"
#import "BaseViewController.h"
#import "BaseView.h"
#import "BaseListViewModel.h"
#import "BaseViewModel.h"

FOUNDATION_EXPORT double MGZBaseVersionNumber;
FOUNDATION_EXPORT const unsigned char MGZBaseVersionString[];

