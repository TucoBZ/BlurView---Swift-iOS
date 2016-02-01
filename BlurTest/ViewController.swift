//
//  ViewController.swift
//  BlurTest
//
//  Created by Tulio Bazan on 01/02/16.
//  Copyright © 2016 Tulio Bazan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageBKG: UIImageView!
    @IBOutlet weak var blurBtn: UIButton!
    var isBlur = false
    var blurEffectView : UIVisualEffectView?
    
    func makeBlur() {
        if !isBlur {
            isBlur = true
            blurBtn.setTitle("Blur", forState: .Normal)
            
            if let blur = blurEffectView {
                
                imageBKG.addSubview(blur)
                blurBtn.bringSubviewToFront(blur)
                
            } else {
                
                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
                blurEffectView = UIVisualEffectView(effect: blurEffect)
                blurEffectView?.frame = view.bounds
                blurEffectView?.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
                imageBKG.addSubview(blurEffectView!)
                blurBtn.bringSubviewToFront(blurEffectView!)
                
            }
          
        } else {
            isBlur = false
            blurBtn.setTitle("NoBlur", forState: .Normal)
            if let blur = blurEffectView {
                blur.removeFromSuperview()
            }
        }

    }
    
    @IBAction func makeBlur(sender: AnyObject) {
        makeBlur()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

