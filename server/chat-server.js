var mysql = require('mysql');

var con = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '123',
  database : 'minions'
});

var USER=[];

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  con.query("select * from users", function (err, result) {
    if (err) throw err;
    USER = result;
  });
});

var express = require('express');
var expressWs = require('express-ws')

var expressWs = expressWs(express());
var app = expressWs.app;


function compute (m) {
  var list =  m.split("|");
  var messageType = list[0];
  if (messageType== "LOGOUT"){
    var id_ = parseInt(list[1]);
    console.log((USER.length).toString());
    console.log((id_).toString());

    USER[id_].isLogin = "0";
    return "LOGOUT|0";
  }

  if (messageType== "LOGIN") {
    var name_ = list[1];
    var password_ = list[2];
    for(var i = 0; i < USER.length;i++){   
      //console.log(USER[i].name.concat(USER[i].password));

      if (name_ == USER[i].name && password_ == USER[i].password){
        USER[i].isLogin = "1";

        var return_msg = "LOGIN|".concat((USER[i].index).toString()); 
        
        /*var online = "|";
        for (var jj = 0; jj < USER.length;jj++){  
          console.log("0000");
          console.log(USER[jj].isLogin);
          if ((USER[jj].isLogin) == "1"){
            online = online.concat(USER[jj].name).concat("@");
          }
        }
        return_msg = return_msg.concat(online);*/
        return return_msg;
      }
    }
    return "LOGIN|-1"
  }
  //////////////////////////////////
  else if (messageType== "MESSAGE") {
    var id_ = list[1];
    var name_ = list[2];
    var password_ = list[3];
    var content_ = list[4];

    if (id_ == "Nothing"){
      return "MESSAGE|anonymous:".concat(content_);
    }
    else {
      //var index_ = parseInt(id_);
      var quwry_temp_m = "INSERT INTO `records` VALUES ( ".concat(id_).concat(", \" ").concat(content_).concat("\" , \" ").concat("2018-4-18").concat(" \" );") ;
      //console.log(quwry_temp_m);

      con.query(quwry_temp_m, function (err, result) {
        if (err) throw err;
      });
      return "MESSAGE|".concat(name_.concat(":").concat(content_));
    }
  }
  /////////////////////////////////////
  else if (messageType == "REGISTER"){
    var name_ = list[1];
    var password_ = list[2];
    var password_again = list[3];
    if (password_ != password_again) return "REGISTER|-1";
    for(var i = 0; i < USER.length;i++){   
      //console.log(USER[i].name.concat(USER[i].password));

      if (name_ == USER[i].name && password_ == USER[i].password){
        //console.log(USER[i].index);
        return "REGISTER|-2"; 
      }
    }
    var quwry_temp = "INSERT INTO `users` VALUES (".concat(USER.length.toString()).concat(", \" ").concat(name_).concat("\" ,\" ").concat(password_).concat("\",0);")
    
    //console.log("sql----:".concat(quwry_temp));
    con.query(quwry_temp, function (err, result) {
      if (err) throw err;
      USER.push ({ index:USER.length , name:name_, password: password_, isLogin:0 });
      console.log("index".concat((USER.length).toString()));
    });

    
    //console.log(USER[USER.length-1].name.concat(USER[USER.length-1].password));
    return "REGISTER|".concat((USER.length-1).toString());
  }
}

app.ws('/hello', function(ws, req) {
  console.log('A client connected!');
  
  ws.on('message', function(message) {
    console.log(`A client sent a message: ${message}`);
    var Msg = compute (message)
    console.log("Back::".concat(Msg));

    var Back_Msg =  Msg.split("|");
    if (Back_Msg[0] == "MESSAGE"){
      //console.log("broadcse");
      aWss.clients.forEach(function (client) {
        client.send(Msg);
      });
    }
    else {
      //console.log("non-broadcse");
      ws.send(Msg);
      aWss.clients.forEach(function (client) {
        var update_login = "LOGIN_NEW|";
        var online = "";
        for (var jj = 0; jj < USER.length;jj++){  
          if ((USER[jj].isLogin) == "1"){
            online = online.concat(USER[jj].name).concat("@");
          }
        }
        update_login = update_login.concat(online);
        console.log(update_login);
        client.send(update_login);
      });
    }
    
  });
});
var aWss = expressWs.getWss('/hello');

app.listen(8081)
