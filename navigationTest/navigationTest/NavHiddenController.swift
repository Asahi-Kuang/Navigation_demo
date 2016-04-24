//
//  NavHiddenController.swift
//  navigationTest
//
//  Created by Kxx.xxQ 一生相伴 on 16/4/23.
//  Copyright © 2016年 Asahi_Kuang. All rights reserved.
//

import UIKit

class NavHiddenController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /// lazy loading
    private lazy var tbView: UITableView = UITableView.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height), style: .Plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        originalSetting()
        tableViewSetting()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.alpha = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func originalSetting() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.hidesBackButton = true
        
        let back = UIButton.init(type: .Custom)
        back.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        back.setImage(UIImage.init(named: "back"), forState: .Normal)
        back.addTarget(self, action: #selector(goBack), forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back)
    }
    
    private func tableViewSetting() {
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.tbView.separatorStyle = .None
        self.view.addSubview(self.tbView)
    }
    
    func goBack(sender: UIButton) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    // MARK: - 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("identifier")
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "identifier")
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = getRandomColor()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if self.navigationController == nil { return }
        self.navigationController!.navigationBar.alpha = 1.0 - scrollView.contentOffset.y/400.0
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
