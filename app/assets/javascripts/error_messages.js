// form validation function //
function validatelogin(form) {
    

    var email                 = form.user_email.value;
    var password              = form.user_password.value;
   

    //var gender = form.gender.value;
    //var message = form.user_message.value;
    var nameRegex = /^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$/;
    var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    var messageRegex = new RegExp(/<\/?\w+((\s+\w+(\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>/gim);
    var passwordRegex = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/;
  
  
    if(email == "" | email == "Your Email" ) {
        inlineMsg('signin','<strong>Error</strong><br />You must enter your email.',2);
        return false;
    }
 
    if(!email.match(emailRegex)) {
        inlineMsg('signin','<strong>Error</strong><br />You have entered an invalid email.',2);
        return false;
    }
  
  
    
    
    if(password == "") {
        inlineMsg('signin', 'You must enter password.', 2);
        return false;
    }
    

    
    

   
  
  
  
    /*if(gender == "") {
    inlineMsg('gender','<strong>Error</strong><br />You must select your gender.',2);
    return false;
  }*/
//    if(message == "") {
//        inlineMsg('message','You must enter a message.');
//        return false;
//    }
//    if(message.match(messageRegex)) {
//        inlineMsg('message','You have entered an invalid message.');
//        return false;
//    }
  return true;
}






function validate(form) {
    
    var name                  = form.user_name.value;
    var address               = form.user_address.value;
    var contact               = form.user_contact.value;
    var email                 = form.user_email.value;
    var password              = form.user_password.value;
    var password_confirmation = form.password.value;

    //var gender = form.gender.value;
    //var message = form.user_message.value;
    var nameRegex = /^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$/;
    var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    var messageRegex = new RegExp(/<\/?\w+((\s+\w+(\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>/gim);
    var passwordRegex = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/;
  
    if(name == "" ) 
    {
        inlineMsg('user_first_name','You must enter your name.', 2);
        return false;
        
    }
    if(!name.match(nameRegex)) {
        inlineMsg('user_first_name','You have entered an invalid name.',2);
        return false;
    }
    if(email == "" | email == "Your Email" ) {
        inlineMsg('user_email','<strong>Error</strong><br />You must enter your email.',2);
        return false;
    }
 
    if(!email.match(emailRegex)) {
        inlineMsg('user_email','<strong>Error</strong><br />You have entered an invalid email.',2);
        return false;
    }
  
  if(address == "" ) 
    {
        inlineMsg('user_address','You must enter your name.', 2);
        return false;
        
    }
    if(contact == "" ) 
    {
        inlineMsg('user_contact','You must enter your name.', 2);
        return false;
        
    }
    
    
    if(password == "") {
        inlineMsg('user_password', 'You must enter password.', 2);
        return false;
    }
    
    if(!password.match(passwordRegex)) {
        inlineMsg('user_password', 'Password must contains  7 number of characters and 1 number', 2);
        return false;
    }
    
    

    if(password != password_confirmation) {
        inlineMsg('user_password_confirmation', 'Password must match.', 2);
        return false;
    }
  
  
  
    /*if(gender == "") {
    inlineMsg('gender','<strong>Error</strong><br />You must select your gender.',2);
    return false;
  }*/
//    if(message == "") {
//        inlineMsg('message','You must enter a message.');
//        return false;
//    }
//    if(message.match(messageRegex)) {
//        inlineMsg('message','You have entered an invalid message.');
//        return false;
//    }
  return true;
}

// START OF MESSAGE SCRIPT //

var MSGTIMER = 20;
var MSGSPEED = 5;
var MSGOFFSET = 3;
var MSGHIDE = 3;

// build out the divs, set attributes and call the fade function //
function inlineMsg(target, string, autohide) {
    var msg;
    var msgcontent;
    if(!document.getElementById('msg')) {
        msg = document.createElement('div');
        msg.id = 'msg';
        msgcontent = document.createElement('div');
        msgcontent.id = 'msgcontent';
        document.body.appendChild(msg);
        msg.appendChild(msgcontent);
        msg.style.filter = 'alpha(opacity=0)';
        msg.style.opacity = 0;
        msg.alpha = 0;
    } else {
        msg = document.getElementById('msg');
        msgcontent = document.getElementById('msgcontent');
    }
    msgcontent.innerHTML = string;
    msg.style.display = 'block';
    var msgheight = msg.offsetHeight;
    var targetdiv = document.getElementById(target);
    targetdiv.focus();
    var targetheight = targetdiv.offsetHeight;
    var targetwidth = targetdiv.offsetWidth;
    var topposition = topPosition(targetdiv) - ((msgheight - targetheight) / 2);
    var leftposition = leftPosition(targetdiv) + targetwidth + MSGOFFSET;
    msg.style.top   = topposition + 'px';
    msg.style.left = leftposition + 'px';
    clearInterval(msg.timer);
    msg.timer = setInterval("fadeMsg(1)", MSGTIMER);
    if(!autohide) {
        autohide = MSGHIDE;
    }
    window.setTimeout("hideMsg()", (autohide * 5000));
}

// hide the form alert //
function hideMsg(msg) {
    var msg = document.getElementById('msg');
    if(!msg.timer) {
        msg.timer = setInterval("fadeMsg(0)", MSGTIMER);
    }
}

// face the message box //
function fadeMsg(flag) {
    if(flag == null) {
        flag = 1;
    }
    var msg = document.getElementById('msg');
    var value;
    if(flag == 1) {
        value = msg.alpha + MSGSPEED;
    } else {
        value = msg.alpha - MSGSPEED;
    }
    msg.alpha = value;
    msg.style.opacity = (value / 100);
    msg.style.filter = 'alpha(opacity=' + value + ')';
    if(value >= 99) {
        clearInterval(msg.timer);
        msg.timer = null;
    } else if(value <= 1) {
        msg.style.display = "none";
        clearInterval(msg.timer);
    }
}

// calculate the position of the element in relation to the left of the browser //
function leftPosition(target) {
    var left = 0;
    if(target.offsetParent) {
        while(1) {
            left += target.offsetLeft;
            if(!target.offsetParent) {
                break;
            }
            target = target.offsetParent;
        }
    } else if(target.x) {
        left += target.x;
    }
    return left;
}

// calculate the position of the element in relation to the top of the browser window //
function topPosition(target) {
    var top = 0;
    if(target.offsetParent) {
        while(1) {
            top += target.offsetTop;
            if(!target.offsetParent) {
                break;
            }
            target = target.offsetParent;
        }
    } else if(target.y) {
        top += target.y;
    }
    return top;
}

// preload the arrow //
if(document.images) {
    arrow = new Image(7,80);
    arrow.src = "msg_arrow.gif";
}