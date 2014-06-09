//
//  PostViewController.swift
//  LettersIOS
//
//  Created by BrandonWiley on 6/3/14.
//  Copyright (c) 2014 Operator. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    var letters:Letters=Letters()
    var post:Post?
    var menu:UITableViewController?

    @IBOutlet var titleLabel : UILabel
    @IBOutlet var body : UILabel
    
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
        
        let maybeView : AnyObject! = storyboard.instantiateViewControllerWithIdentifier("Menu")
        //        let maybeView : AnyObject! = storyboard.instantiateViewControllerWithIdentifier("MenuNav")
        if let view : AnyObject = maybeView
        {
            menu=view as? UITableViewController
            self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "\u2234", style: UIBarButtonItemStyle.Bordered, target: self, action: "showDrawerRight")
            println("Installed menu button")
        }
        
        if let p=post
        {
            letters.getPost("test", postid: p.postid, {methodName, callID, result, error1, error2 in
                println(methodName)
                println(result)
                
                let results = result as AnyObject[]
                let pid = results[0] as Int
                let ptitle=results[1] as String
                let pbody=results[2] as String
                let preplies=results[3] as Int[]
                self.post = Post(postid: pid, title: ptitle, body: pbody, replies: [])
                self.updatePostUI()
            })
        }
    }

    func showDrawerLeft()
    {
        self.navigationController.pushDrawerViewController(menu, withStyle: DrawerLayoutStyleLeftAnchored, animated: true)
    }
    
    func showDrawerRight()
    {
        self.navigationController.pushDrawerViewController(menu, withStyle: DrawerLayoutStyleRightAnchored, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        updatePostUI()
    }
    
    func updatePostUI()
    {
        if let p = post
        {
            titleLabel.text=p.title
            body.text=p.body
        }
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
