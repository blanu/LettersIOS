//
//  BoardTableViewController.swift
//  LettersIOS
//
//  Created by BrandonWiley on 6/3/14.
//  Copyright (c) 2014 Operator. All rights reserved.
//

import UIKit

class BoardTableViewController: UITableViewController {
    var letters:Letters=Letters()
    var name:String?
    var board:Board?
    var menu:UITableViewController?
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let maybeView : AnyObject! = storyboard.instantiateViewControllerWithIdentifier("Menu")
        //        let maybeView : AnyObject! = storyboard.instantiateViewControllerWithIdentifier("MenuNav")
        if let view : AnyObject = maybeView
        {
            menu=view as? UITableViewController
            self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "\u2234", style: UIBarButtonItemStyle.Bordered, target: self, action: "showDrawerRight")
            println("Installed menu button")
        }
        
        if let n=name
        {
            self.navigationItem.title=n + " Salon"
            
            letters.getThreadIDs(n, {methodName, callID, result, error1, error2 in
                println(methodName)
                println(result)
                
                var posts:Post[]=[]
                let results = result as AnyObject[]
                for obj : AnyObject in results
                {
                    println(obj)
                    let post = obj as AnyObject[]
                    let pid = post[0] as Int
                    let ptitle=post[1] as String
                    let p = Post(postid: pid, title: ptitle, body: "", replies: [])
                    posts.append(p)
                }
                
                println(posts)
                self.board=Board(name: n, threads: posts)
                self.tableView.reloadData()
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
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        let cell = sender as PostTableViewCell
        if let post = cell.post
        {
            let postView = segue.destinationViewController as PostViewController
            postView.post=post
        }
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if let b=board
        {
            return b.threads.count
        }
        else
        {
            return 0
        }
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        if let view=tableView
        {
            let cell = view.dequeueReusableCellWithIdentifier("ThreadCell", forIndexPath: indexPath) as PostTableViewCell

            // Configure the cell...
            if let path = indexPath
            {
                if let b=board
                {
                    let index=path.indexAtPosition(1)
                    let thread = b.threads[index]
                    cell.text=thread.title
                    cell.post=thread
                }
            }

            return cell
        }
        else
        {
            return nil
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
