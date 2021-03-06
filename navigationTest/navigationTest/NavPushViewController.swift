//
//  NavPushViewController.swift
//  navigationTest
//
//  Created by Kxx.xxQ 一生相伴 on 16/4/23.
//  Copyright © 2016年 Asahi_Kuang. All rights reserved.
//

import UIKit

class NavPushViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // lazy loading
    private lazy var tbView: UITableView = UITableView.init(frame: CGRect(x: 0.0, y: 64.0, width: self.view.bounds.width, height: self.view.bounds.height-64.0), style: .Plain)
    private var imageView: UIImageView?
    private var mask     : CALayer?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        origianlSetting()
        tableViewSetting()
        buildUpBackView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.subviews.first!.alpha = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    private func origianlSetting() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.hidesBackButton = true
        
        let left = UIButton.init(type: .Custom)
        left.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        left.setImage(UIImage.init(named: "back"), forState: .Normal)
        left.addTarget(self, action: #selector(goBack), forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: left)
        
        self.navigationController!.navigationBar.subviews.first!.alpha = 0.0
    }
    
    private func buildUpBackView() {
        imageView = UIImageView.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: 350.0))
        imageView!.image = UIImage.init(named: "IMG_0024.JPG")
        
        mask = CALayer()
        mask!.frame = imageView!.bounds
        mask!.backgroundColor = UIColor.init(white: 0.0, alpha: 0.3).CGColor
        imageView!.layer.insertSublayer(mask!, atIndex: 0)
        self.view.insertSubview(imageView!, belowSubview: self.tbView)
    }
    
    private func tableViewSetting() {
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.tbView.backgroundColor = UIColor.clearColor()
        self.tbView.separatorStyle  = .None
        self.view.addSubview(self.tbView)
        
        let header = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: 160.0))
        let imageView = UIImageView.init(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
        imageView.center = header.center
        imageView.image = UIImage.init(named: "IMG_0429.jpg")
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        header.addSubview(imageView)
        self.tbView.tableHeaderView = header
        
    }
    
    private func navigationBarSetting() {
        
    }
    
    // MARK: - selector
    func goBack(sender: UIButton) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    // MARK: - delegate && dataSource
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
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
        let offSetY = scrollView.contentOffset.y
        if offSetY > 0 || offSetY < -150 {
            if offSetY > 160.0 {
                self.navigationController!.navigationBar.subviews.first!.alpha = offSetY/400
                self.navigationItem.title = "个人中心"
            }
            else {
                self.navigationController!.navigationBar.subviews.first!.alpha = 0.0
                self.navigationItem.title = ""
            }
            
            return
        }
        imageView!.transform = CGAffineTransformMakeScale(1 - offSetY/400.0, 1 - offSetY/400.0)
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
