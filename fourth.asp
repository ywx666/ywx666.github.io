<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%if Request.ServerVariables("Request_Method")="GET" then%>
	<form method="post" action="fourth.asp">
     	<input type="text" name="nike" value="your nick name" />
        <p><input type="submit" value="come in"  /></p>
        <input type="hidden" name="log" size="20" value="1" />
     </form>
 <% Response.End
   else 
   Response.Clear
   dim talk
    If Request.Form("nick")<>"" then
		Session("nick")=Request.Form("nick")
	End if
%>
<form method="post" action="fourth.asp" name="form1">
  <% = Session("nick")% >话语:
  <input type="text" name="talk" size="50"  /><br />
  <input type="submit" value="提交"  />
  <input type="reset" value="取消" /></p>
</form>
<a  href="fourth.asp">离开</a><br />
<%
If Request.Form("log")<>1 then
If trim(Request.Form("talk"))="" then
 talk=Session("nick")&"不说一句话就想来敷衍大家"
Else
 talk=trim(Request.Form("talk"))
 End If
 
 Application.Lock
 	Application("show")="来自"&Request.ServerVariables("remote_adder")&"的"
	&Session("nick")&"在"&time&"的时候说："&talk&"<br>"&Application("show")
	Application.UnLock
	Response.Write Application("show")
	End if
%>

<% End if %>

