//
//  WebViewController.h
//  BlogReader-
//
//  Created by Anthony Ho on 01/06/2014.
//  Copyright (c) 2014 Anthony Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *WebView;
@end
