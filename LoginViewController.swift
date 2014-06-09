//
//  LoginViewController.swift
//  LettersIOS
//
//  Created by BrandonWiley on 6/3/14.
//  Copyright (c) 2014 Operator. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var letters:Letters=Letters()
    var board:Board?
    var names:String[]=[]

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
        
        self.navigationItem.title="Letters"
        
        letters.getBoardNames({methodName, callID, result, error1, error2 in
            println(methodName)
            println(result)
            
            var posts:Post[]=[]
            let results = result as String[]
            self.names=results
            
            println(posts)
            self.board=Board(name: "test", threads: posts)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        let boardsView=segue.destinationViewController as BoardsTableViewController
        boardsView.names=names
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
