//
//  ViewController.swift
//  rubiks_rectangle
//
//  Created by Zoey on 17/03/2016.
//  Copyright © 2016 Zoey. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    @IBOutlet weak var Saple: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Answer: UILabel!
    
    var a = [1,2,3,4,5,6,7,8]
    var c = [0]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Label.lineBreakMode = NSLineBreakMode.byWordWrapping
        Label.numberOfLines = 0
        
        Answer.lineBreakMode = NSLineBreakMode.byWordWrapping
        Answer.numberOfLines = 0
        
        
//        let a1 = String(a[0])+","+String(a[1])+","+String(a[2])+","+String(a[3])+"\n"+String(a[7])+","+String(a[6])+","+String(a[5])+","+String(a[4])
//        
//        Label.text = String(a[0])+","+String(a[1])+","+String(a[2])+","+String(a[3])+"\n"+String(a[7])+","+String(a[6])+","+String(a[5])+","+String(a[4])
        
        update_label()
    }
    
    func update_label()
    {
        Label.text = String(a[0])+","+String(a[1])+","+String(a[2])+","+String(a[3])+"\n"+String(a[7])+","+String(a[6])+","+String(a[5])+","+String(a[4])
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func answer(_ sender: AnyObject)
    {
        if c.count != 8
        {
            Answer.text = "别整这些没有用的\nStop trying something you know it won't work"
        }
        else
        {
            let k = cotor()
            let s = k.run(c)

            Answer.text = s + "\n" + String(s.characters.count) + "Step"
        }
        
    }
    
    @IBAction func reset(_ sender: AnyObject)
    {
        a = [1,2,3,4,5,6,7,8]
        update_label()
    }
    
    @IBAction func right_circular_shift(_ sender: AnyObject)
    {
        var temp = a[3]
        a[3] = a[2]
        a[2] = a[1]
        a[1] = a[0]
        a[0] = temp
        
        temp = a[4]
        a[4] = a[5]
        a[5] = a[6]
        a[6] = a[7]
        a[7] = temp
        
        update_label()
    }

    @IBAction func middle_clockwise_rotation(_ sender: AnyObject)
    {
        let temp = a[2]
        a[2] = a[1]
        a[1] = a[6]
        a[6] = a[5]
        a[5] = temp
        
        update_label()
    }
    @IBAction func row_exchange(_ sender: AnyObject)
    {
        var temp = a[0]
        a[0] = a[7]
        a[7] = temp
        
        temp = a[1]
        a[1] = a[6]
        a[6] = temp
        
        temp = a[2]
        a[2] = a[5]
        a[5] = temp
        
        temp = a[3]
        a[3] = a[4]
        a[4] = temp
        
        update_label()
    }
    
    @IBAction func new_saple(_ sender: AnyObject)
    {
        var b = [1,2,3,4,5,6,7,8]
        c = [0]
        while b.isEmpty == false
        {
            let i = b.count
            let j = Int(arc4random()) % i
            
            c.append(b[j])
            b.remove(at: j)
        }
        c.removeFirst()
        print(c)
        Saple.text = String(c[0])+","+String(c[1])+","+String(c[2])+","+String(c[3])+"\n"+String(c[7])+","+String(c[6])+","+String(c[5])+","+String(c[4])
    }

}

