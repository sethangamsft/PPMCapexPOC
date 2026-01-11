 

aspect domaintable {
  key code        : String(100);
      description : String(255);

};

aspect userdomain {
  key ID     : UUID @Core.Computed;
      userID : String(100);
      Name   : String(100);

}


aspect remotedomain {
  key code        : UUID;
      name        : String(100);
      description : String(255);
}

aspect capexExtensions {
  requestDate : Date;
}
