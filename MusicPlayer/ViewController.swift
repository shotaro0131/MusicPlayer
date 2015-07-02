//
//  ViewController.swift
//  MusicPlayer
//
//  Created by shotaro sato on 2015/07/02.
//  Copyright (c) 2015年 shotaro sato. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var table: UITableView!
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       table.dataSource = self
        
        table.delegate = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray = ["cannon","elise","aria"]
        
    
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        cell.textLabel?.text = songNameArray[indexPath.row]
        cell.imageView?.image = UIImage(named:  imageNameArray[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@select", songNameArray[indexPath.row])
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
        audioPlayer! = AVAudioPlayer(contentsOfURL: audioPath, error: nil)
        audioPlayer!.prepareToPlay()
        
        audioPlayer!.play()
    }

}

