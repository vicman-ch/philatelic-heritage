<%@ Language=VBScript %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta http-equiv="Content-Language" content="fr">
<link rel="stylesheet" href="basic1.css" type="text/css">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Philatelic Links Online</title>
</head>

<body topmargin="8" leftmargin="4" bgcolor="#FFF5D7">
<%
Dim cs, rs
' Open the links database.
cs = "Provider=Microsoft.Jet.OLEDB.4.0;"
cs = cs & "Persist Security Info=False;"
cs = cs & "Data Source="
cs = cs & server.mappath("stamplinks.mdb") & ";"
set ldb = server.createobject("adodb.connection")
ldb.open cs
set rs = ldb.Execute("select * from categories")
%>

<p align="center"><img border="0" src="../ttl-pwo.gif"></p>

<p align="center"><img border="0" src="links_page_title.gif"></p>

<p align="center"><font face="Arial" size="3" color="#FF0000"><b>La source n°1 du
Web pour collectionneurs et négociants</b></font></p>

<div align="center">
<table border="0" width="80%">
  <tr>
    <td width="33%"><p align="center"><a href="../index.html" target="_top"><font face="Arial" size="3">Page
      de Garde PWO</font></a></td>
    <td width="34%"><p align="center"><a href="#This page"><font FACE="Arial">Plus
      d'information</font></a></td>
    <td width="33%"><p align="center"><a href="add_a_link-fr.htm" target="_blank"><font FACE="Arial">Proposez
      votre site</font></a></td>
  </tr>
</table>
</div>

<p align="center" style="border: 1 solid #0000FF; padding: 1"><font FACE="Arial" COLOR="#ff0000">Nouveautés
!</font>&nbsp;<br>
<font FACE="Arial" COLOR="#000080">Essayez &quot;liens valides seulement&quot; (sélection
par défaut) pour n'obtenir que les liens qui fonctionnaient lors de notre
dernière vérification. Décochez cette option pour obtenir tous les liens
contenus dans la base de donnée, valides ou non. Les liens invalides sont
suivis de la mention </font><font FACE="Arial" COLOR="#ff0000">[Dead link]</font><font FACE="Arial" COLOR="#000080">.</font></p>

<hr>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="newonly"><p><font FACE="Arial" COLOR="#000080">Ne
  mentionner que les liens ajoutés au cours des</font><font color="#000080"> <select name="dys" size="1">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
    <option value="25">25</option>
    <option value="30">30</option>
    <option value="35">35</option>
    <option value="40">40</option>
    <option selected value="45">45</option>
    <option value="50">50</option>
  </select>  <font FACE="Arial" COLOR="#000080">derniers jours</font>. <input type="submit" value="Display" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked><font FACE="Arial" COLOR="#000080">Liens
  valides seulement</font></font></p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="bycategory"><p><font color="#000080"><font FACE="Arial" COLOR="#000080">Tous
  les liens de la <span style="background-color: #FFFF00"> catégorie</span> </font>: <select name="key" size="1">
<% ' load the select list.
  rs.movefirst
  do while not rs.eof %>    <option value="<%= rs.fields("Category").value %>"><%= rs.fields("Category").value %> </option>
<% rs.movenext
  loop
  ldb.close
set ldb = nothing
set rs = nothing 
%>  </select><input type="submit" value="Display" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked>  <font FACE="Arial" COLOR="#000080">Liens
  valides seulement</font></font></p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchtitles"><p><font color="#000080"><font FACE="Arial" COLOR="#000080">Tous
  les liens dont le <span style="background-color: #FFFF00"> titre</span> contient</font> : <input type="text" name="key" size="20"> <input type="submit" value="Search"
  name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked><font FACE="Arial" COLOR="#000080">Liens
  valides seulement</font></font></p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchurls"><p><font color="#000080"><font FACE="Arial" COLOR="#000080">Tous
  les liens dont <span style="background-color: #FFFF00"> l'adresse</span> contient</font> : <input type="text" name="key" size="20"> <input type="submit" value="Search"
  name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked><font FACE="Arial" COLOR="#000080">Liens
  valides seulement</font></font> </p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchtitlesanddesc"><p><font color="#000080"><font FACE="Arial" COLOR="#000080">Tous
  les liens dont le <span style="background-color: #FFFF00"> titre ou la description</span> contient </font>: <input type="text" name="key" size="20"> <input
  type="submit" value="Search" name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked><font FACE="Arial" COLOR="#000080">Liens
  valides seulement</font></font></p>
