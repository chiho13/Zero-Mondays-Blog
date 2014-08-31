//
//  BlogPost.h
//  BlogReader-
//
//  Created by Anthony Ho on 22/05/2014.
//  Copyright (c) 2014 Anthony Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject{
    NSString *title;
    NSString *author;
}

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong)NSString *thumbnail;
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSURL *url;

//Designated Initialiser

-(id) initWithTitle:(NSString *)title;
+(id) blogPostWithTitle: (NSString*) title;

-(NSURL *)  thumbnailURL;
-(NSString*)formattedDate;

@end
