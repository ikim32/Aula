//
//  RegistroAlumnosViewController.swift
//  UsersAula
//
//  Created by MIguel Saravia on 5/25/15.
//  Copyright (c) 2015 Xiobit. All rights reserved.
//

import UIKit
import Parse
import TSMessages

class RegistroAlumnosViewController: UIViewController {

  //var AlumnosObject: PFObject! = PFObject(className: "Alumnos")
  var currentAlumno = Alumnos()
  
  @IBOutlet weak var NombreViewController: UITextField!
  @IBOutlet weak var ApellidoViewController: UITextField!
  @IBOutlet weak var MateriaViewController: UITextField!
  @IBOutlet weak var GetionViewController: UITextField!
  @IBOutlet weak var CursoViewController: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  @IBAction func btnGuardarViewController(sender: AnyObject) {
    
    /*self.AlumnosObject["nombre"] = self.NombreViewController.text as String
    self.AlumnosObject["apellido"] = self.ApellidoViewController.text as String
    self.AlumnosObject["materia"] = self.MateriaViewController.text as String
    self.AlumnosObject["gestion"] = self.GetionViewController.text as String
    self.AlumnosObject["curso"] = self.CursoViewController.text as String
    self.AlumnosObject["profesorId"] = PFUser.currentUser()
    if AlumnosObject.saveInBackground() == true {
    TSMessage.showNotificationWithTitle("Success", subtitle: "Registro de Alumno Almacenado en Parse", type: TSMessageNotificationType.Success)
    AlumnosObject.saveInBackground()
    }else{
      TSMessage.showNotificationWithTitle("error", subtitle: "Registro no Almacenado", type: TSMessageNotificationType.Error)
    }
    
    self.navigationController?.popToRootViewControllerAnimated(true)*/
    
    currentAlumno.nombre = self.NombreViewController.text
    currentAlumno.apellido = self.ApellidoViewController.text
    currentAlumno.materia = self.MateriaViewController.text
    currentAlumno.gestion = self.GetionViewController.text
    currentAlumno.curso = self.CursoViewController.text
    currentAlumno.profesorId = PFUser.currentUser()!
  /*  currentAlumno.saveInBackgroundWithBlock{
      (success:Bool, error:NSError?) -> Void in
      print("Alumno Guardado")
      TSMessage.showNotificationWithTitle("success", subtitle: "Se Guardaron los Datos", type: TSMessageNotificationType.Success)
    }*/
   // self.view.endEditing(true)
    //self.dismissViewControllerAnimated(true, completion: nil)
    currentAlumno.saveInBackground()
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  
  
}
