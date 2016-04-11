//
//  MyTableViewController.m
//  8.6-city-cell
//
//  Created by kz on 15/8/6.
//  Copyright (c) 2015年 KZ. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    NSArray *arr=[NSArray arrayWithContentsOfFile:path];
    self.array=[[NSMutableArray alloc]initWithCapacity:30];
    self.selectArray=[[NSMutableArray alloc]initWithCapacity:30];
    
    for (int i=0; i<arr.count; i++)
    {
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [self.array addObject:dic];
        [dic setObject:arr[i] forKey:@"name"];
        [dic setObject:@"MyCell" forKey:@"myCell"];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.array.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *dic=[self.array objectAtIndex:indexPath.row];
    if ([[dic valueForKey:@"mark"] isEqualToString:@"0"])
    {
        [dic setValue:@"1" forKey:@"mark"];
    }
    else
    {
        [dic setValue:@"0" forKey:@"mark"];
    }
    
    if ([self.selectArray containsObject:indexPath])
    {
        [self.selectArray removeObject:indexPath];
    }
    else
    {
        [self.selectArray addObject:indexPath];
    }
    NSLog(@"---------------");
    //重新加载数据  @[indexPath]是一个数组
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    for (NSIndexPath *index in self.selectArray)
    {
        NSLog(@"%@",self.array[index.row][@"name"]);
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableDictionary *dic=[self.array objectAtIndex:indexPath.row];
    NSString *myCell=[dic objectForKey:@"myCell"];
    
    MyTableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:myCell];

    if (!cell)
    {
        cell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell];
    }
    [cell setCellInfo:dic];
    return cell;
}
@end
