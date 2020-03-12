//
//  LoginViewController.swift
//  Parstagram
//
//  Created by EatMoreOranges on 2/19/20.
//  Copyright © 2020 EatMoreOranges. All rights reserved.

//  cd Documents/school/SeniorYear/CodePath/TechFellow/Intstagram/Parstagram


import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let user = PFUser()
    
        user.username = usernameField.text
        user.password = passwordField.text
        
        
        print("this is the password: \(user.password)")
        print("this is the username: \(user.username)")
        
        user.signUpInBackground { (success, error) in
            if error != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                //print("Error: \(error?.localizedDescription)")
                print("Error:\(error)")
            }
        }
//        // joshua was here
//        user.signUpInBackground { (success, error) in
//            if success {
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }else{
//                print("Error:\(error)")
//            }
//        }
//        let user = PFUser()
//        user.username = usernameField.text
//        user.password = passwordField.text
//        //user.email = "email@example.com"
//        // other fields can be set just like with PFObject
//        //user["phone"] = "415-392-0202"
//
//        user.signUpInBackground{(success, error) in
//            if success {
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }else{
//                print("Error:\(error?.localizedDescription)")
//                print("Still the same error but a little more info: \(error)")
//
//            }
//
//        }
        
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    print("Error:\(error)")
            }
        }
    }
}

// Parse Dashboard: run this to see new users...
// parse-dashboard --appId myAppId --masterKey myMasterKey --serverURL "http://morning-plateau-99760.herokuapp.com/parse"
