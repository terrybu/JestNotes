//
//  InitialCustomViewController.m
//  ComicsHelperApp
//
//  Created by Aditya Narayan on 10/22/14.
//  Copyright (c) 2014 TerryBuOrganization. All rights reserved.
//

#import "HomeViewController.h"
#import "JokeCreationViewController.h"
#import "SingleJokeViewController.h"
#import "Joke.h"

@interface HomeViewController () {
    Joke *selectedJoke;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.createNewJokeButton.layer.cornerRadius = 5;
    self.createNewJokeButton.layer.borderWidth = 2;
    self.createNewJokeButton.layer.borderColor = [UIColor blackColor].CGColor;

    self.jokeDataManager = [[JokeDataManager alloc]init];

}

- (void) viewDidAppear {
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.jokeDataManager.jokes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell){
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
    Joke *joke = [self.jokeDataManager.jokes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = joke.title;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Score: %d", joke.score];
    
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedJoke = [self.jokeDataManager.jokes objectAtIndex:indexPath.row];
    
    SingleJokeViewController *sjvc = [self.storyboard instantiateViewControllerWithIdentifier:@"singleView"];
    sjvc.joke = selectedJoke;
    sjvc.title = selectedJoke.title;
    
    [self.navigationController pushViewController:sjvc animated:YES];
    
}






#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"creation"])
    {
        // Get reference to the destination view controller
        JokeCreationViewController *jcvc = [segue destinationViewController];
        jcvc.jokeDataManager = self.jokeDataManager;
    }

    
}





@end