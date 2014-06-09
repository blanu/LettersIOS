//
//  MakeThreadViewController.swift
//  LettersIOS
//
//  Created by BrandonWiley on 6/6/14.
//  Copyright (c) 2014 Operator. All rights reserved.
//

import UIKit

class MakeThreadViewController: UIViewController {

    @IBOutlet var scroll : UIScrollView
    @IBOutlet var titleField : UITextField
    @IBOutlet var bodyField : UITextView
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func titleEditting(sender : UITextField)
    {
        var rc = titleField.convertRect(scroll.bounds, fromView: scroll)
        rc.origin.x=0
        rc.origin.y-=60
        rc.size.height=400
        scroll.scrollRectToVisible(rc, animated: true)        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
