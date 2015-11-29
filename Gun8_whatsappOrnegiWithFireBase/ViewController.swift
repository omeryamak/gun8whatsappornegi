//
//  ViewController.swift
//  Gun8_whatsappOrnegiWithFireBase
//
//  Created by OMER on 28.11.2015.
//  Copyright (c) 2015 OMER. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIActionSheetDelegate {

    var ref = Firebase(url: "https://gun8.firebaseio.com/")
    var girisYapildi :Int = 0
    
    @IBOutlet weak var txtSifre: UITextField!
    @IBOutlet weak var txtKullaniciAdi: UITextField!
    @IBAction func btnLogin(sender: AnyObject) {
       
        ref.authUser(txtKullaniciAdi.text, password: txtSifre.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    println(error)
                    let alert = UIAlertController(title: "Not Login", message: error.description, preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } else {
                    
                    self.girisYapildi = 1
                    
                    // We are now logged in
                /*    let alert = UIAlertController(title: "Logged-in", message: "Login complete", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil) */
                    self.performSegueWithIdentifier("userlist", sender: authData)
                }
        })

        
    }
    @IBAction func btnRegister(sender: AnyObject) {
        ref.createUser(txtKullaniciAdi.text, password: txtSifre.text,
            withValueCompletionBlock: { error, result in
                
                if error != nil {
                    // There was an error logging in to this account
                    println(error)
                    let alert = UIAlertController(title: "Not Login", message: error.description, preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } else {
                    // We are now logged in
                    let alert = UIAlertController(title: "Logged-in", message: "Successfully created user account", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }

        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var messagesVc = segue.destinationViewController as! UserListTableViewController
        if let authData = sender as? FAuthData {
            messagesVc.user = authData
            messagesVc.ref = ref
           
        }
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

