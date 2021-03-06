//
//  TipViewController.m
//  Tipster
//
//  Created by jessicasyl on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

bool isHidden = false;

- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    if (self.billAmountField.text.length ==0 && !isHidden){
        [self hideLabels];
    }
    if (self.billAmountField.text.length !=0 && isHidden){
        [self showLabels];
    }

    double tipPercentages[]={0.15,0.2,0.25};
    double tipPecentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billAmountField.text doubleValue ];
    double tip = bill * tipPecentage;
    double total = bill +tip;
    self.tipLabel.text= [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text=[NSString stringWithFormat:@"$%.2f",total];
}

- (void)hideLabels{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y += 200;

        self.billAmountField.frame=billFrame;

        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y +=200;
        self.labelsContainerView.frame=labelsFrame;

        self.labelsContainerView.alpha=0;
        isHidden=!isHidden;
    }];
    
}

- (void)showLabels{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y -= 200;

        self.billAmountField.frame=billFrame;

        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -=200;
        self.labelsContainerView.frame=labelsFrame;

        self.labelsContainerView.alpha=1;
        isHidden=!isHidden;
        
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"View did disappear");
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
