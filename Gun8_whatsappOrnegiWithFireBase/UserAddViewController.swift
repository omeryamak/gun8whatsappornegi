//
//  UserAddViewController.swift
//  Gun8_whatsappOrnegiWithFireBase
//
//  Created by OMER on 29.11.2015.
//  Copyright (c) 2015 OMER. All rights reserved.
//

import UIKit

class UserAddViewController: UIViewController {

    var ref: Firebase!
  
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtphonenumber: UITextField!
    @IBOutlet weak var txtmailaddress: UITextField!
    
    @IBAction func AddButton(sender: AnyObject) {
    
       newItem()
        dismissVC()
        
    }
   
    func newItem(){
        var userinfo =  ["name": txtname.text, "phonenumber": txtphonenumber.text,"mail": txtmailaddress.text]
        var usersRef = ref.childByAppendingPath("userInfo")
        
        usersRef.setValue(userinfo)
        
    }
    
    func editItem(){
        
    }
    
    func dismissVC(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
