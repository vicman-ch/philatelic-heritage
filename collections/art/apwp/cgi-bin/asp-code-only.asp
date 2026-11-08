If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
      If Request.Form("Code") = "25a3do4" Then    'ADAUGAT DE VM
           If Request.Form("VTI-GROUP") = "0" Then
	Err.Clear

	Set fp_conn =  Server.CreateObject("ADODB.Connection")
	FP_DumpError strErrorUrl, "Cannot create connection"

	Set fp_rs = Server.CreateObject("ADODB.Recordset")
	FP_DumpError strErrorUrl, "Cannot create record set"

	fp_conn.Open Application("apwp_ConnectionString")
	FP_DumpError strErrorUrl, "Cannot open database"

	fp_rs.Open "Members", fp_conn, 1, 3, 2 ' adOpenKeySet, adLockOptimistic, adCmdTable
	FP_DumpError strErrorUrl, "Cannot open record set"

	fp_rs.AddNew
	FP_DumpError strErrorUrl, "Cannot add new record set to the database"
	Dim arFormFields0(7)
	Dim arFormDBFields0(7)
	Dim arFormValues0(7)

	arFormFields0(0) = "Email"
	arFormDBFields0(0) = "E-mail"
	arFormValues0(0) = Request("Email")
	arFormFields0(1) = "URL"
	arFormDBFields0(1) = "URL"
	arFormValues0(1) = Request("URL")
	arFormFields0(2) = "Site_Name"
	arFormDBFields0(2) = "Name"
	arFormValues0(2) = Request("Site_Name")
	arFormFields0(3) = "Languages"
	arFormDBFields0(3) = "Lang"
	arFormValues0(3) = Request("Languages")
	arFormFields0(4) = "Page_Type"
	arFormDBFields0(4) = "Type"
	arFormValues0(4) = Request("Page_Type")
	arFormFields0(5) = "Country"
	arFormDBFields0(5) = "Country"
	arFormValues0(5) = Request("Country")
	arFormFields0(6) = "Author_Name"
	arFormDBFields0(6) = "Author"
	arFormValues0(6) = Request("Author_Name")

	FP_SaveFormFields fp_rs, arFormFields0, arFormDBFields0


	fp_rs.Update
	FP_DumpError strErrorUrl, "Cannot update the database"

	fp_rs.Close
	fp_conn.Close

	FP_FormConfirmation "text/html; charset=windows-1252",_
						"Form Confirmation",_
						"Thank you for submitting the following information:",_
						"apwp-db-update.asp",_
						"Return to the form."
             End If
    Else   'ADAUGAT DE VM
	Response.write ("Bad Code!")   'ADAUGAT DE VM
                fp_rs.Close  'ADAUGAT DE VM
	fp_conn.Close  'ADAUGAT DE VM
    End If    'ADAUGAT DE VM   
End If