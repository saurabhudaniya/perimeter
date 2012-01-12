// JavaScript Document
function showhide(id){
	var ele = document.getElementById(id);
		if(ele){
			var style = ele.style.display;
			if(style == "none"){
				ele.style.display = "block";
			}else{
				ele.style.display = "none";
			}
		}
	}

	
function showSignup()
{
	document.getElementById('overlayPopup').style.display = '';
	document.getElementById('signUpPopUp').style.display = '';
}

function hideSignup()
{
	document.getElementById('overlayPopup').style.display = 'none';
	document.getElementById('signUpPopUp').style.display = 'none';
}



  var fadeOpacity  = new Array();
  var fadeTimer    = new Array();
  var fadeInterval = 100;  // milliseconds

  function fade(o,d)
  {
  
	// o - Object to fade in or out.
	// d - Display, true =  fade in, false = fade out
  
	var obj = document.getElementById(o);
  
	if((fadeTimer[o])||(d&&obj.style.display!='block')||(!d&&obj.style.display=='block'))
	{
  
	  if(fadeTimer[o])
		clearInterval(fadeTimer[o]);
	  else
		if(d) fadeOpacity[o] = 0;
		else  fadeOpacity[o] = 9;
	
	  obj.style.opacity = "."+fadeOpacity[o].toString();
	  obj.style.filter  = "alpha(opacity="+fadeOpacity[o].toString()+"0)";
	  
	  if(d)
	  {
		obj.style.display = 'block';
		fadeTimer[o] = setInterval('fadeAnimation("'+o+'",1);',fadeInterval);
	  }
	  else
		fadeTimer[o] = setInterval('fadeAnimation("'+o+'",-1);',fadeInterval);
	}
  }

  function fadeAnimation(o,i)
  {

	// o - o - Object to fade in or out.
	// i - increment, 1 = Fade In

	var obj = document.getElementById(o);
	fadeOpacity[o] += i;
	obj.style.opacity = "."+fadeOpacity[o].toString();
	obj.style.filter  = "alpha(opacity="+fadeOpacity[o].toString()+"0)";

	if((fadeOpacity[o]=='9')|(fadeOpacity[o]=='0'))
	{
	  if(fadeOpacity[o]=='0')
		obj.style.display = 'none';
	  else
	  {
		obj.style.opacity = "1";
		obj.style.filter  = "alpha(opacity=100)";
	  }
  
	  clearInterval(fadeTimer[o]);
	  delete(fadeTimer[o]);
	  delete(fadeTimer[o]);
	  delete(fadeOpacity[o]);
  
	}  
  }

