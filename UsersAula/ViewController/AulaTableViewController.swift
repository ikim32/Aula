//
//  AulaTableViewController.swift
//  UsersAula
//
//  Created by MIguel Saravia on 5/25/15.
//  Copyright (c) 2015 Xiobit. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import TSMessages

class AulaTableViewController: UITableViewController {
  
  //var AulaObject: NSMutableArray = NSMutableArray()
   var AulaObject = [Alumnos]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  //  MARK: Button Loggout
  @IBAction func btnLogoutTableViewController(sender: AnyObject) {
    
    PFUser.logOut()
    loggout()
    
  }
  func loggout(){
    if PFUser.currentUser() == nil {
      var loggin : PFLogInViewController = PFLogInViewController()
      var newlogin = UILabel()
      newlogin.text = "REGISTRO DE PROFESORES"
      loggin.logInView?.logo = newlogin
      loggin.delegate = self
      
      var signIn : PFSignUpViewController = PFSignUpViewController()
      var newsingin = UILabel()
      newsingin.text = "REGISTRO DE PROFESORES"
      signIn.signUpView?.logo = newsingin
      signIn.delegate = self
      
      loggin.signUpController = signIn
      
      self.presentViewController(loggin, animated: true, completion: nil)
      
    }
    
  }
  func FindJqueryObject(){
    //AulaObject.removeAllObjects()
    AulaObject.removeAll(keepCapacity: true)
   // var findAlumno : PFQuery = PFQuery(className: "Alumnos")
    var query = Alumnos.query()
    if let user = PFUser.currentUser() {
      query!.whereKey("profesorId", equalTo: user)
    }
    query!.findObjectsInBackgroundWithBlock{ (objects, error) -> Void in
      if error == nil {
        for object in objects!{
         self.AulaObject.append(object as! Alumnos)
        }
      }
      let array:NSArray = self.AulaObject.reverse()
     // self.AulaObject = Array(arrayLiteral: array)
      self.tableView.reloadData()
    }
    
    
  }

}
extension AulaTableViewController: PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate{
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    FindJqueryObject()
    if PFUser.currentUser() == nil{

      var login : PFLogInViewController = PFLogInViewController()
      var newLogo = UILabel()
      newLogo.text = "REGISTRO PROFESORES"
      login.logInView?.logo = newLogo
      login.delegate = self
      
      var signin: PFSignUpViewController = PFSignUpViewController()
      var newlogoSignIn = UILabel()
      newlogoSignIn.text = "REGISTRO PROFESORES"
      signin.signUpView?.logo = newlogoSignIn
      signin.delegate = self
      
      login.signUpController = signin
      
      self.presentViewController(login, animated: true, completion: nil)

    }
  }
  // MARK: Login
  
  func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
    if !username.isEmpty || !password.isEmpty{
      
      return true
      
    }else{
      
      return false
    }
  }
  func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    TSMessage.showNotificationWithTitle("success", subtitle: "Esta Loggeado", type: TSMessageNotificationType.Success)
    
  }
  func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
    
    println("error al conectarse")
    TSMessage.showNotificationWithTitle("error", subtitle: "no data save", type: TSMessageNotificationType.Error)
  }
  
  //MARK: SignIn
  
  func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
    
    println("Error to singin")
    TSMessage.showNotificationWithTitle("error to signin", subtitle: "data not save", type: TSMessageNotificationType.Error)
  }
  func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
    
    println("error cancel signin")
    
  }
}
extension AulaTableViewController: UITableViewDataSource {
  
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
  }
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return AulaObject.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("aulaCell", forIndexPath: indexPath) as! AulaTableViewCell
    var newObjectAlumno : Alumnos = self.AulaObject[indexPath.row] as Alumnos
    
//    cell.NombreTableViewCell.text = newObjectAlumno.objectForKey("nombre") as? String
//    cell.ApellidoTableViewCell.text = newObjectAlumno.objectForKey("apellido") as? String
//    cell.MateriaTableViewCell.text = newObjectAlumno.objectForKey("materia") as? String
//    cell.GestionTableViewCell.text = newObjectAlumno.objectForKey("gestion") as? String
    //cell.CursoTableViewCell.text = newObjectAlumno.objectForKey("curso") as? String
    
    cell.NombreTableViewCell.text = newObjectAlumno.nombre
    cell.ApellidoTableViewCell.text = newObjectAlumno.apellido
    cell.MateriaTableViewCell.text = newObjectAlumno.materia
    cell.GestionTableViewCell.text = newObjectAlumno.gestion
    
    return cell
  }
  
}
