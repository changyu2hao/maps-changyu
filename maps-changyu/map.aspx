﻿

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="main" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="position: relative; min-height: 100%;" >
    <head runat="server">
    <title>Algonquin College</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="App_Theme/ACMasterPage_Theme/css/bootstrap.min.css" rel="stylesheet" />
    <link href="App_Theme/ACMasterPage_Theme/css/Site.css" rel="stylesheet" />
    <link href="App_Theme/SiteStyle.css" rel="stylesheet" />
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
            <br />
            <table>
                <tr>
                    <td>
                    <input id="Hiddenlat" type="hidden" runat="server" /> 
                    </td><%--put the latitude here--%>
                    <td>
                    <input id="Hiddenlng" type="hidden" runat="server" />
                    </td><%--put the longtitude here--%>
                    <td>
                    <input id="lblLat" type="hidden" runat="server" />
                    <input id="lbllng" type="hidden" runat="server" />
                    <input id="inpPlayers" type="hidden" runat="server" />
                    <input id="inpDate" type="hidden" runat="server" />
                    <input id="inpTime" type="hidden" runat="server" />
                    <input id="inpphone" type="hidden" runat="server" />
                    <input id="inptype" type="hidden" runat="server" />
                    </td>
                </tr>
            </table>
            <!--The div element for the map -->
            <div id="map"></div>
            <script>
            // Initialize and add the map
                function initMap()
                {
                    // The location of Ottawa
                    var Ottawa = {lat: 45.425533, lng: -75.692482};
                    // The map, centered at Ottawa
                    var map = new google.maps.Map(
                    document.getElementById('map'), {zoom: 10, center: Ottawa});
                    // The marker, positioned at                    
                    //var marker = new google.maps.Marker({
                    //position: uluru,
                    //map: map,
                    //title: 'Uluru (Ayers Rock)'
                    //});
                    //var markerarray = new Array();
                    var strlat = document.getElementById("lblLat").value;
                    var strlng = document.getElementById("lbllng").value;
                    var strplayers = document.getElementById("inpPlayers").value;
                    var strdate = document.getElementById("inpDate").value;
                    var strtime = document.getElementById("inpTime").value;
                    var strphone = document.getElementById("inpphone").value;
                    var strtype = document.getElementById("inptype").value;
                    var latarray = new Array();
                    var lngarray = new Array();
                    var playersarray = new Array();
                    var datearray = new Array();
                    var timearray = new Array();
                    var phonearray = new Array();
                    var typearray = new Array();
                    latarray = strlat.split(" ");
                    lngarray = strlng.split(" ");
                    playersarray = strplayers.split(" ");
                    datearray = strdate.split(" ");
                    timearray = strtime.split(" ");
                    phonearray = strphone.split(" ");
                    typearray = strtype.split(" ");
                    var marker1array = new Array();



                    //document.getElementById("lblcountType").value = latarray[0];
                    //document.getElementById("lblcountPhone").value = lngarray[8];
                     
                                
                    for (i = 0; i < latarray.length; i++) {

                        if (Number(latarray[i]) != 0 && Number(lngarray[i]) != 0) {
                            var location = { lat: Number(latarray[i]), lng: Number(lngarray[i]) };
                            var marker = new google.maps.Marker({
                            position: location,
                            map: map,
                            });                            
                            //map.addOverlay(marker);
                            marker1array.push(marker);

                            //for (j = 0; j < i; j++) {
                            //    marker1array[j].addListener('click', function (e) {
                            //        marker1array[j].setMap(null);
                            //    });
                            //}

                            var infowindow = new google.maps.InfoWindow({
                                content: "Players Number: " + playersarray[i] + "<br>" + "Date: " + datearray[i] + "<br>" + "Time: " + timearray[i]+"<br>" + "Phone Number: " + phonearray[i]+"<br>" + "Sports Type: " + typearray[i] 
                            });       
                            infowindow.open(map,marker);
                            //markerarray.push(marker);  
                        }                        
                    }
        
                    //for (i = 0; i < latarray.length; i++) {
                    //    google.maps.event.addListener(marker1array[i], 'click', function (e) {
                    //        marker1array[i].setMap(null);
                        
                    //    });                    
                        
                    //}
                    

                    var marker1 = null;
                    var markerarray = new Array();
                    google.maps.event.addListener(map, 'click', function (e) {
                        //for (let j = 0; j < marker1array.length; j++) {
                        //    if (e.latLng.lat() == marker1array[j].latLng.lat() && e.latLng.lng() == marker1array[j].latLng.lng()) {
                        //        marker1array[j].setMap(null);
                        //    }
                        //    else {
                        //        continue;
                        //    }
                        //}
                        var myLatLng = { lat: e.latLng.lat(), lng: e.latLng.lng() };
                        //var Player = document.getElementById('lblcountPlayers').value;
                        marker1 = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        });                    

                        markerarray.push(marker1);

                        //google.maps.event.addListener(map, 'rightclick', function (e) {     
                        //    for()
                        //    if(e.latLng.lat())
                        //    markerPar.setMap(null);
                        //});

                        if (markerarray.length > 1) {
                            markerarray[0].setMap(null);
                            markerarray.splice(0,1);
                        }
                        //make there is only one marker when the user click on the map

                        document.getElementById("Hiddenlat").value = e.latLng.lat();//get the latitude from asp.net
                        document.getElementById("Hiddenlng").value = e.latLng.lng();//get the longtitude from asp.net
                        //infowindow.open(map, marker);                        
                    });     
                    //google.maps.event.addListener(map, "rightclick", function (point) {
                    //    for (let j = 0; j < marker1array.length; j++) {
                    //        if (e.latLng.lat() == marker1array[j].latLng.lat() && e.latLng.lng() == marker1array[j].latLng.lng()) {
                    //            delMarker(marker1array[j])
                    //        }
                    //        else {
                    //            continue;
                    //        }
                    //    }
                    //});
                }

                google.maps.event.addDomListener(window, 'load', initialize);

            </script>
            <!--Load the API from the specified URL
            * The async attribute allows the browser to render the page while the API loads
            * The key parameter will contain your own API key (which is not needed for this tutorial)
            * The callback parameter executes the initMap() function
            -->
            <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuV-FcM5NgxbpEdoLvpQF58HN9aH82-gI&libraries=places&callback=initMap">
            </script>
        </body>
        </asp:Panel>
        <br />
        <br />
        <asp:button ID="choosebutton" runat="server" text="choose" OnClick="choosebutton_Click" CssClass="button"/>
        <asp:Panel id="popup" runat="server" CssClass="popup1">
            <table>                
                <tr>
                    <td>
                    <asp:Label ID="lblplayers" runat="server" Text="Number of Players:" CssClass="label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txplayers" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorplayers" runat="server" ControlToValidate="txplayers" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidatorplayers" runat="server" CssClass="error" ControlToValidate="txplayers" ErrorMessage="Should be larger than 0 and less than 30" MaximumValue="30" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        <br />
                    </td>
                </tr>
                
                 <tr>
                    <td>
                    <asp:Label ID="Labeldate" runat="server" Text="Date(mm/dd):" CssClass="label"></asp:Label>
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
                    <asp:Label ID="lbltime" runat="server" Text="Time:" CssClass="label"></asp:Label>
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
                            <asp:Label ID="lblphone" runat="server" Text="Phone Number:" CssClass="label"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txphone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" runat="server" ControlToValidate="txphone" CssClass="error" Display="Dynamic" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSports" runat="server" Text="Sports:" CssClass="label"></asp:Label>
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
                                    <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" CssClass="submit"/>
                              <%--  </ContentTemplate>
                            </asp:UpdatePanel>--%>
                        </td>
                        <td>
                            <asp:Button ID="btnclose" runat="server" OnClick="btnclose_Click" Text="Close" CssClass="closebutton"/>
                        </td>
                    </tr>
                </caption>
            </table>
    </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtenderplayers" TargetControlID="choosebutton" CancelControlID="btnclose" PopupControlID="popup" runat="server"></ajaxToolkit:ModalPopupExtender>
    </form>
</html>