</form>

<hr>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="listall"><p><font color="#000080"><font FACE="Arial" COLOR="#000080">Tous
  les liens (attention : volumineux, téléchargement peut-être long !</font>) <input type="submit" value="List All" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked><font FACE="Arial" COLOR="#000080">Liens
  valides seulement</font></font></p>
</form>

<hr>

<p align="left"><font color="#000080"><font FACE="Arial" COLOR="#000080"><a name="This page">Cette
page</a> donne accès à des pages du Web ou d'autres sources Internet relatives
à la philatélie et à la collection de timbres-poste. Elle est
&quot;unique&quot; car elle offre, contrairement aux listes de même nature, les
avantages suivants </font>:</font></p>
<div align="center"><center>

<table border="0" width="66%">
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF">
      <p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"></font></td>
    <td width="90%"><font FACE="Arial" COLOR="#000080">Plus de 1700 liens,
      nombre en augmentation constante !</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"></font></td>
    <td width="90%"><font FACE="Arial" COLOR="#000080">Aucun lien en double. Sur
      d'autres sites une même page peut être référencée </font><font color="#000080">4
      ou 5 fois.</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"> </font> </td>
    <td width="90%"><font FACE="Arial" COLOR="#000080">Une base de données
      vivante, avec un moteur de recherche interne, au lieu des listes statiques
      hors d'âge.</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"> </font> </td>
    <td width="90%"><font FACE="Arial" COLOR="#000080">La possibilité de ne
      faire apparaître que les derniers liens ajoutés.</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"> </font> </td>
    <td width="90%"><font FACE="Arial" COLOR="#000080">Une fiabilité de près
      de 100%, grâce au retrait régulier des <i><a href="dead_links-fr.htm">liens
      morts</a></i>.</font></td>
  </tr>
</table>
</center></div>

<p align="center"><font FACE="Arial" COLOR="#ff0000">Ajoutez cette page à vos
favoris, vous y retournerez plus facilement !</font>
</p>

<table border="0" width="100%">
  <tr>
    <td width="50%"><p align="center"><a href="add_a_link-fr.htm"><font FACE="Arial">Proposez
      votre site</font></a></td>
    <td width="50%"><p align="center"><a href="../index.html" target="_top"><font FACE="Arial">Page
      de garde PWO</font></a></td>
  </tr>
</table>

<hr>

<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="3" width="100%">
    <tr>
      <td width="50%"><b><font color="#000080" face="Arial" size="1">Créé le 24
        juillet 2001. Mis à jour le <!--webbot bot="Timestamp" S-Type="EDITED"
        S-Format="%d.%m.%y" startspan -->16.08.01<!--webbot bot="Timestamp" endspan i-checksum="12437" -->
        .<br>
        Traduction française par André Hurtré, PWO.<br>
        Copyright © 2001 par PWO et<br>
        par Victor Manta, Suisse<br>
        Tous droits réservés mondialement.</font></b><font FACE="Arial"><b><font face="Arial" size="1" color="#000080"><small><br>
        </small></font></b></font><b><font face="Arial" size="1" color="#FF0000">Compiled
and programmed by Peter G. Aitken, USA</font></b></td>
    </center>
    <td width="50%">
      <p align="right"><a href="http://www.pwmo.org" target="_top"><img border="0" src="../images/pwo-logo.gif"></a></td>
  </tr>
  </table>
</div>

<hr>

</body>
</html>
