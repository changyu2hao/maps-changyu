

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
            <link href="App_Themes/SiteStyles.css" rel="stylesheet" />
            <style>
            /* Set the size of the div element that contains the map */
            #map {
                height: 400px;  /* The height is 400 pixels */
                width: 100%;  /* The width is the width of the web page */
                 }
            </style>
            <h1>Please choose a place in the map</h1> <%--Give a title for this website--%>
            <br />
            <table>
                <tr>
                    <td>
                    <input id="Hiddenlat" type="hidden" runat="server" /> <%--put the latitude here--%>
                    </td>
                    <td>
                    <input id="Hiddenlng" type="hidden" runat="server" /><%--put the longtitude here--%>
                    </td>
                    <td>
                    <input id="lblLat" type="hidden" runat="server" /><%--put the latitude here from database--%>
                    <input id="lbllng" type="hidden" runat="server" /><%--put the longititude here from database--%>
                    <input id="inpPlayers" type="hidden" runat="server" /><%--put the number for players here from database--%>
                    <input id="inpDate" type="hidden" runat="server" /><%--put the Date here from database--%>
                    <input id="inpTime" type="hidden" runat="server" /><%--put the Time here from database--%>
                    <input id="inpphone" type="hidden" runat="server" /><%--put the Phone number here from database--%>
                    <input id="inptype" type="hidden" runat="server" /><%--put the sports here from database--%>
                        <%--Put the data from database to these hidden box, and pass it to the map--%>
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
                    var strlat = document.getElementById("lblLat").value;
                    var strlng = document.getElementById("lbllng").value;
                    var strplayers = document.getElementById("inpPlayers").value;
                    var strdate = document.getElementById("inpDate").value;
                    var strtime = document.getElementById("inpTime").value;
                    var strphone = document.getElementById("inpphone").value;
                    var strtype = document.getElementById("inptype").value;
                    //Put the value from the hidden input boxes to the variables
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
                    //Convert these string to array, in order to put them in the for loop
                    var marker1array = new Array();
                                                   
                    for (i = 0; i < latarray.length; i++) {

                        if (Number(latarray[i]) != 0 && Number(lngarray[i]) != 0) {
                            var location = { lat: Number(latarray[i]), lng: Number(lngarray[i]) };
                            var marker = new google.maps.Marker({
                            position: location,
                            map: map,
                            });
                            //retrieve the longitudes and latitudes from the array and put all of them on the map 
                            marker1array.push(marker);                            

                            var infowindow = new google.maps.InfoWindow({
                                content: "Players Number: " + playersarray[i] + "<br>" + "Date: " + datearray[i] + "<br>" + "Time: " + timearray[i]+"<br>" + "Phone Number: " + phonearray[i]+"<br>" + "Sports Type: " + typearray[i] 
                            });       
                            infowindow.open(map, marker); 
                            //retrieve all the information from the array and put them in the infowindow 
                            //haha
                        }                        
                    }
                    //This for loop output all the information to the google map
                            
                    var marker1 = null;
                    var markerarray = new Array();
                    google.maps.event.addListener(map, 'click', function (e) {
                        var myLatLng = { lat: e.latLng.lat(), lng: e.latLng.lng() };
                        
                        marker1 = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        });                    
                        //When the user click the map, a marker will show up
                        markerarray.push(marker1);                        

                        if (markerarray.length > 1) {
                            markerarray[0].setMap(null);
                            markerarray.splice(0,1);
                        }
                        //make there is only one marker existing when the user click on the map

                        document.getElementById("Hiddenlat").value = e.latLng.lat();//get the latitude from asp.net
                        document.getElementById("Hiddenlng").value = e.latLng.lng();//get the longtitude from asp.net
                        //infowindow.open(map, marker);                        
                    });                         
                }

                google.maps.event.addDomListener(window, 'load', initialize);
                //initialize the map
            </script>
            <!--Load the API from the specified URL
            * The async attribute allows the browser to render the page while the API loads
            * The key parameter will contain your own API key (which is not needed for this tutorial)
            * The callback parameter executes the initMap() function
            -->
            <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuV-FcM5NgxbpEdoLvpQF58HN9aH82-gI&libraries=places&callback=initMap"><%--Use the API from Google Cloud to get the map--%>
            </script>
        </asp:Panel>
        <br />
        <br />
        <asp:button ID="choosebutton" runat="server" text="choose" OnClick="choosebutton_Click" CssClass="button" style="margin-left:47%"/>
        <br />
        <br />
        <br />
        <footer style="background-color:darkgray">

            <div class="text-center py-2">© Changyu Huang &nbsp
            <a href="mailto: huan0212@algonquinlive.com"> Send me email</a>
            </div>

        </footer>
        <asp:Panel id="popup" runat="server" CssClass="popup1">
            <table>                
                <tr>
                    <td>
                    <asp:Label ID="lblplayers" runat="server" Text="Number of Players:" CssClass="label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txplayers" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorplayers" runat="server" ControlToValidate="txplayers" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidatorplayers" runat="server" CssClass="error" ControlToValidate="txplayers" ErrorMessage="Should be larger than 0 and less than 30" MaximumValue="30" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        <br />
                    </td>
                </tr>
                
                 <tr>
                    <td>
                    <asp:Label ID="Labeldate" runat="server" Text="Date(mm/dd):" CssClass="label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatordate" runat="server" ControlToValidate="txtdate" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortime" runat="server" ControlToValidate="txtime" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" runat="server" ControlToValidate="txphone" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSports" runat="server" Text="Sports:" CssClass="label"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txSports" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorsports" runat="server" ControlToValidate="txSports" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" CssClass="submit"/>
                                    
                        </td>
                        <td>
                            <asp:Button ID="btnclose" runat="server" OnClick="btnclose_Click" Text="Close" CssClass="closebutton"/>
                        </td>
                    </tr>
                </caption>
            </table>
    </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtenderplayers" TargetControlID="choosebutton" CancelControlID="btnclose" PopupControlID="popup" runat="server"></ajaxToolkit:ModalPopupExtender><%--When user click the "Choose" button, the pop up window will show up--%>
    </form>
</html>