//
//  SoundViewController.swift
//  mousouLINE
//
//  Created by erica chloe on 2017/11/15.
//  Copyright © 2017年 erica chloe. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //imageView2は最初非表示
        imageView2.isHidden = true
        
        //labelも非表示
        timeLabel.isHidden = true
        
        //音声 callmusic.mp3を再生
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url); audioPlayer.play()
            }catch{
                //プレイヤー作成失敗
                audioPlayer = nil
            }
        }else{
            //urlがnilなので生成できない
            fatalError("url id nil.")
        }
        
    }

    @IBAction func tap(_ sender: Any) {
        
        //imageView2の非表示を表示にする
        imageView2.isHidden = false
        
        //timelabelの非表示を表示にする
        timeLabel.isHidden = false
        
        //タイマーをスタートさせてtimeLabelに表示
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timercountUp), userInfo: nil, repeats: true)
        
        timeLabel.text = String(count)
        //baby.mp3の音声を再生
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url); audioPlayer.play()
            }catch{
                //プレイヤー作成失敗
                audioPlayer = nil
            }
        }else{
            //urlがnilなので生成できない
            fatalError("url id nil.")
        }
        
    }
    
    
    @objc func timercountUp(){
        count = count + 1
        timeLabel.text = String(count)
        
    }
    
    @IBAction func deny(_ sender: Any) {
        //電話を切る
        
        //音声をストップ　callmusic.mp3
        audioPlayer.stop()
        
        //画面をViewControllerに遷移
        dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
