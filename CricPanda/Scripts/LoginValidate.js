
function checkLoginFields()
{
	var userName = document.getElementById("1").value;
	var password = document.getElementById("2").value;
	flag = true;
	if (userName == "" || password == "") {
		alert("Please Enter All Fields");
		flag = false;
	}
	else if (password.length < 6) {
		alert("Incorrect Password");
		flag = false;
	}
	else if (userName.length > 25) {
		alert("Incorrect User Name");
		flag = false;
	}

	return flag;
	
}

function checkSignupFields() {
	var firstName = document.getElementById("FN").value;
	var lastName = document.getElementById("LN").value;
	var userName = document.getElementById("NK").value;
	var password = document.getElementById("Pass").value;

	if (userName == "" || password == "")
	{
		alert("Please Enter All Fields");
	}
	else if (password.length < 6)
	{
		alert("Incorrect Password(Min length 6)");
	}
	else if (userName.length > 25 || firstName.length > 25 || lastName.length > 25)
	{
		alert("Name is too Long(Max 25 characters)");
	}
}

