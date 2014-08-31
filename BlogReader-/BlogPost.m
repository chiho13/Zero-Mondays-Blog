//
//  BlogPost.m
//  BlogReader-
//
//  Created by Anthony Ho on 22/05/2014.
//  Copyright (c) 2014 Anthony Ho. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

@synthesize title;
@synthesize  author;
-(id) initWithTitle:(NSString *)title{
  
    self = [ super init];
    
    if(self){
       
        self.title=title;
        self.thumbnail=nil;
        self.date =nil;
        
    }
    return self;
    
    
};

+(id)blogPostWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle: title];
}
-(NSURL *)  thumbnailURL{
  //  NSLog(@"%@", [self.thumbnail class]);
    return [NSURL URLWithString:self.thumbnail];
};
-(NSString *) formattedDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //specified format of date property
    NSDate *tempdate = [dateFormatter dateFromString:self.date]; //parsed into a date object
    [dateFormatter setDateFormat:@"EE dd MMM yyyy"]; //created a new format for new date
    return [dateFormatter stringFromDate:tempdate]; //returned that as a string
};

@end
