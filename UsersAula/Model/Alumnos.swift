//
//  Alumnos.swift
//  UsersAula
//
//  Created by MIguel Saravia on 5/26/15.
//  Copyright (c) 2015 Xiobit. All rights reserved.
//

import Foundation
import Parse

class Alumnos: PFObject , PFSubclassing {
  
  @NSManaged  var nombre : String!
  @NSManaged  var apellido : String!
  @NSManaged  var curso : String!
  @NSManaged  var materia : String!
  @NSManaged  var gestion : String!
  @NSManaged  var profesorId : PFUser
  
  func getfullname() -> String{
    return nombre + " " + apellido
  }
  override class func initialize() {
    var onceToken : dispatch_once_t = 0;
    dispatch_once(&onceToken) {
      self.registerSubclass()
    }
  }
  class func parseClassName() -> String {
    return "Alumnos"
  }
}