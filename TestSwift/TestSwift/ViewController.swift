//
//  ViewController.swift
//  TestSwift
//
//  Created by ysj on 2016/12/6.
//  Copyright © 2016年 ysj. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

typealias finishBlock = (String) -> (Int)
//typealias finishBlock = (String, Int) -> (String)

class ViewController: UIViewController {
    var sssss: (() -> ())?
    
    var avPlayer: AVPlayer! = nil
    var item: AVPlayerItem! = nil
    var avLayer: AVPlayerLayer! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let 哈哈 :String = "haha"
        print(哈哈)
        
        //貌似意义不大...
        let ss: finishBlock = { (msg) in
            return msg.characters.count
        }
        print(ss)
        
        testSE0046(1, secondParam: 1)
        
        //尾随闭包
        loadData { (msg, num) in
            
        }
        //正常闭包
        loadData(finishedHandle: {(msg, num) -> Void in
        
        })
        
        
        numOfCharacters { (customerString) in
            return customerString.characters.count
        }
        
        let customView = CustomerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        customView.clickBlock = {
            print("btn clicked")
        }
        view.addSubview(customView)
        
        let person = Person(name: "HanMei", age: 18)
        print(person)
        
        let student = Student(name: "Lilei", age: 20, number: 10086)
        print("\(student)")
        
        let btn = UIButton(type: UIButtonType.infoLight)
        btn.frame = CGRect(x: 0, y: 300, width: 40, height: 40)
        btn.addTarget(self, action: #selector(btnSelect), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        
        
        
        let url = NSURL(string: "http://mw5.dwstatic.com/2/4/1529/134981-99-1436844583.mp4")
//        let url = NSURL(fileURLWithPath: "file:///var/mobile/Media/DCIM/102APPLE/IMG_2358.MOV")
        
        
//        let urlStr = Bundle.main.path(forResource: "IMG_2358", ofType: "MOV")
//        let url = Foundation.URL(fileURLWithPath: urlStr!)
        
        item = AVPlayerItem(url: url! as URL)
        item.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.new, context: nil)
        
        avPlayer = AVPlayer(playerItem: item)
//        avPlayer = AVPlayer(url: url)
        
        avLayer = AVPlayerLayer(player: avPlayer)
        avLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//        layer.videoGravity = AVLayerVideoGravityResizeAspect
        
//        playView.layer.insertSublayer(avLayer, at: 0)
        view.backgroundColor = UIColor.clear
        view.layer.insertSublayer(avLayer, at: 0)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let playerItem = object as? AVPlayerItem else {
            print("not AVPlayerItem")
            return
        }
        print("is AVPlayerItem")
        if keyPath == "status"{
            // 监听状态改变
            print("status: \(playerItem.status)")
            if playerItem.status == AVPlayerItemStatus.readyToPlay{
                // 只有在这个状态下才能播放
                self.avPlayer.play()
            }else if playerItem.status == AVPlayerItemStatus.failed{
                print("加载异常 failed")
                print("\(avPlayer.currentItem?.error)")
            }else if playerItem.status == AVPlayerItemStatus.unknown{
                print("加载异常 unknown")
            }
        }
    }
    
    func btnSelect() {
        avPlayer.play()
    }
    
    deinit{
        item.removeObserver(self, forKeyPath: "status")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numOfCharacters(finish: finishBlock){
//    func numOfCharacters(finishh: ((customerString: String)) -> (Int)){
        print("numOfCharacters begin to run")
        let str = "hello"
        let num: Int = finish(str)
//        let num = finishh(str)
        print("String:\(str)   num:\(num)")
        
    }
    
    //@escaping 逃逸闭包  对于用在异步回调的闭包需要加上
//    func loadData(finishedHandle: @escaping (_ msg: String, _ num: Int) -> ()){
    //简单点 声明闭包的方式简单点
    func loadData(finishedHandle: @escaping (String, Int) -> ()){
        DispatchQueue.global().async {
            print("loading...\(Thread.current)")
            
            DispatchQueue.main.sync {
                print("回调\(Thread.current)")
                finishedHandle("show message", 1)
            }
        }
    }
    
    func testSE0046(_ firstParam: Int, secondParam: Int) {
        
    }
}

