//
//  ViewController.m
//  UISearchController
//
//  Created by ma c on 16/7/12.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "ViewController.h"
#import "BallTeams.h"
#import "SearchController.h"
static NSString * identifier =@"cell";
@interface ViewController ()<UISearchResultsUpdating>
@property (nonatomic,strong) NSArray * datalist;

@end

@implementation ViewController
-(NSArray *)datalist{
    if (!_datalist) {
        _datalist =[BallTeams loadMessage];
    }
    return _datalist;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    UIBarButtonItem * leftitem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(SearchControllAppear)];
    self.navigationItem.leftBarButtonItem =leftitem;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    BallTeams * ball =self.datalist[indexPath.row];
    cell.imageView.image =[UIImage imageNamed:ball.image];
    cell.textLabel.text =ball.name;
    return cell;
}

-(void)SearchControllAppear{
    SearchController * search =[[SearchController alloc] init];
    UISearchController * searchControl =[[UISearchController alloc] initWithSearchResultsController:search];
    searchControl.searchResultsUpdater =self;
    [self presentViewController:searchControl animated:YES completion:nil];
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString * string =searchController.searchBar.text;

    NSPredicate * p = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",string];
    if (searchController.searchResultsController) {
        SearchController * search =(SearchController *)searchController.searchResultsController;
        search.arrData =[[BallTeams allName] filteredArrayUsingPredicate:p];
        [search.tableView reloadData];
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
