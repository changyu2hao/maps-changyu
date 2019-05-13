

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="main" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="position: relative; min-height: 100%;" >
    <head runat="server">
    <title>Algonquin College</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="App_Themes/ACMasterPage_Theme/css/bootstrap.min.css" rel="stylesheet" />
    <link href="App_Themes/ACMasterPage_Theme/css/Site.css" rel="stylesheet" />
    <link href="App_Themes/SiteStyles.css" rel="stylesheet" />
    </head>

    <form id="form1" runat="server">
        <asp:scriptmanager runat="server"></asp:scriptmanager>
        <asp:Panel id="mymap" runat="server">
        <head>
            <link href="App_Themes/SiteStyles.css" rel="stylesheet" />
            <style>
            /* Set the size of the div element that contains the map */
            #map {
                height: 400px;  /* The height is 400 pixels */
                width: 100%;  /* The width is the width of the web page */
                 }
            </style>
        </head>
        <body>
            <h3>Please choose a place in the map</h3>
            <!--The div element for the map -->
            <div id="map"></div>
            <script>
            // Initialize and add the map
                function initMap()
                {
                    // The location of Uluru
                    var uluru = {lat: 45.4255, lng: -75.692};
                    // The map, centered at Uluru
                    var map = new google.maps.Map(
                    document.getElementById('map'), {zoom: 10, center: uluru});
                    // The marker, positioned at                    
                    //var marker = new google.maps.Marker({
                    //position: uluru,
                    //map: map,
                    //title: 'Uluru (Ayers Rock)'
                    //});
                    var strlat = document.getElementById("lblLat").value;
                    var strlng = document.getElementById("lbllng").value;
                    //var latarray = new Array();
                    //var lngarray = new Array();                   
                    var latarray = strlat.split(" ");
                    var lngarray = strlng.split(" ");

                    for (i = 0; i < latarray.length; i++) {
                        var location = { lat: latarray[i], lng: lngarray[i] };
                        var marker = new google.maps.Marker({
                        position: location,
                        map: map,
                    });
                    }

                    //document.getElementById(lblcountType) = latarray.join(" "); 

                    var markerarray = new Array();
                    var marker1 = null;
                    //var infowindow = new google.maps.infowindow({
                    //    content: "Hello world"
                    //});
                    google.maps.event.addListener(map, 'click', function (e) {                   
                        var myLatLng = { lat: e.latLng.lat(), lng: e.latLng.lng() };
                        //var Player = document.getElementById('lblcountPlayers').value;
                        marker1 = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        });
                        markerarray.push(marker1);
                        var infowindow = new google.maps.InfoWindow({
                        content:"Hello World!"
                        });
                        for (var i = 0; i < markerarray.length; i++) {
                        infowindow.open(map,markerarray[i]);
                        }
                        
                        document.getElementById("Hiddenlat").value = e.latLng.lat();//get the latitude from asp.net
                        document.getElementById("Hiddenlng").value = e.latLng.lng();//get the longtitude from asp.net
                        //infowindow.open(map, marker);
                        
                    });
                    //var con = new ActiveXObject("ADODB.Connection"); 
                    //con.ConnectionString = "DRIVER={MySQL ODBC 5.1 Driver};OPTION=3;SERVER=localhost;User ID=root;Password=hemuyang0421;Database=mysql;Port=3306"; 
                    ////服务器地址，数据库 账号密码，数据库名，端口 
                    //con.open; 
                    //var rs = new ActiveXObject("ADODB.Recordset"); 
                    //rs.open("select * from mymaps.mapdata", con); 
                    //while (!rs.eof) { 
                    //    var u = rs.Fields("Phone");
                    //    document.getElementById("Hidden1").value = u;
                    //rs.moveNext; 
                    //} 
                    //rs.close(); 
                    //rs = null; 
                    //con.close(); 
                    //con = null; 
                    
                    
                    
                    //infowindow.open(map, marker);


                    //document.getElementById('insert'), {zoom: 10, center: uluru});
                    //string strsearch


                    //var map1 = new google.maps.Map(
                      //  document.getElementsByName('button vet= "12019"');

                    //var marker = new google.maps.Marker({ position: uluru, map: map });
                    
                }
                google.maps.event.addDomListener(window, 'load', initialize);

            </script>
            <!--Load the API from the specified URL
            * The async attribute allows the browser to render the page while the API loads
            * The key parameter will contain your own API key (which is not needed for this tutorial)
            * The callback parameter executes the initMap() function
            -->
            <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuV-FcM5NgxbpEdoLvpQF58HN9aH82-gI&callback=initMap">
            </script>
        </body>
        </asp:Panel>
        <br />
        <br />
        <asp:button ID="choosebutton" runat="server" text="choose" OnClick="choosebutton_Click" />
        <asp:Panel id="popup" runat="server" CssClass="popup">
            <table>
                <tr>
                    <td>
                    <input id="Hiddenlat" type="hidden" runat="server" /> 
                    </td><%--put the latitude here--%>
                    <td>
                    <input id="Hiddenlng" type="hidden" runat="server" />
                    </td><%--put the longtitude here--%>
                    <td>
                    <input id="lblLat" runat="server" />
                    <input id="lbllng" runat="server" />
                    <input id="lblcountTime" runat="server" />
                    <input id="lblcountPhone" runat="server" />
                    <input id="lblcountType" runat="server" />
                    <input id="Players" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Label ID="lblplayers" runat="server" Text="Number of Players"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txplayers" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorplayers" runat="server" ControlToValidate="txplayers" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                        <div class="col-md-3">
                        <asp:RangeValidator ID="RangeValidatorplayers" runat="server" CssClass="error" ControlToValidate="txplayers" ErrorMessage="Should be larger than 0 and less than 20" MaximumValue="20" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                            </div>
                    </td>
                </tr>
                 <tr>
                    <td>
                    <asp:Label ID="Labeldate" runat="server" Text="Date(mm/dd)"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatordate" runat="server" ControlToValidate="txtdate" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderdate" runat="server" TargetControlID="txtdate" MaskType="Date" Mask="99/99" MessageValidatorTip="true" UserDateFormat="None" UserTimeFormat="None" InputDirection="RightToLeft" ErrorTooltipEnabled="true" ></ajaxToolkit:MaskedEditExtender>
                    <br />
                    <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Label ID="lbltime" runat="server" Text="Time"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtime" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortime" runat="server" ControlToValidate="txtime" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtendertime" runat="server" TargetControlID="txtime" Mask="99:99" MaskType="Time" CultureName="en-us" MessageValidatorTip="true"></ajaxToolkit:MaskedEditExtender>
                    <br />
                    <br />
                    </td>
                </tr>
                <caption>
                    <br />
                    <br />
                    <tr>
                        <td>
                            <asp:Label ID="lblphone" runat="server" Text="Phone Number"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txphone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" runat="server" ControlToValidate="txphone" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSports" runat="server" Text="Sports"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txSports" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorsports" runat="server" ControlToValidate="txSports" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>--%>
                                    <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" />
                              <%--  </ContentTemplate>
                            </asp:UpdatePanel>--%>
                        </td>
                        <td>
                            <asp:Button ID="btnclose" runat="server" OnClick="btnclose_Click" Text="Close" />
                        </td>
                    </tr>
                </caption>
            </table>
    </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtenderplayers" TargetControlID="choosebutton" CancelControlID="btnclose" PopupControlID="popup" runat="server"></ajaxToolkit:ModalPopupExtender>
    </form>
</html>