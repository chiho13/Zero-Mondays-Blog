//
//  TableViewController.m
//  BlogReader-
//
//  Created by Anthony Ho on 21/05/2014.
//  Copyright (c) 2014 Anthony Ho. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
   
    //set back button color
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    //set back button arrow color
   
    
//    for (NSString* family in [UIFont familyNames])
//    {
//        NSLog(@"%@", family);
//        
//        for (NSString* name in [UIFont fontNamesForFamilyName: family])
//        {
//            NSLog(@"  %@", name);
//        }
//    }
//    
  
    

    
    NSURL *blogURL = [NSURL URLWithString:@"http://zeromondays.com/api/get_recent_posts/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error =nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
   // NSLog(@"%@", dataDictionary);
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray  *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *bpDictionary in blogPostsArray){
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary
                                                            objectForKey:@"title"]];
                              
        //blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]]; //taking the url and creating an instance of NSURL and setting to the url property.
        [self.blogPosts addObject:blogPost];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    
   [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CenturyGothic-bold" size:20],
      NSFontAttributeName, nil]];// Return the number of sections.
   
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]
     ];
    
   
    self.navigationController.navigationBar.translucent = NO;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    if([blogPost.thumbnail isKindOfClass:[NSString class]]){
        
    
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
    
        cell.imageView.image= image;
    }
    cell.textLabel.text = blogPost.title;
    UIFont *myfont =[UIFont fontWithName:@"Lato-Medium" size:20];
    UIFont *detailfont =[UIFont fontWithName:@"Lato-Light" size:12];
    cell.textLabel.font =myfont;
    cell.detailTextLabel.text = [NSString stringWithFormat:@" %@ ", [blogPost formattedDate]];
    cell.detailTextLabel.font = detailfont;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [cell setBackgroundColor:[UIColor colorWithRed:0.059 green:0.525 blue:0.831 alpha:1]];
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSLog(@"preparing for Segue:%@", segue.identifier);

    if([segue.identifier isEqualToString:@"showblogpost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setBlogPostURL:blogPost.url];
        
        
    }
    
    
}




















@end
