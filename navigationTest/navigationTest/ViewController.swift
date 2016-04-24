//
//  ViewController.swift
//  navigationTest
//
//  Created by Kxx.xxQ 一生相伴 on 16/4/23.
//  Copyright © 2016年 Asahi_Kuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cellIdentifier = "identifier"
    @IBOutlet weak var tbView: UITableView!
    var imageView: UIImageView?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbView.delegate = self
        tbView.dataSource = self
        
        buildUpNavIcon()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /// 分割线补全
        if tbView.respondsToSelector(Selector("setSeparatorInset:")) {
            tbView.separatorInset = UIEdgeInsetsZero
        }
        if tbView.respondsToSelector(Selector("setLayoutMargins:")) {
            tbView.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    private func buildUpNavIcon() {
        let view                 = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 40.0))
        navigationItem.titleView = view
        
        imageView                = UIImageView.init(frame: CGRect(x: 0.0, y: 0.0, width: 65.0, height: 65.0))
        imageView!.center        = CGPoint(x: view.center.x, y: 0.0)
        imageView!.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        imageView!.image = UIImage.init(named: "IMG_0429.jpg")
        imageView!.layer.cornerRadius  = 65.0/2
        imageView!.layer.masksToBounds = true
        navigationItem.titleView!.addSubview(imageView!)
    }
    
    // MARK: - delegate && dataSource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: cellIdentifier)
        }
        else {
            while (cell!.contentView.subviews.last != nil) {
                cell!.contentView.subviews.last!.removeFromSuperview()
            }
        }
        return cell!
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yValue = scrollView.contentOffset.y
        if yValue > 120 { return }
        imageView!.transform = CGAffineTransformMakeScale(1 - yValue/300.0, 1 - yValue/300.0)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        if indexPath.row > 2 { return }
        var destination = [NavHiddenController(), NavUpDownController(), NavPushViewController()]
        self.navigationController!.pushViewController(destination[indexPath.row], animated: true)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.textLabel!.text = ["nav渐变消失", "nav推动","仿微博个人中心", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用", "备用","备用", "备用", "备用"][indexPath.row]
        if cell.respondsToSelector(Selector("setLayoutMargins:")) {
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
}

