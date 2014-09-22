	<script type="text/javascript">
	/* <![CDATA[ */

		function confirmSubmit() {
			if (document.forms[0].name.value == ""
			 || document.forms[0].name.value == "- Click here and enter your full name -"
			 || document.forms[0].emailAddress.value == ""
			 || document.forms[0].emailAddress.value == "- Click here and enter your e-mail address -"
			 || document.forms[0].area.value == ""
			 || document.forms[0].exchange.value == ""
			 || document.forms[0].phone.value == "") {
				window.alert("You must enter all the information to complete the form.");
				return false;
			} else {
				checkPreferences();
				checkSecurity();
				var submitForm = 
					window.confirm("Are you sure you want to submit the form?");
				if (submitForm == true); {
					return true;
				}
				return false;
			}
		}
		function confirmReset() {
			var resetForm = 
				window.confirm("Are you sure you want to reset the form?");
			if (resetForm == true) {
				return true;
			}
			return false;
		}
		/* ]]> */
	</script>
