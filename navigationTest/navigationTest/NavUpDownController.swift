//
//  NavUpDownController.swift
//  navigationTest
//
//  Created by Kxx.xxQ 一生相伴 on 16/4/24.
//  Copyright © 2016年 Asahi_Kuang. All rights reserved.
//

import UIKit

class NavUpDownController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // lazy loading
    private lazy var tbView: UITableView = UITableView.init(frame: self.view.bounds, style: .Plain)
    private let cellIdentifier           = "identifier"
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        originalSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    private func originalSetting() {
        view.backgroundColor           = UIColor.whiteColor()
        navigationItem.hidesBackButton = true
        navigationItem.title           = "Hello Swift"
        self.tbView.delegate           = self
        self.tbView.dataSource         = self
        self.tbView.separatorStyle     = .None
        self.view.addSubview(self.tbView)
    }
    
    // MARK: - delegate && dataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: cellIdentifier)
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = getRandomColor()
    }
    
    // MARK: - scrollView delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        if offSetY > 0 {
            animationForNavigationBarWithDistance(-64.0)
        }
        else {
            animationForNavigationBarWithDistance(0.0)
        }
    }
    
    private func animationForNavigationBarWithDistance(distance: CGFloat) {
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: { 
            //
            self.navigationController!.navigationBar.transform = CGAffineTransformMakeTranslation(0.0, distance)
            }) { (isCompleted) in
                //
        }
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
