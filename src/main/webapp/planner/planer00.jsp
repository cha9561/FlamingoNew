<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>플래너 - 스투비플래너</title>
<meta http-equiv="Content-Language" content="ko">
 <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="image_src" href="http://www.stubbyplanner.com/img_v9/stubby_intro2.png" />
<meta property="og:title" content="플래너 - 스투비플래너" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.stubbyplanner.com/plan/planner_step1.asp" />
<meta property="og:image" content="http://www.stubbyplanner.com/img_v9/stubby_intro2.png" />
<meta property="og:site_name" content="스투비플래너" />
<meta property="og:description" content="10만개의 실제여행자들 데이터가 담긴 지도위에서 루트를 그리면 여행준비 끝, 스투비플래너" />
<meta property="fb:app_id" content="259912364023378"/>


<meta name="viewport" content="width=800,initial-scale=0.4,minimum-scale=0.4,maximum-scale=0.4">

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">

<style>
body
{
	 overflow:hidden;
}
.trsinfo
{
	text-align:left;
	font-size:9pt;
	font-face:돋움;
	background:#fafbfc;
}
.cityinfo
{
	border-top:1px solid #797878;
	border-bottom:1px solid #797878;
	width:260px;
	display: inline-block;
	background:#eae9e9;
	padding-top:10px;
	padding-left:10px;
	
	padding-bottom:5px;
	height:45px;
	text-align:left;
	background-repeat:no-repeat;
	background-position:left center; 
}
.cityblock
{
	padding-top:0px;
	padding-left:0px;
	padding-right:0px;
	padding-bottom:0px;
	text-align:center;
	cursor:pointer;
}
a img
{
	border:0px;
}
a
{text-decoration:none;}
.menu_region a
{
	font-size:11pt;
	font-family:돋움;
	color:#ffffff;
	text-decoration:underline;	
}
.ui-autocomplete { position: absolute; cursor: default;z-index:9999 !important;}
.spotbox
{
	display:none;
	overflow-y:hidden;
	height:45px;
}

.stubby_s_black
{
	font-size:9pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#3b3b37;
}
.stubby_s_red
{
	font-size:9pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ee5a3e;
}
.stubby_s_white
{
	font-size:9pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ffffff;
}
.stubby_s_grey
{
	font-size:9pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#a1a1a1;
}
.stubby_m_black
{
	font-size:11pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#3b3b37;
}
.stubby_m_red
{
	font-size:11pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ee5a3e;
}
.stubby_m_white
{
	font-size:11pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ffffff;
}
.stubby_m_grey
{
	font-size:11pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#a1a1a1;
}
.stubby_l_black
{
	font-size:15pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#3b3b37;
}
.stubby_l_red
{
	font-size:15pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ee5a3e;
}
.stubby_l_white
{
	font-size:15pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ffffff;
}
.stubby_l_grey
{
	font-size:15pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#a1a1a1;
}
.stubby_h_black
{
	font-size:18pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#3b3b37;
}
.stubby_h_red
{
	font-size:18pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ee5a3e;
}
.stubby_h_white
{
	font-size:18pt;
	font-family:'NanumGothic';
	font-weight:bold;
	color:#ffffff;
}
.shadow
{
	border-radius: 1px 1px 1px 1px;
	-moz-border-radius: 1px 1px 1px 1px;
	-webkit-border-radius: 1px 1px 1px 1px;
	box-shadow: 2px 2px 2px #FFFFCC inset;
	-moz-box-shadow: 2px 2px 2px #FFFFCC inset;
	-webkit-box-shadow: 2px 2px 2px #FFFFCC inset;
}
#highlight_container img
{
	margin-left:5px;
	box-shadow: 0px 1px 5px 1px rgba(0,0,0,0.3);
}
#myhighlight_container img
{
	margin-left:5px;
	box-shadow: 0px 1px 5px 1px rgba(0,0,0,0.3);
}
ul {
    padding: 0;
    list-style-type: none;
}
a,td,div,span,b,i,p{
	font-family:'NanumGothic';
}
</style>
<script type="text/javascript"> 





var stockholm = new google.maps.LatLng(45, 10);

  var marker;
  var map;
  var allMarkers = [];
  var myMarkers=[];
  var recommMarkers=[];
  var prv_infowindow;

function resized()
{
	newMapHeight=eval($(window).height())-81;
	newRouteHeight=eval($(window).height())-225;
	newHighlightHeight=eval($(window).height())-230;

	$("#map_container").css("height",newMapHeight+4);
	$("#map_canvas").css("height",newMapHeight);
	$("#highlight").css("height",newHighlightHeight);
	$("#btn_map_toggle").css("top",(newMapHeight+2)*-1);

	var is_chrome = window.chrome;
	var bias=137;
	if(!is_chrome)
		var bias=138;

//	$("#city_list").css("top",(newMapHeight+bias)*-1);
//	$("#city_list").css("height",newMapHeight);
//	$("#if_citylist").css("height",newMapHeight);
	$("#cityroute").css("height",newMapHeight-153);
}
var isfirst=true;
function initialize() {
	
	resized();


	var mapOptions = {
	      zoom: 4,
	      mapTypeId: google.maps.MapTypeId.ROADMAP,
	      center: stockholm,
	      streetViewControl: false,
	  mapTypeControl: true,
	  mapTypeControlOptions: {
	        position: google.maps.ControlPosition.RIGHT_TOP
	    },
	      panControl: true,
	  panControlOptions: {
	        position: google.maps.ControlPosition.RIGHT_TOP
	    },
	      zoomControl: true,
	    zoomControlOptions: {
	        style: google.maps.ZoomControlStyle.SMALL,
	        position: google.maps.ControlPosition.RIGHT_TOP
	    },
	      scaleControl: true
	};
 
 	map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
	google.maps.event.addListener(map, 'tilesloaded', function() {
		
		SWlongitude=map.getBounds().getSouthWest().lng();
		SWlatitude=map.getBounds().getSouthWest().lat();
		NElongitude=map.getBounds().getNorthEast().lng();
		NElatitude=map.getBounds().getNorthEast().lat();
		zoomLevel=map.getZoom();
		
		$.ajax({
			  url:"ajax/GetSMarkers.asp",
			  data: {
				lang:"ko",
				SMKey:SWlongitude+"|"+zoomLevel,
				SiteType:"city",
				SWlongitude:SWlongitude,
				SWlatitude:SWlatitude,
				NElongitude:NElongitude,
				NElatitude:NElatitude,
				zoomLevel:zoomLevel
			  },
			  success: function( data ) {

				var strv = data;
				if(strv!=null)
				{

					clearMarkers();

					var RcvData=decodeURIComponent(strv).replace(/\+/g, ' ');
					var MarkerA=RcvData.split("@");	

					for(i=0;i<MarkerA.length-1;i++) //0:serial,1:markerName,2:longitude,3:latitude,4:taxSerial,5:SiteLevel,6:sitetax,7:sitename_eng
					{
						var R=MarkerA[i+1].split("#");
						
						var imgurl="http://www.stubbyplanner.com/img_v8/selectcityICON_red.png";
//						var imgurl = "http://www.stubbyplanner.com/images/is/flag/"+R[0].substring(0,5)+"_s.gif";

						var title = R[1];
						var zIdx= 10/(eval(R[5])+1);
						
						var posn = new google.maps.LatLng(R[3],R[2]);
						var marker = createMarker(posn,R[0], title, imgurl,zIdx);
						marker.setMap(map);
						allMarkers.push(marker);

						if(isfirst)
						{
				
							infowindow = new google.maps.InfoWindow();
							thtml='<iframe width="350px"  scrolling="no" height="100px" frameborder="0" src="planner_step1_infowindow.asp?lastcity=&lang=ko&s='+R[0]+'"></iframe>';
							infowindow.setContent(thtml);
							infowindow.open(map,marker);
							prv_infowindow=infowindow;

							showIntro();

							isfirst=false;
						}



					}

		  		}
			}
		});
	  });

	//document.getElementById("if_citylist").src="planner_step1_citylist.asp?lang=ko&srcserial=11";

	

var styles=[{"stylers":[{"hue":"#00ffe6"},{"saturation":-20}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"lightness":-10},{"saturation":-50}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"lightness":70}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"lightness":60}]},{"featureType":"poi.business","stylers":[{"visibility":"off"}]},{"featureType":"poi.school","stylers":[{"visibility":"off"}]},{"featureType":"poi.place_of_worship","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"visibility":"simplified"},{"lightness":100}]},{"featureType":"transit","stylers":[{"visibility":"off"}]}];


map.setOptions({styles: styles});


	var mapControllerLeftTop=document.getElementById("mapControllerLeftTop");
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(mapControllerLeftTop);

	var mapControllerCenterTop=document.getElementById("mapControllerCenterTop");
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(mapControllerCenterTop);



	var mapControllerBottom=document.getElementById("mapbottom_container");
	map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(mapControllerBottom);




//	var mapControllerRight=document.getElementById("highlight_container");
//	map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(mapControllerRight);

//	var mapControllerBottom=document.getElementById("myhighlight_container");
//	map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(mapControllerBottom);

  }

function addSpot(cityserial,cityname,spotname,spotserial,lat,lng,imgurl) 
{
	
	xxx=cityserial;
	tcity=cities[xxx];
	if(!tcity)
		addCity(cityname,cityserial,lat,lng);
	tcity=cities[xxx];
	cities[xxx].spots[tcity.spots.length]=new Spot(spotname,spotserial,lat,lng,imgurl);

	$(".cityblock").each(function(idx) {
		if($(this).find(".cityserial").val()==xxx)
		{
			$(this).find(".spotbox").append("<div style='height:40px;overflow:hidden;margin-right:2px;float:left;position:relative;'><a href='javascript:openGuideBook(\""+spotserial+"\",\""+spotname+"\")' title='"+spotname+"'><img   src='"+imgurl+"' width='45px'/></a></div>");
			$(this).find(".spotbox").show();
		}
	});

}
function clearMarkers()
{
	
	for(i=0;i<allMarkers.length;i++)
		allMarkers[i].setMap(null);
	allMarkers=[];

}
function clearMyMarkers()
{
	for(i=0;i<myMarkers.length;i++)
		myMarkers[i].setMap(null);
	myMarkers=[];
}


function createMarkerWithoutSize(posn,se, title, imgurl,sitelevel) {

  var image = {
    url: imgurl
  };

	  var markerOptions = {
	    position: posn,
	    title: "그 다음에 많이 가는 도시: "+title,
	    icon: image,
	    zIndex:sitelevel
	  };

	  var marker = new google.maps.Marker(markerOptions);
	  google.maps.event.addListener(marker, 'dblclick', function() {
		addCity(title,se,posn.lat(),posn.lng());
	  });

	  google.maps.event.addListener(marker, 'click', function() {
		if(prv_infowindow)
			prv_infowindow.close();

		infowindow = new google.maps.InfoWindow();
		thtml='<iframe width="350px"  scrolling="no" height="130px" frameborder="0" src="planner_step1_infowindow.asp?recomm=1&lastcity='+lastcity.serial+'&lang=ko&s='+se+'"></iframe>';
		infowindow.setContent(thtml);
		infowindow.open(map,marker);

		prv_infowindow=infowindow;
		getCityPhotos(se);
		google.maps.event.addListener(infowindow,'closeclick',function(){
			getHighlights('');
		});
	  });
  	return marker;
}

 function createMarker(posn,se, title, imgurl,sitelevel) {

  var image = {
    url: imgurl
  };

  var shape = {
      coord: [1, 1, 1, 20, 18, 20, 18 , 1],
      type: 'poly'
  };


	  var markerOptions = {
	    position: posn,
	    title: title,

	    icon: image,

	    zIndex:sitelevel
	  };

	  var marker = new google.maps.Marker(markerOptions);
	  google.maps.event.addListener(marker, 'dblclick', function() {
		addCity(title,se,posn.lat(),posn.lng());
	  });

	  google.maps.event.addListener(marker, 'click', function() {
		if(prv_infowindow)
			prv_infowindow.close();

		infowindow = new google.maps.InfoWindow();
		thtml='<iframe scrolling="no" width="330px" height="100px"  frameborder="0" src="planner_step1_infowindow.asp?lang=ko&s='+se+'"></iframe>';
		infowindow.setContent(thtml);
		infowindow.open(map,marker);

		prv_infowindow=infowindow;



		getCityPhotos(se);

		google.maps.event.addListener(infowindow,'closeclick',function(){
			getHighlights('');
		});


	  });
  	return marker;
}
function getCityPhotos(se)
{

	$("#highlight_container").hide();
	$("#highlight_container").html('');

	$.ajax({
		  url: "/api/planning/getRoutePhotos.asp",
		 dataType: 'json',

		  data: {
		    lang:"ko",
		    cities:se
		  },
		  success: function( data ) {
			if(data!="")
			{
				thtml='';
				
				$.each(data.photos, function( i, item ) {
					var thumb=item.photo.replace(".jpg","_m.jpg").replace(".JPG","_m.JPG").replace(".gif","_m.gif").replace(".GIF","_m.GIF").replace(".JPEG","_m.JPEG").replace(".jpeg","_m.jpeg");
					thtml=thtml+'<a href="'+item.photo+'" title="'+item.title+'" data-gallery><img width="100px"  height="75px" src="'+thumb+'" alt="'+item.title+'"></a>';
				});

				$("#myhighlight_container").hide();

				$("#highlight_container").css("height","75px");
				$("#highlight_container").html(thtml);
				$("#highlight_container").show('slow');
			}
			else
			{


			}
			
	  	}
	});
}
function getHighlights(cityserials)
{

	if(!cityserials)
	{
		txt_citylist="";
		for(i=0;i<citylist.length;i++)
		{
			txt_citylist=txt_citylist+","+citylist[i];
		}
		if(txt_citylist!="")
			txt_citylist=txt_citylist.substring(1);
		cityserials=txt_citylist;
	}


	$("#myhighlight_container").hide();
	$("#myhighlight_container").html('');
	thedate=$("#thedate").val();
	$.ajax({
		  url: "/api/planning/getsimilarplanners.asp",
		 dataType: 'json',

		  data: {
		    thedate:thedate,
		    lang:"ko",
		    cityserials:cityserials
		  },
		  success: function( data ) {
			if(data!="")
			{

				thtml='<div style="margin-bottom:3px;">';

				thtml=thtml+'<div style="float:left;margin-left:4px;background:#333333;color:#ffffff;padding-top:4px;width:150px;height:25px;text-align:center;font-family:돋움"><span class="glyphicon glyphicon-star"></span><b>'+data.city+' BEST </b><span class="glyphicon glyphicon-star"></span></div><div style="float:left;width:473px;">&nbsp;</div>';
//				if(data.cnt>0)
				{
					thedate=$("#thedate").val();
					var xx = new Date(thedate);
					thedate_month=xx.getMonth()+1;
					thedate_day=xx.getDate();

					thtml=thtml+'<div style="float:left;background:#333333;color:#ffffff;padding-top:4px;width:200px;height:25px;text-align:center;margin-left:7px;font-family:돋움"><b>'+thedate_month+'월'+thedate_day+'일 @ '+data.city+' </b></div>';
				}

				thtml=thtml+'<div style="clear:both"></div></div>';

//				if(data.cnt>0)
//				{
//					thtml=thtml+'<div style="float:left;width:230px;height:85px;overflow:hidden;position:relative;margin-left:4px;margin-bottom:10px;padding:3 3 3 3;">';
//					$.each(data.planners, function( i, item ) {
//						var thumb=item.imgurl;
//						if(i<6)
//							thtml=thtml+'<div style="width:50px;height:70px;overflow:hidden;margin-right:2px;margin-bottom:5px;float:left"><div><a href="/plan/profile.asp?from=tf&id='+item.id+'" target="_blank"><img src="'+thumb+'" width="50px" height="50px"/></a></div><div style="background:#a1a1a1;padding-top:2px;padding-bottom:2px;text-align:center"><a href="#"><font style="font-family:tahoma;color:#fff">'+item.id+'</font></a></div></div>';
//					});
//					thtml=thtml+'</div>';
//				}

				thtml=thtml+'<div style="float:left;width:630px;height:95px;overflow:hidden;position:relative;margin-left:0px;margin-bottom:0px;padding:0;">';
					$.each(data.places, function( i, item ) {
						if(i<7)
						{
							var thumb=item.photo.replace(".jpg","_m.jpg").replace(".JPG","_m.JPG").replace(".gif","_m.gif").replace(".GIF","_m.GIF").replace(".JPEG","_m.JPEG").replace(".jpeg","_m.jpeg");
							thtml=thtml+'<div style="float:left;width:100px;height:85px;overflow:hidden;position:relative;margin-left:4px;border:1px solid #c0c0c0;"><a href="javascript:openGuideBook(\''+item.serial+'\',\''+data.city+'\')" title="'+item.reason+'(by '+item.by+')"><img width="100px"  height="75px" src="'+thumb+'" alt="'+item.title+'" style="margin-left:0px;margin-right:0px;"></a><div style="position:relative;top:-20px;background:#a1a1a1;width:100px;padding-top:1px;padding-bottom:2px;color:#fff;text-align:center">'+item.title+'</div></div>';
						}
					});
					thtml=thtml+'<div style="float:left;width:100px;height:95px;overflow:hidden;position:relative;margin-left:4px;"><div><a href="javascript:openGuideBookExt(\''+data.cityserial+'\',\''+data.city+'\',\'map\')" title="'+data.city+'시내지도"><img width="100px"  height="75px" src="/img_v9/citymap.png" alt="'+data.city+'지도" style="margin-right:0px;"></a></div><div style="position:relative;top:-20px;background:#a1a1a1;width:100px;padding-top:2px;padding-bottom:2px;color:#fff;text-align:center">시내지도</div></div>';

//					thtml=thtml+'<div style="float:left;width:100px;height:85px;overflow:hidden;position:relative;margin-left:4px;"><a href="javascript:openGuideBookExt(\''+data.cityserial+'\',\''+data.city+'\',\'site_slp\')" title="'+data.city+'숙소예약 로그"><img width="100px"  height="75px" src="/img_v9/trend_slp.png"  style="margin-right:0px;"></a></div>';
//					thtml=thtml+'<div style="float:left;width:100px;height:85px;overflow:hidden;position:relative;margin-left:4px;"><a href="javascript:openGuideBookExt(\''+data.cityserial+'\',\''+data.city+'\',\'course\')" title="'+data.city+'투어예약 로그"><img width="100px"  height="75px" src="/img_v9/trend_tor.png" style="margin-right:0px;"></a></div>';


				thtml=thtml+'</div>';

				if(data.evtserial!='')
					thtml=thtml+'<div style="float:left;width:100px;height:85px;overflow:hidden;position:relative;margin-left:4px;"><div style="padding-top:7px;height:75px;"><a href="javascript:showEvent(\''+data.city+'\',\''+data.cityserial+'\',\''+thedate+'\',\''+data.evtserial+'\');" title="'+data.city+'축제"><img width="100px"  height="75px" src="'+data.evtimg+'" style="margin-right:0px;"></a></div><div style="position:relative;top:-20px;background:#a1a1a1;width:100px;padding-top:2px;padding-bottom:2px;color:#fff;text-align:center;font-family:돋움">'+data.evtname+'</div></div>';


				thtml=thtml+'<div style="float:left;width:75px;height:85px;overflow:hidden;position:relative;margin-left:4px;border:1px solid #c0c0c0"><div style="background:#fff;padding-top:17px;width:100%;height:75px;text-align:center" id="hotdealhotel">HOT DEAL</div><div style="position:relative;top:-22px;background:#ee5a3e;width:75px;padding-top:2px;padding-bottom:2px;color:#fff;text-align:center;font-family:NanumGothic"><span class="glyphicon glyphicon-bell"></span> 특가호텔</div></div>';
				thtml=thtml+'<div style="float:left;width:75px;height:85px;overflow:hidden;position:relative;margin-left:4px;border:1px solid #c0c0c0"><div style="background:#fff;padding-top:7px;width:100%;height:75px;"><a href="javascript:showWthr(\''+data.city+'\',\''+data.cityserial+'\',\''+thedate+'\')" title="'+data.city+'예상기온"><h4 style="text-align:center;color:#333">'+data.temp+'°C</h4></a></div><div style="position:relative;top:-22px;background:#a1a1a1;width:75px;padding-top:2px;padding-bottom:2px;color:#fff;text-align:center;font-family:돋움"><span class="glyphicon glyphicon-stats"></span> 예상기온</div></div>';
				if(data.cnt>0)
					thtml=thtml+'<div style="float:left;width:75px;height:85px;overflow:hidden;position:relative;margin-left:4px;border:1px solid #c0c0c0"><div style="background:#fff;padding-top:7px;width:100%;height:75px;"><a href="javascript:showTripFriends(\''+data.city+'\',\''+data.cityserial+'\',\''+thedate+'\')" title="'+data.city+'동행추천"><h4 style="text-align:center;color:#333">'+data.cnt+'명+</h4></a></div><div style="position:relative;top:-22px;background:#a1a1a1;width:75px;padding-top:2px;padding-bottom:2px;color:#fff;text-align:center;font-family:돋움"><span class="glyphicon glyphicon-user"></span> 동행추천</div></div>';

				thtml=thtml+'<div style="clear:both"></div>';

				$("#highlight_container").hide();
				$("#highlight_container").css("height","0px");

				$("#myhighlight_container").html(thtml);
				$("#myhighlight_container").show('slow');



				getBookingDeals(thedate,1,data.cityserial);

			}
			else
			{


			}
			
	  	}
	});
}
function getBookingDeals(thedate,nights,cityserial)
{

				var xx = new Date(thedate);
				var thedate_out=new Date();
				thedate_out.setDate(xx.getDate()+nights);
				var thedate_out_str = getFormattedDate(thedate_out);
               			$.ajax({
					url: 'http://tripgene.com/api/bookingdeals.php?checkin='+thedate+'&checkout='+ thedate_out_str+'&lang=ko&cityserial='+cityserial,
					dataType: 'jsonp',
					success: function(data){
						if(data!="")
						{
							dataArr=data.split(",");
							var cnt=dataArr[0];
							var turl=dataArr[1].replace("flash_deals=1","pr=0,210000");

							if(cnt>0&&cnt<1000)
								$("#hotdealhotel").html(" <a href=\""+turl+"\" target=\"_blank\" style=\"font-weight:bold;color:#fe3608;font-size:12pt;font-family:NanumGothic\" title=\" 특별 할인 중인 "+cnt+"개 호텔\">"+cnt+" 개+</a>");
							else
								$("#hotdealhotel").html(" <a href=\""+turl+"\" target=\"_blank\" style=\"font-weight:bold;color:#fe3608;font-size:9pt;font-family:NanumGothic\" title=\" 특별 할인 호텔\">Hot Deals</a>");
						}
				      }
				 });
}
  function getNextCities(lastcity)
  {

		txt_citylist="";
		for(i=0;i<citylist.length;i++)
		{
			txt_citylist=txt_citylist+","+citylist[i];
		}
		if(txt_citylist!="")
			txt_citylist=txt_citylist.substring(1);
		$.ajax({
			  url:"ajax/recommnext.asp",
			  data: {
				lang:"ko",
				lastcity:lastcity,
				citylist:txt_citylist
			  },
			  success: function( data ) {

				var strv = data;
				if(strv!=null)
				{

					clearNextMarkers();

					var RcvData=decodeURIComponent(strv).replace(/\+/g, ' ');
					var MarkerA=RcvData.split("@");

					for(i=0;i<MarkerA.length-1;i++) //0:serial,1:markerName,2:name_eng, 3:longitude,4:latitude,5:trstypetxt,6:trsdesc
					{
						var R=MarkerA[i+1].split("#");
						
						var imgurl = "http://www.stubbyplanner.com/img_v8/marker_recommend.png";

						var title = R[1]+"("+R[6]+" by "+ R[5]+")";
						var zIdx= 9999;
						var posn = new google.maps.LatLng(R[4],R[3]);
						var marker = createMarkerWithoutSize(posn,R[0], title, imgurl,zIdx);
						marker.setMap(map);
						recommMarkers.push(marker);
					}

		  		}
			}
		});
  }
  function clearNextMarkers()
  {
	for(i=0;i<recommMarkers.length;i++)
	{
		recommMarkers[i].setMap(null);
	}
  }
  function toggleBounce() {
 
    if (marker.getAnimation() != null) {
      marker.setAnimation(null);
    } else {
      marker.setAnimation(google.maps.Animation.BOUNCE);
    }
  }

  $(function() {
    $( "#cityroute" ).sortable({
      items: ".cityblock",
       start: function(event, ui) {
                var start_pos = ui.item.index();
                ui.item.data('start_pos', start_pos);
	
       },
      update : function(event, ui) {
                var start_pos = ui.item.data('start_pos');
                var index = ui.item.index();

	if(start_pos!=index)
	{
		sidx=start_pos;
		eidx=index;
		if(sidx<eidx)
		{
		//	eidx--;
		}
			
		moveCity(sidx,eidx);
	}
	else
	{
		
	}
      },
      sort: function() {
        // gets added unintentionally by droppable interacting with sortable
        // using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
        //$( this ).removeClass( "ui-state-default" );
      }
    });
  });

function selCity(t)
{
	var is_chrome = window.chrome;
	var bias=137;
	if(!is_chrome)
		var bias=138;


	$("#city_list").css("top",(newMapHeight+bias)*-1);
	$("#city_list").css("height",newMapHeight);
	$("#if_citylist").css("height",newMapHeight);


	if(t=="map")
	{
		$("#toggleforlist").hide();
		$("#toggleformap").show();
		$("#city_list").hide();
	}
	else
	{
		$("#city_list").show();
		$("#toggleformap").hide();
		$("#toggleforlist").show();
		getRoute('11','');
	}

}

function getRoute(rg,term)
{
$("#div_route").html("<br><br><br><img src=\"/img_v6/ico_loading_s.png\">"); 

$.getJSON("ajax/GetBestRoutes.asp?o=1", 
  { 
    r: rg, 
    t: term, 
    format: "json" 
  }, 
  function(data) { 
    nhtml="";
    $.each(data.routes, function(i,item){
	nhtml+="<div style=\"float:left;background-color:#ffffff;margin-bottom:5px;width:234px;margin-right:6px;overflow-x:hidden\"><table width=\"100%\">";
	nhtml+="<tr><td><a href=\"javascript:setcities('"+item.cities+"');\"><img src=\""+item.map+"\" width=\"230px\" height=\"130px\"></a></td></tr>";
	nhtml+="<tr><td><font style=\"font-size:8pt\">"+item.cities_html+"</font></td></tr>";
	nhtml+="<tr><td><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tr><td>"+item.ctries+"</td>";
	nhtml+="<td align=\"right\" width=\"80px\"><a href=\"/new/explore.asp?cityserials="+escape(item.cities)+"\" target=\"_blank\"><font style=\"font-size:8pt;\" face=\"arial\">Popularity:"+item.cnt+"</font></a></td></tr></table></td></tr>";
	nhtml+="<tr><td align=\"center\" height=\"27px\"><a href=\"javascript:setcities('"+item.cities+"');\"><img src=\"/en/img/btn_select.png\"></a></td></tr>";
	nhtml+="</table></div>";


//	$("<img/>").attr("src", item.map).attr("style", "margin:2 1 2 5").appendTo("#div_route"); 
//	$("<span/>").html(item.ctries).appendTo("#div_route"); 
	if ( i ==10 ) return false; 
    }); 
    $("#div_route").html(nhtml); 
  });
}

function setcities(serials)
{
	window.location="/plan/planner_step1.asp?cityserials="+serials;
}
  </script>

   

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>



<script src="http://www.google.com/jsapi"></script>
<script>
google.load( "webfont", "1" );
 google.setOnLoadCallback(function() {
  WebFont.load({ custom: {
   families: [ "NanumGothic" ],
	urls: ['http://fonts.googleapis.com/earlyaccess/nanumgothic.css']
  }});
});
</script>

<link rel="stylesheet" href="/css/blueimp-gallery.min.css">

</head>
<body  topmargin="0" onload="initialize()" onresize="resized()">








<script>

prv_menuregion="11";
function showCityList(srcserial)
{
	$("#menu"+prv_menuregion).removeClass("menuselected");
	$("#menu"+srcserial).addClass("menuselected");

	prv_menuregion=srcserial;
	document.getElementById("if_citylist").src="planner_step1_citylist.asp?lang=ko&srcserial="+srcserial;
}

</script>
<script>
	function openAddCity()
	{
		
		document.getElementById("if_addcity").src="/plan/addcity.asp";
		$( "#dialog-addcity" ).modal();

	
	}
	function closeAddCity()
	{
		$( "#dialog-addcity" ).dialog( "destroy" );
	}
	function onselectchanged(latlng)
	{
		latlng=latlng.split(",");
		var lat=latlng[0];
		var lng=latlng[1];
		moveTo(lat,lng);
		closeIntro();
	}
</script>
<div id="mapControllerCenterTop" style="position:absolute;top;height:50px;margin-left:155px;padding-top:10px;margin-top:10px;width:460px;">
		<div class="input-group">
		  <span class="input-group-addon">도시검색</span>
		  <input type="text" id="autoc" class="form-control" placeholder="도시이름을 입력하세요." style="width:300px;height:35px;font-size:14px;">
		</div>
</div>

<div id="mapControllerLeftTop" style="position:absolute;top;height:50px;margin-left:5px;padding-top:10px;margin-top:10px;width:290px;">
	
	<div id="themaBtn" style="margin-left:30px">

	
		<div class="btn-group">
		
		  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
		    추천 루트  <span class="caret"></span>
		    <span class="sr-only">Toggle Dropdown</span>
		  </button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="javascript:openSearchRoute()" style="color:red;font-weight:bold">IN/OUT도시로 루트 검색</a></li>
		    <li><a href="javascript:selRoute('0')">유럽30일</a></li>
		    <li><a href="javascript:selRoute('1');">유럽21일</a></li>
		    <li><a href="javascript:selRoute('2');">유럽15일</a></li>
		    <li><a href="javascript:selRoute('3');">유럽7일</a></li>
		    <li><a href="javascript:selRoute('4');">동유럽</a></li>
		    <li><a href="javascript:selRoute('5');">북유럽</a></li>
		 <li class="divider"></li>
		    <li><a href="javascript:selRoute('6')">프랑스 </a></li>
		    <li><a href="javascript:selRoute('7');">이탈리아</a></li>
		    <li><a href="javascript:selRoute('8');">영국</a></li>
		    <li><a href="javascript:selRoute('9');">스페인</a></li>
		    <li><a href="javascript:selRoute('10');">터키</a></li>
		    <li><a href="javascript:selRoute('11');">독일</a></li>
		    <li><a href="javascript:selRoute('12');">스위스</a></li>
		    <li><a href="javascript:selRoute('13');">크로아티아</a></li>
		    <li><a href="javascript:selRoute('14');">그리스</a></li>
		    <li><a href="javascript:selRoute('15');">포르투갈</a></li>

		  </ul>
		</div>

		<div class="btn-group">
		
		  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
		    유럽테마 <span class="caret"></span>
		    <span class="sr-only">Toggle Dropdown</span>
		  </button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="javascript:selThema('5');">잊지못할 유럽의 디저트! <span class="label label-info">NEW</span></a></li>
		    <li><a href="javascript:selThema('0')">건축/디자인 여행명소</a></li>
		    <li><a href="javascript:selThema('1');">꼭 봐야할 미술작품들</a></li>
		    <li><a href="javascript:selThema('2');">힐링되는 예쁜마을</a></li>
		    <li><a href="javascript:selThema('3');">모두 마셔봐야할 유럽맥주</a></li>
		    <li><a href="javascript:selThema('4');">유럽의 축제 베스트 10! </a></li>
		    <li><a href="javascript:alert('준비중입니다.');">유럽에서 놓치지 말아야할 쇼핑아이템! <span class="label label-default">준비중</span></a></li>
		  </ul>
		</div>
	</div>
	<div id="themaList"></div>
<script>
thema=[];
thema["0"]=[];
thema["1"]=[];
thema["2"]=[];
thema["3"]=[];
thema["4"]=[];
thema["5"]=[];
themaTitle=[];
bestroute=[];
bestroute["0"]=[];
bestroute["1"]=[];
bestroute["2"]=[];
bestroute["3"]=[];
bestroute["4"]=[];
bestroute["5"]=[];
bestroute["6"]=[];
bestroute["7"]=[];
bestroute["8"]=[];
bestroute["9"]=[];
bestroute["10"]=[];
bestroute["11"]=[];
bestroute["12"]=[];
bestroute["13"]=[];
bestroute["14"]=[];
bestroute["15"]=[];

themaTitle["0"]="건축/디자인 여행명소";
themaTitle["1"]="꼭 봐야할 미술작품들";
themaTitle["2"]="힐링되는 예쁜마을";
themaTitle["3"]="모두 마셔봐야할 유럽맥주";
themaTitle["4"]="유럽의 축제 베스트 10";
themaTitle["5"]="잊지못할 유럽의 디저트";

bestrouteTitle=[];
bestrouteTitle["0"]="유럽30일";
bestrouteTitle["1"]="유럽21일";
bestrouteTitle["2"]="유럽15일";
bestrouteTitle["3"]="유럽7일";
bestrouteTitle["4"]="동유럽";
bestrouteTitle["5"]="북유럽";
bestrouteTitle["6"]="프랑스";
bestrouteTitle["7"]="이탈리아";
bestrouteTitle["8"]="영국";
bestrouteTitle["9"]="스페인";
bestrouteTitle["10"]="터키";
bestrouteTitle["11"]="독일";
bestrouteTitle["12"]="스위스";
bestrouteTitle["13"]="크로아티아";
bestrouteTitle["14"]="그리스";
bestrouteTitle["15"]="포르투갈";

themaItem = function(cityserial,lat,lng,imgurl,imgowner,title,desc,curator) {
        this.cityserial = cityserial;
        this.lat = lat;
        this.lng = lng;
        this.imgurl=imgurl;
        this.title=title;
        this.imgowner=imgowner;
        this.desc=desc;
        this.curator=curator;
}
RouteItem = function(title,cityserials,mapurl,deschtml) {
        this.title=title;
        this.cityserials = cityserials;
        this.mapurl=mapurl;
        this.deschtml=deschtml;
}

bestroute["0"][0]=new RouteItem('클래식 루트','111031001,111011004,111021002,111021001,111021005,111061005,131011001,131011003,131041002,131041032,131041001,131021001,111041006,111041003,111041004,111041011,111041005,111041002,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|48.861,2.342|46.686,7.856|47.046,8.308|47.369,8.538|48.14,11.579|50.088,14.424|48.811,14.315|47.8,13.044|47.557,13.648|48.209,16.373|47.498,19.041|45.434,12.339|43.769,11.257|41.895,12.482|40.852,14.269|40.749,14.501|40.626,14.376|41.895,12.482&markers=51.5,-0.126,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  파리-  인터라켄-  루체른-  취리히-  뮌헨-  프라하-  체스키 크루믈로프-  잘츠부르크-  할슈타트-  비엔나(빈)-  부다페스트-  베니스-  피렌체-  로마-  나폴리-  폼페이-  소렌토-  로마');
bestroute["0"][1]=new RouteItem('뜨고 있는 루트','111011004,111021002,111021001,111021005,111061005,131011001,131041002,131041032,131041001,131061008,131061009,131061001,111041015,111041011,111041005,111041002,111041004,111041003,111041006,111041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|46.686,7.856|47.046,8.308|47.369,8.538|48.14,11.579|50.088,14.424|47.8,13.044|47.557,13.648|48.209,16.373|45.799,15.97|44.898,15.596|42.643,18.106|41.124,16.866|40.852,14.269|40.749,14.501|40.626,14.376|41.895,12.482|43.769,11.257|45.434,12.339|45.464,9.188&markers=48.861,2.342,reds|45.464,9.188,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  인터라켄-  루체른-  취리히-  뮌헨-  프라하-  잘츠부르크-  할슈타트-  비엔나(빈)-  자그레브-  플리트비체-  두브로브니크-  바리-  나폴리-  폼페이-  소렌토-  로마-  피렌체-  베니스-  밀라노');
bestroute["0"][2]=new RouteItem('모험적인 루트','121041001,121041003,121041030,121041001,121031001,121031002,121031001,111041004,111041003,111041006,111021002,111021005,121011002,121011003,111011004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.03,28.994|37.935,34.07|37.916,29.115|41.03,28.994|37.979,23.717|36.408,25.439|37.979,23.717|41.895,12.482|43.769,11.257|45.434,12.339|46.686,7.856|47.369,8.538|41.388,2.17|40.417,-3.702|48.861,2.342&markers=41.03,28.994,reds|48.861,2.342,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','이스탄불-  카파도키아-  파묵칼레-  이스탄불-  아테네-  산토리니 섬-  아테네-  로마-  피렌체-  베니스-  인터라켄-  취리히-  바르셀로나-  마드리드-  파리');

bestroute["1"][0]=new RouteItem('클래식 루트','111031001,111011004,111061005,131011001,131041001,111041006,111041003,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|48.861,2.342|48.14,11.579|50.088,14.424|48.209,16.373|45.434,12.339|43.769,11.257|41.895,12.482&markers=51.5,-0.126,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  파리-  뮌헨-  프라하-  비엔나(빈)-  베니스-  피렌체-  로마');
bestroute["1"][1]=new RouteItem('뜨고 있는 루트','111011004,121011003,121011007,121011005,121011001,121011002,111041006,111041003,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|40.417,-3.702|37.39,-5.997|36.721,-4.421|37.176,-3.598|41.388,2.17|45.434,12.339|43.769,11.257|41.895,12.482&markers=48.861,2.342,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  마드리드-  세비야-  말라가-  그라나다-  바르셀로나-  베니스-  피렌체-  로마');
bestroute["1"][2]=new RouteItem('모험적인 루트','121011002,111041006,111041003,111041004,131061001,131061009,131061008,131041001,131011001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.388,2.17|45.434,12.339|43.769,11.257|41.895,12.482|42.643,18.106|44.898,15.596|45.799,15.97|48.209,16.373|50.088,14.424&markers=41.388,2.17,reds|50.088,14.424,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA',' 바르셀로나-  베니스-  피렌체-  로마-  두브로브니크-  플리트비체-  자그레브-  비엔나(빈)-  프라하');

bestroute["2"][0]=new RouteItem('클래식 루트','111031001,111011004,111021002,111041006,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|48.861,2.342|46.686,7.856|45.434,12.339|41.895,12.482&markers=51.5,-0.126,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  파리-  인터라켄-  베니스-  로마');
bestroute["2"][1]=new RouteItem('뜨고 있는 루트','111011004,111031001,121011002,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|51.5,-0.126|41.388,2.17|41.895,12.482&markers=48.861,2.342,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  런던-  바르셀로나-  로마');
bestroute["2"][2]=new RouteItem('모험적인 루트','121041001,121041003,121041030,121041031,121041001,121031001,121031002,121031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.03,28.994|37.935,34.07|37.916,29.115|37.928,27.371|41.03,28.994|37.979,23.717|36.408,25.439|37.979,23.717&markers=41.03,28.994,reds|37.979,23.717,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','이스탄불-  카파도키아-  파묵칼레-  셀축-  이스탄불-  아테네-  산토리니 섬-  아테네');

bestroute["3"][0]=new RouteItem('클래식 루트','111031001,111011004,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|48.861,2.342|41.895,12.482&markers=51.5,-0.126,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  파리-  로마');
bestroute["3"][1]=new RouteItem('뜨고 있는 루트','111011004,121011002','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|41.388,2.17&markers=48.861,2.342,reds|41.388,2.17,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  바르셀로나');
bestroute["3"][2]=new RouteItem('모험적인 루트','121011002,121011003','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.388,2.17|40.417,-3.702&markers=41.388,2.17,reds|40.417,-3.702,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','바르셀로나-  마드리드');

bestroute["4"][0]=new RouteItem('붉은 노을, 체코','131011001,131011003,131011001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|50.088,14.424|48.811,14.315|50.088,14.424&markers=50.088,14.424,reds|50.088,14.424,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','프라하-  체스키 크루믈로프-  프라하');
bestroute["4"][1]=new RouteItem('체코+할슈타트+비엔나','131011001,131011003,131041002,131041032,131041002,131041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|50.088,14.424|48.811,14.315|47.8,13.044|47.557,13.648|47.8,13.044|48.209,16.373&markers=50.088,14.424,reds|48.209,16.373,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','프라하-  체스키 크루믈로프-  잘츠부르크-  할슈타트-  잘츠부르크-  비엔나(빈)');
bestroute["4"][2]=new RouteItem('체코+할슈타트+헝가리 끝 야경','131011001,131011003,131041002,131041032,131041002,131041001,131021001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|50.088,14.424|49.28,16.565|47.8,13.044|47.557,13.648|47.8,13.044|48.209,16.373|47.498,19.041&markers=50.088,14.424,reds|47.498,19.041,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','프라하-  체스키-  잘츠부르크-  할슈타트-  잘츠부르크-  비엔나(빈)-  부다페스트');

bestroute["5"][0]=new RouteItem('피오르드(스칸디나비아반도)','141031001,141041002,141041011,141041004,141041001,141041028,141041057,141041002,141051001,141031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|55.676,12.568|59.914,10.739|58.96,5.736|59.877,5.663|60.388,5.332|60.848,7.13|62.1,7.231|59.914,10.739|59.333,18.064|55.676,12.568&markers=55.676,12.568,reds|55.676,12.568,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','코펜하겐-  오슬로-  스타방게르-  피오르드-  베르겐-  플롬-  게이랑게르-  오슬로-  스톡홀름-  코펜하겐');
bestroute["5"][1]=new RouteItem('아이슬란드(+영국)','111031001,141071003,141071002,141071001,141071004,141071005,141071003,111031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|64.123,-21.864|64.007,-22.572|65.684,-18.11|65.287,-14.434|63.419,-19.009|64.123,-21.864|51.5,-0.126&markers=51.5,-0.126,reds|51.5,-0.126,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  레이캬비크-  케플라비크-  아쿠레이리-  에길스타디르-  비크-  레이캬비크-  런던');
bestroute["5"][2]=new RouteItem('북유럽 4국 디자인 여행','141031001,141041002,141041011,141041001,141041002,141051001,141021001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|55.676,12.568|59.914,10.739|58.96,5.736|60.388,5.332|59.914,10.739|59.333,18.064|60.17,24.938&markers=55.676,12.568,reds|60.17,24.938,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','코펜하겐-  오슬로-  스타방게르-  베르겐-  오슬로-  스톡홀름-  헬싱키');

bestroute["6"][0]=new RouteItem('파리근교 <예술가의 흔적> 루트','111011004,111011008,111011120,111011126,111011004,111011143,111011004,111011144,111011004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|48.633,-1.509|48.651,-2.025|49.42,0.233|48.861,2.342|49.077,1.524|48.861,2.342|49.072,2.177|48.861,2.342&markers=48.861,2.342,reds|48.861,2.342,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  몽셍미셸-  생 말로-  옹플뢰르-  파리-  지베르니-  파리-  오베르 쉬르 우와즈-  파리');
bestroute["6"][1]=new RouteItem('황금해변, 코트다쥐르','111011004,111011003,111091001,111011014,111011004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|43.703,7.266|43.733,7.419|43.298,5.383|48.861,2.342&markers=48.861,2.342,reds|48.861,2.342,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  니스-  모나코-  마르세유-  파리');
bestroute["6"][2]=new RouteItem('보라빛 향기,프로방스 라벤더 루트','111011004,111011003,111011009,111011140,111011005,111011023,111011004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|48.861,2.342|43.703,7.266|43.699,7.122|43.73,7.362|43.949,4.806|43.211,2.354|48.861,2.342&markers=48.861,2.342,reds|48.861,2.342,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파리-  니스-  생 폴 드 방스-  에즈마을-  아비뇽-  카르카손-  파리');

bestroute["7"][0]=new RouteItem('이태리 정석루트!','111041004,111041003,111041006,111041006,111041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.895,12.482|43.769,11.257|45.434,12.339|45.434,12.339|45.464,9.188&markers=41.895,12.482,reds|45.464,9.188,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','로마-  피렌체-  베니스-  베니스-  밀라노');
bestroute["7"][1]=new RouteItem('세계 최고의 트레킹 코스, 친퀘떼레!','111041004,111041003,111041123,111041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.895,12.482|43.769,11.257|44.131,9.722|45.464,9.188&markers=41.895,12.482,reds|45.464,9.188,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','로마-  피렌체-  친꿰떼레-  밀라노');
bestroute["7"][2]=new RouteItem('환삼의 섬 카프리, 이태리 남부 해안을 달리다!','111041004,111041011,111041010,111041011,111041005,111041002,111041079,111041004','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.895,12.482|40.852,14.269|40.551,14.243|40.852,14.269|40.749,14.501|40.626,14.376|40.633,14.484|41.895,12.482&markers=41.895,12.482,reds|41.895,12.482,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','로마-  나폴리-  카프리 섬-  나폴리-  폼페이-  소렌토-  포지타노-  로마');

bestroute["8"][0]=new RouteItem('영국의 역사와 전통 + 코츠월드','111031001,111031004,111031010,111031006,111031184,111031056,111031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|51.752,-1.255|51.759,-1.829|51.381,-2.357|51.179,-1.826|51.072,-1.801|51.5,-0.126&markers=51.5,-0.126,reds|51.5,-0.126,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  옥스퍼드-  바이버리-  바스-  스톤헨지-  솔즈베리-  런던');
bestroute["8"][1]=new RouteItem('신비로운 영국.(스톤헨지+세븐시스터즈)','111031001,111031002,111031187,111031002,111031056,111031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|50.821,-0.139|50.774,0.153|50.821,-0.139|51.072,-1.801|51.5,-0.126&markers=51.5,-0.126,reds|51.5,-0.126,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  브라이튼-  세븐 시스터즈-  브라이튼-  솔즈베리-  런던');
bestroute["8"][2]=new RouteItem('스코틀랜드의 대자연을 느끼다.','111031001,111031009,111031008,111031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|51.5,-0.126|55.866,-4.257|55.95,-3.187|51.5,-0.126&markers=51.5,-0.126,reds|51.5,-0.126,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','런던-  글래스고-  에든버러-  런던');

bestroute["9"][0]=new RouteItem('가우디와 뜨거운 태양이 빛나는 안달루시아!','121011002,121011001,121011057,121011007,121011003','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.388,2.17|37.176,-3.598|36.743,-5.159|37.39,-5.997|40.417,-3.702&markers=41.388,2.17,reds|40.417,-3.702,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','바르셀로나-  그라나다-  론다-  세비야-  마드리드');
bestroute["9"][1]=new RouteItem('순례자의 길','121011002,121011027,121011002','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.388,2.17|42.88,-8.547|41.388,2.17&markers=41.388,2.17,reds|41.388,2.17,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA',' 바르셀로나-  산티아고 데 콤포스텔라-  바르셀로나');
bestroute["9"][2]=new RouteItem('환상의 섬, 이비자와 바르셀로나 근교','121011002,121011104,121011002,121011017,121011002','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.388,2.17|41.592,1.838|41.388,2.17|38.975,1.42|41.388,2.17&markers=41.388,2.17,reds|41.388,2.17,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','바르셀로나-  몬세라트-  바르셀로나-  이비사 섬-  바르셀로나');

bestroute["10"][0]=new RouteItem('터키의 신비함을 짧고 굵게..','121041001,121041003,121041030,121041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.03,28.994|37.935,34.07|37.916,29.115|41.03,28.994&markers=41.03,28.994,reds|41.03,28.994,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','이스탄불-  카파도키아-  파묵칼레-  이스탄불');
bestroute["10"][1]=new RouteItem('터키 전통마을+신비로운 터키..','121041001,121041006,121041003,121041030,121041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.03,28.994|39.929,32.853|37.935,34.07|37.916,29.115|41.03,28.994&markers=41.03,28.994,reds|41.03,28.994,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','이스탄불-  앙카라-  카파도키아-  파묵칼레-  이스탄불');
bestroute["10"][2]=new RouteItem('터키 풀코스!','121041001,121041003,121041030,121041028,121041031,121041001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|41.03,28.994|37.935,34.07|37.916,29.115|36.619,29.117|37.928,27.371|41.03,28.994&markers=41.03,28.994,reds|41.03,28.994,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','이스탄불-  카파도키아-  파묵칼레-  페티예-  셀축-  이스탄불');

bestroute["11"][0]=new RouteItem('미술관 여행','111061006,111061011,111061102,111061050,111061008,111061004,111061071,111061005,111061024,111061018,111061006','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|50.112,8.684|50.942,6.95|51.198,6.695|51.313,9.487|52.524,13.412|51.048,13.734|50.98,11.323|48.14,11.579|48.78,9.182|49.009,8.405|50.112,8.684&markers=50.112,8.684,reds|50.112,8.684,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','프랑크푸르트-  쾰른-  노이스-  카셀-  베를린-  드레스덴-  바이마르-  뮌헨-  슈투트가르트-  카를스루에-  프랑크푸르트');
bestroute["11"][1]=new RouteItem('로맨틱가도','111061006,111061007,111061002,111061005,111061003,111061005,111061006','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|50.112,8.684|49.794,9.927|49.381,10.178|48.14,11.579|47.57,10.7|48.14,11.579|50.112,8.684&markers=50.112,8.684,reds|50.112,8.684,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','프랑크푸르트-  뷔르츠부르크-  로텐부르크-  뮌헨-  퓌센-  뮌헨-  프랑크푸르트');
bestroute["11"][2]=new RouteItem('겨울에 간다면? 독일의 크리스마스마켓','111061006,111061011,111061006,111061004,111061020,111061005,111061006','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|50.112,8.684|50.942,6.95|50.112,8.684|51.048,13.734|49.452,11.071|48.14,11.579|50.112,8.684&markers=50.112,8.684,reds|50.112,8.684,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','프랑크푸르트-  쾰른-  프랑크푸르트-  드레스덴-  뉘른베르크-  뮌헨-  프랑크푸르트');

bestroute["12"][0]=new RouteItem('세계 최고경치의 철도루트, 골든패스!','111021005,111021001,111021002,111021031,111021004,111021005','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|47.369,8.538|47.046,8.308|46.686,7.856|46.432,6.913|46.02,7.745|47.369,8.538&markers=47.369,8.538,reds|47.369,8.538,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','취리히-  루체른-  인터라켄-  몽트뢰-  체르마트-  취리히');
bestroute["12"][1]=new RouteItem('알프스 만년설을 즐기는 하이킹과 스카이다이빙!','111021005,111021001,111021077,111021013,111021077,111021001,111021002,111021009,111021006,111021007,111021002,111021015,111021005','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|47.369,8.538|47.046,8.308|46.82,8.396|46.844,8.498|46.82,8.396|47.046,8.308|46.686,7.856|46.596,7.907|46.523,8.006|46.624,8.039|46.686,7.856|46.948,7.448|47.369,8.538&markers=47.369,8.538,reds|47.369,8.538,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','취리히-  루체른-  엥겔베르그-  티틀리스 산-  엥겔베르그-  루체른-  인터라켄-  라우터브루넨-  융프라우-  그린델발트-  인터라켄-  베른-  취리히');
bestroute["12"][2]=new RouteItem('초콜릿 열차 여행','111021005,111021001,111021002,111021031,111021003,111021093,111021003,111021031,111021008','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|47.369,8.538|47.046,8.308|46.686,7.856|46.432,6.913|46.583,7.08|46.603,7.099|46.583,7.08|46.432,6.913|46.204,6.14&markers=47.369,8.538,reds|46.204,6.14,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','취리히-  루체른-  인터라켄-  몽트뢰-  그뤼예르-  브록-  그뤼예르-  몽트뢰-  제네바');

bestroute["13"][0]=new RouteItem('푸른 자연의 노래와 붉은 지붕','131061008,131061009,131061002,131061011,131061001,131061008','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|45.799,15.97|44.898,15.596|43.505,16.444|43.172,16.442|42.643,18.106|45.799,15.97&markers=45.799,15.97,reds|45.799,15.97,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','자그레브-  플리트비체-  스플리트-  흐바르-  두브로브니크-  자그레브');
bestroute["13"][1]=new RouteItem('슬로베니아+크로아티아=슬로아티아','131061008,131071003,131071001,131061008,131061009,131061002,131061001,131061008','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|45.799,15.97|46.05,14.504|46.37,14.11|45.799,15.97|44.898,15.596|43.505,16.444|42.643,18.106|45.799,15.97&markers=45.799,15.97,reds|45.799,15.97,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','자그레브-  류블랴나-  블레드-  자그레브-  플리트비체-  스플리트-  두브로브니크-  자그레브');
bestroute["13"][2]=new RouteItem('끝 자연... 크로아티아+코토르','131061008,131061009,131061001,131221002,131061001,131061008','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|45.799,15.97|44.898,15.596|42.643,18.106|42.487,18.716|42.643,18.106|45.799,15.97&markers=45.799,15.97,reds|45.799,15.97,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','자그레브-  플리트비체-  두브로브니크-  코토르 지역의 자연 및 역사문화 유적지-  두브로브니크-  자그레브');

bestroute["14"][0]=new RouteItem('푸른바다, 새하얀 산토리니!','121031001,121031002,121031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|37.979,23.717|36.408,25.439|37.979,23.717&markers=37.979,23.717,reds|37.979,23.717,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','아테네-  산토리니 섬-  아테네');
bestroute["14"][1]=new RouteItem('신혼여행 추천루트','121031001,121031013,121031002,121031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|37.979,23.717|37.445,25.334|36.408,25.439|37.979,23.717&markers=37.979,23.717,reds|37.979,23.717,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','아테네-  미코노스 섬-  산토리니 섬-  아테네');
bestroute["14"][2]=new RouteItem('고대 그리스로의 시간여행','121031001,121031003,121031001,121031045,121031001,121031058,121031001,121031036,121031001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|37.979,23.717|35.218,24.894|37.979,23.717|37.732,22.753|37.979,23.717|37.659,24.015|37.979,23.717|38.473,22.492|37.979,23.717&markers=37.979,23.717,reds|37.979,23.717,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','아테네-  크레타 섬-  아테네-  미케네-  아테네-  수니온-  아테네-  델포이-  아테네');

bestroute["15"][0]=new RouteItem('리스본 + 근교도시들','121021001,121021003,121021002,121021004,121021001','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|38.707,-9.135|38.798,-9.388|38.709,-9.485|38.697,-9.421|38.707,-9.135&markers=38.707,-9.135,reds|38.707,-9.135,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','리스본-  신트라-  로카 곶-  카스카이스-  리스본');
bestroute["15"][1]=new RouteItem('포르투갈 일주','121021006,121021001,121021003,121021002,121021004,121021001,121021024,121021001,121021008','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|37.017,-7.931|38.707,-9.135|38.798,-9.388|38.709,-9.485|38.697,-9.421|38.707,-9.135|39.364,-9.15|38.707,-9.135|41.151,-8.607&markers=37.017,-7.931,reds|41.151,-8.607,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','파로-  리스본-  신트라-  로카 곶-  카스카이스-  리스본-  오비도스-  리스본-  오포르토');
bestroute["15"][2]=new RouteItem('순례자의 길+포르투갈','121021001,121021008,121011091,121011027','http://maps.google.com/staticmap?size=210x110&maptype=mobile&path=rgba:0x333333ff,weight:2|38.707,-9.135|41.151,-8.607|42.231,-8.712|42.88,-8.547&markers=38.707,-9.135,reds|42.88,-8.547,rede&key=ABQIAAAAe78iFPMjoObp_lAF7IR8zxTMiyqBRuxmY_th5OW7YNbnCMZaChT0v4TYOGw348Vd4U23bnueHxrRDA','리스본-  오포르토-  비고-  산티아고 데 콤포스텔라');


thema["0"][0]=new themaItem('111041012','43.7161240718407', '10.3965854644775','http://tripgene.com/stubby/photo/5/5/3e6532b9e441fcbaa3d715e621ee5e42.JPG','wishecho','피사의 사탑','이탈리아 피사에 있는 탑입니다. 원래는 대성당에 딸려있는 탑인데 대성당보다 탑이 훨씬 유명하죠. 그 전에는 점점 기울어서 문제였는데, 보수공사 하고 난 뒤로는 반대로 거꾸로 서서 문제가 되고 있죠.','drxamon');
thema["0"][1]=new themaItem('111041004','41.8954731928572', '12.4822282791137','http://tripgene.com/stubby/photo/1/8/18461c9855989b03da9a26ec501eff81.JPG','soung86','콜로세오','이탈리아의 수도 로마에 있는 콜로세오입니다. 우리나라에는 라틴어인 콜로세움으로 잘 알려져 있죠. 지금봐도 웅장하고 훌륭한 건축물이지만, 사실은 원래 규모의 1/3정도만 남아있다는 사실. 원형을 복원하는게 고고학계의 숙원 중 하나입니다.','drxamon');
thema["0"][2]=new themaItem('131011001','50.0876023334355', '14.4240188598633','http://tripgene.com/stubby/photo/1/4/73e3f45b7059a944bf0b938e6d6f6074.JPG','agape6967','프라하 화약탑','체코의 수도 프라하에 있는 화약탑입니다. 말 그대로 화약을 보관하는 탑인데, 실제 기능은 구시가로 통하는 출입문입니다. 15세기에 세워진 이 탑은 예전 구시가로 들어가던 13개 출입문 중에 하나입니다. 프하라 흘라브니드라지 역에서도 걸어서 얼마 안걸립니다.','drxamon');
thema["0"][3]=new themaItem('111011004','48.86110101269274', '2.3421478271484375','http://tripgene.com/stubby/photo/3/0/83cf7cbe02d239f9b7394a380632c0d4.JPG','freelena','라데팡스','라데팡스는 우리나라로 치면 은평 뉴타운 같이 파리 중심의 과밀화를 막기 위해 계획적으로 세워진 시가지입니다. 라데팡스의 상징이라고 할수 있는 그랑드 아슈르는 1989년 프랑스혁명 200주년을 기념해서 세워 졌습니다. 사실 파리에서 외곽에 있기 때문에 파리에 웬만큼 길게 체류하지 않는 이상은 많이 가는 곳은 아니듯 합니다.','drxamon');
thema["0"][4]=new themaItem('111041001','45.46356205373', '9.1878318786621','http://tripgene.com/stubby/photo/3/0/afb8aa3407459d8c9186fce5051ca345.JPG','freelena','밀라노대성당','이탈리아 밀라노에 있는 두오모입니다. 이 건물이 특이한 이유는 알프스 이남에 있는 거의 유일한 고딕양식의 건물이기 때문입니다. 게다가 규모까지 거대하죠. 이탈리아 사람들은 고딕 양식을 야만인들이나 쓰는 무식한 양식이라고 생각했기 때문에 이탈리아에서 고딕 양식의 건물을 찾아볼수가 없습니다. 이 밀라노 대성당 빼고는요. 참고로 앞에 비둘기가 엄청 많으니 비둘기 무서워 하시는 분은 마음의 준비를 좀 하고 가시기 바랍니다.','drxamon');
thema["0"][5]=new themaItem('111011004','48.86110101269274', '2.3421478271484375','http://tripgene.com/stubby/photo/1/4/4f6587558015c06b81e49a1409c432ec.JPG','agape6967','노틀담 대성당','프랑스의 수도 파리에 있는 노틀담 대성당은 파리의 시테 섬에 있는 고딕 양식의 성당입니다. 사진은 서쪽 파사드군요. 후면부를 보시면 고딕 건축양식이 뭔지 바로 아실수가 있습니다. 참고로 랭스 대성당과 중국의 광저우 대성당과 비교해 보시는것도 새로운 재미가 될 듯 합니다.','drxamon');
thema["0"][6]=new themaItem('111071008','51.924216', '4.481775999999997','http://tripgene.com/stubby/photo/3/0/ca79c0d8f8f09ff2b57dd1647f06631b.JPG','freelena','큐브하우스','네덜란드의 항구도시 로테르담에 있는 큐브하우스입니다. 재미있는건 상업 건물은 아니고 주거용도의 건물입니다. 건물에 딸린 상가도 있긴 하지만 기본적으로 주거를 목적으로 한 건물입니다. 로테르담에는 큐브 하우스 말고도 다른 현대건축물이 많이 있으므로 현대건축에 관심이 많으신 분들이라면 한번쯤 들르시는것도 좋습니다.','drxamon');
thema["0"][7]=new themaItem('121021008','41.15144500000001', '-8.607122999999996','http://tripgene.com/stubby/photo/1/4/07afd77cfdb4205b65ab6c881fc10f4e.JPG','agape6967','돔 루이스 1세 다리','포르투갈 포르투의 도우르 강을 가로지르는 돔 루이스 1세 다리입니다. 다리의 철골 구조를 잘 보세요. 무언가 떠오르는 건축물이 있을겁니다. 네 그렇습니다. 에펠탑! 에펠탑을 설계한 귀스타프 에펠의 제자 중 하나가 설계한 다리라고 합니다.','drxamon');
thema["0"][8]=new themaItem('121021001','38.7069460515939', '-9.13521766662598','http://tripgene.com/stubby/photo/1/4/1eb5323b8c5257e015672d72cff36c42.JPG','agape6967','산타 주 스타 엘리베이터','포르투갈의 수도인 리스본에 있는 산타 주 스타 리프트입니다. 이 리프트(엘리베이터)의 존재 이유는 바로 홍콩의 미드레벨 에스컬레이터와 비슷한데요. 언덕 아래인 바이샤 지구에서 언덕 위쪽인 바이루 알투 지구로 편하게 가기 위한 리프트입니다. 지대가 높아 리스본 시내를 360도 조망할 수 있어 관광객들이 주로 들리는 포인트이기도 합니다.','drxamon');
thema["0"][9]=new themaItem('111011159','47.698671535297144', '6.63299560546875','http://tripgene.com/stubby/photo/3/0/048a1868d50d0648368d3018be55e057.JPG','freelena','롱샹성당','르꼬르뷔지에의 대표적인 건축물입니다. 사실 난이도가 상인데 유럽 건축에 관심이 조금이라도 있으신분은 바로 알아보셨을듯 합니다. 참고로 이 건축물은 철골 콘크리트가 아니었으면 지을 수 없는 건물입니다. 벽과 지붕의 구조를 잘 봐주십시오. 르코르뷔지에의 철학이 그대로 녹아 있는 건물입니다.','drxamon');

thema["1"][0]=new themaItem('111011004','48.86110101269274', '2.3421478271484375','http://tripgene.com/stubby/photo/1/2/2b2e926c61d449da164f8dd90da5d364.jpg','Dystopos@flickr','다빈치,모나리자','작품명 : 레오나르도 다 빈치,모나리자 (1508년)<br>소장처 : 루브르 박물관<br><br>너무나도 유명한 레오나르도 다 빈치의 모나리자입니다. 4년동안이나 작업했음에도 불구하고 미완성으로 남아 있습니다. 실제 사이즈는 많이 작아서 잔뜩 기대하고 가시는 분들에게는 많은 실망감을 안겨 주기도 합니다. 그림 속 모델은 누구인지의견이 분분한데, 조르지오 바사리의 말에 의하면 [리자 게라르디니]라는 설이 유력합니다.','drxamon');
thema["1"][1]=new themaItem('131041001','48.2091455497485', '16.3728475570679','http://tripgene.com/stubby/photo/1/2/07cb478c2d6a3f2bc93e0af4b6d4f4b0.jpg','Jom@flickr','클림트,키스','작품명 : 구스타프 클림트,키스 (1908-1909년)<br>소장처 : 오스트리아 미술관(오스트리아 벨베데레 갤러리)<br><br>유겐트슈틸의 대표작가인 클림트는 금속 세공가인 아버지로부터 화풍에 많은 영향을 받았습니다. 클림트의 독창성은 고전주의와 금박의 장식 효과를 결합해서 나오는 것입니다. 키스가 대표적이죠. 유디트와 하기에이아도 대표적인 작품입니다. 참고로 건물에 있어서 유겐트슈틸을 맛보고 싶으신 분들은 빈 뿐만 아니라 옆의 부다페스트도 같이 들르시면 볼거리가 많습니다','drxamon');
thema["1"][2]=new themaItem('111041004','41.8954731928572', '12.4822282791137','http://tripgene.com/stubby/photo/1/2/a06fbeb247931db0fc20d0d06748e565.jpg','Dennis Jarvis@flickr','미켈란젤로,피에타','작품명 : 미켈란젤로 부오나로티, 피에타 (1498-1499년)<br>소장처 : 성 베드로 대성당(산 피에트로 성당)<br><br>대리석을 조각한 것이 아니라 대리석 안에 원래 계시던 성모 마리아와 예수님을 그대로 끄집어 낸듯한 사실성이 관람객들의 탄성을 자아내죠. 절제된 표정의 성모마리아, 축 늘어진 몸과 근육을 사실적으로 표현한 예수님. 모든 부분에 있어 흠잡을 데 없는 작품입니다.','drxamon');
thema["1"][3]=new themaItem('111071001','52.3737914039891', '4.89076137542725','http://tripgene.com/stubby/photo/1/2/4b6fbe15bdcf2701f5174e044ccc4f20.jpg','freelena','렘브란트,야간순찰','작품명 : 하르먼스 판 레인 렘브란트,야간순찰(1642년)<br>소장처 : 암스테르담 국립박물관<br><br> 이 작품의 정확한 작품명은 <프란스 반닝 코크와 빌럼 반 루이텐부르크의 민병대>입니다. 사실 이 그림은 초상화인데요. 지금 우리가 단체사진을 찍는 것 처럼 옛날에는 작가에게 돈을 주고 단체초상화를 그리는 일이 많았습니다. 의뢰인들은 지금 우리가 단체사진을 찍듯이 평범하게 오와 열을 맞춰 있는 모습을 원했으나, 렘브란트는 하나의 작품을 만들어버렸죠. 이에 반발한 의뢰인들은 렘브란트에게 약속한 돈을 전부 주지는 않았습니다. 계약위반이니 당연하죠. 사실 제목이 <야간순찰>인데, 사실은 밝은 대낮의 풍경을 그린 그림입니다. 세월의 흔적 때문에 점점 그림이 어둡게 변한 것입니다.','drxamon');
thema["1"][4]=new themaItem('111071001','52.3737914039891', '4.89076137542725','http://tripgene.com/stubby/photo/1/2/bd00909319847dc8e3789fea2b364f20.jpg','freelena','감자 먹는 사람들','작품명 : 빈센트 반 고흐, 감자 먹는 사람들(1885년)<br>소장처 : 반 고흐 미술관<br><br> <감자먹는 사람들>은 고흐의 운명을 바꿔놓은 작품으로 인상파와 교류 하기 전에 그린 가장 중요한 작품이기도 합니다. 전의 방직공을 소재로 그린 작품들과 비교해보면 큰 변화가 일어났음을 알 수 있는데요, 이 작품을 시작으로 인물이 그림의 중심으로 부각된 것입니다. 고흐의 초기 작품이라 원근법 표현에는 문제가 있으나 그 안에는 고흐의 주관적인 정서가 배어 있습니다. 당대 현실주의가 중시한 ‘냉정한 방관자’의 역할에 얽매이지 않은 것입니다','drxamon');
thema["1"][5]=new themaItem('111031001','51.5000874980771', '-0.126256942749023','http://tripgene.com/stubby/photo/1/2/8d4860b29b7e880630b7464030abac89.jpg','agape6967','고흐,해바라기','작품명 : 빈센트 반 고흐,(열네 송이) 해바라기 (1888년)<br>소장처 : 런던 내셔널 갤러리<br><br>고흐의 해바라기 연작은 힘 있는 붓 터치와 보색대비 효과 때무에 고흐의 예술적인 매력이 가장 잘 드러난 작품으로 손꼽힙니다. 명도가 높은 노란색을 사용해 매우 화려한 느낌을 줍니다. 사진 속의 작품은 해바라기 연작 중 <열네 송이 해바라기>입니다','drxamon');
thema["1"][6]=new themaItem('121011003','40.4166327886885', '-3.70290756225586','http://tripgene.com/stubby/photo/1/2/7e190db144576084a10cfe551cbe3610.jpg','freelena','피카소,게르니카','작품명 : 파블로 피카소, 게르니카 (1937년)<br/>소장처 : 레이나 소피아 국립미술관(소피아 예술 왕비센터)<br><br> [아비뇽의 처녀들]과 함께 피카소의 2대 걸작으로 꼽히는 이 작품은 스페인 내전이라는 비극적인 역사적 사건을 바탕으로 그려져 그 의미를 더합니다. 1937년 4월 46일, 스페인의 게르니카가 나치에 폭격을 당하면서 1500여 명의 민간인이 희생된 사건에 분노한 피카소는, 같은 해에 열린 파리 만국 박람회에 이 대작을 내놓습니다. 전쟁의 잔인함과 희생이 피카소의 입체주의 기법으로 생생하게 되살아나, 보는 이에게 강렬한 인상을 줍니다.','yyyli');
thema["1"][7]=new themaItem('111011004','48.86110101269274', '2.3421478271484375','http://tripgene.com/stubby/photo/1/2/47e19a7227ffc6c47c6a2a7aa25c67f4.jpg','agape6967','풀밭위의 점심식사','에두아르 마네,풀밭 위의 점심 식사 (1863년)<br>소장처 : 오르세 미술관<br><br>마네는 1850년대 당시의 화가 지망생들이 대가들의 작품을 모방하며 그림을 배우던 시절, 그를 뛰어넘어 자신만의 기법과 구도로 재해석하여 독창적인 작품을 많이 남겼습니다. 원제 ‘목욕’으로 낙선展에 전시되었을 당시에는 하루 만에 7천여명의 관람객을 모을 정도로 큰 스캔들을 일으킨 작품입니다. 일반 여성의 누드와 부르주아 남성들의 화대 문화라는 작품 주제와 인상주의 기법 등을 이유로 맹렬한 비판의 대상이 되었고, 지금과 같은 진가는 인정받지 못했습니다. 피카소가 동명으로 오마주한 작품 또한 유명하죠.','yyyli');
thema["1"][8]=new themaItem('111041003','43.7686455915888', '11.2566947937011','http://tripgene.com/stubby/photo/1/2/37e82b7a131a7119d6c4477e43b6deb6.jpg','agape6967','미켈란젤로,다비드','작품명 : 미켈란젤로 부오나로티, 다비드(1501-1504년)<br>소장처 : 피렌체 아카데미아 미술관(피렌체 갤러리아 델 아카데미)<br><br>작은 부분까지 아주 세세하게 묘사가 되어 있어, 다비드의 중요 부위(...)의 상품화가 잘 되어 있습니다. 피렌체의 기념품 가게를 가 보시면 다비드의 중요 부위(...)로 도배가 되어 있는 모습을 쉽게 볼 수 있습니다. 냉장고 자석, 엽서는 물론이고 열쇠고리, 트렁크 팬티까지 없는게 없습니다. 사실 베끼오 궁전 앞 시뇨리아 광장에 전시하기 위해 조각을 했는데요, 지금은 보호의 목적으로 원본은 아카데미아 미술관에 있고 시뇨리아 광장에 있는 것은 모조품입니다.','drxamon');
thema["1"][9]=new themaItem('111071004','52.0791895102132', '4.31436538696289','http://tripgene.com/stubby/photo/1/2/9cbea5ecd11fe8b4cb0f7621fc66a043.jpg','freelena','진주귀걸이를 한 소녀','작품명 : 요하네스 베르메르,진주 귀걸이를 한 소녀 (1666년 경)<br>소장처 : 마우리츠하이스 왕립미술관<br><br>스칼렛 요한슨 주연의 동명 영화로 더욱 주목을 받았던 작품이죠. 빛의 화가라고 불리는 베르메르 특유의 기법이 잘 살아있어, 어두운 배경 속에서 빛나는 진주 귀걸이보다 아름다운 소녀의 눈동자가 보는 이를 빠져들게 합니다. 실제로 보면 그림의 크기가 작음에도 불구하고 눈을 뗄 수 없게 만듭니다. 이 소녀는 ‘네덜란드의 모나리자’로 불릴 만큼 많은 이들에게 패러디로서 사랑받고 있으나, 안타깝게도 모델이 누구인지는 밝혀지지 않았습니다. ','yyyli');

thema["2"][0]=new themaItem('131041032','47.55654578175438', '13.64750862121582','http://tripgene.com/stubby/photo/7/3/ef96418e95845206b4c83d2088225ce3.jpg','yunmiland','할슈타트','1997년 유네스코가 세계문화유산으로 선정한 세계에서 가장 아름다운 호수이다','stubby');
thema["2"][1]=new themaItem('111031010','51.75934048406749', '-1.8298673629760742','http://tripgene.com/stubby/photo/5/5/c9c7ca91acd030ea32aaba1f67f5471e.JPG','wingmoon','바이버리','영국에서 가장 아름다운 시골마을<br>영국인들이 은퇴 후 가장 살고 싶어하는 마을로 뽑혔으며 영국 시인 윌리엄 모리스가 가장 아름다운 영국시골마을로 꼽았을 정도로 자연경관이 뛰어나고 한적한 마을이다','stubby');
thema["2"][2]=new themaItem('111011012','48.5828817207873', '7.7439022064209','http://tripgene.com/stubby/photo/2/6/dd0c83b0f7cdf9a4fb56e1a8fca3ae1e.jpg','clbjhlove','스트라스부르','꽃보다할배로 알려진 아름다운 프랑스 시골마을<br> 알퐁스 도테의 <마지막 수업>의 배경이기도 하다.','stubby');
thema["2"][3]=new themaItem('111041123','44.13097085672744', '9.721870422363281','http://tripgene.com/stubby/photo/2/0/74641c6e2e76f78cb2ccdd590a8a8ee3.JPG','drxamon','친퀘테레','세계 최고의 해안 트레킹코스<br>이태리 북부의 5개의 해안마을을 이어 만든 국립공원으로 유네스코에 등재되어 있으며 세계에서 가장 아름다운 트레킹 코스로 인정받고 있다.','stubby');
thema["2"][4]=new themaItem('111021007','46.6240949029518', '8.0390739440918','http://tripgene.com/stubby/photo/5/5/c94f2e36d8ed7ab556ade74f4e022390.JPG','wisdud','그란델발트','알프스 소녀 하이디가 뛰어 나올 것 같은 아름다운 스위스 산골마을로 융프라우와 인터라켄 사이에 위치하고 있다.','stubby');
thema["2"][5]=new themaItem('111061002','49.3805288297007', '10.1784467697143','http://tripgene.com/stubby/photo/5/0/6bcaa47e3cb47fb774b52ff23fed216e.JPG','iris3407','로텐부르크','로맨틱 가도의 하이라이트!<br>중세의 보석이라 불리는 도시로 고딕양식과 르네상스 양식의 건축물들이 많다. ','stubby');
thema["2"][6]=new themaItem('111011005','43.9485858145153', '4.80591773986816','http://tripgene.com/stubby/photo/4/7/04cc0a32cef0b6c8f666c04316ca2510.JPG','gyoojin','아비뇽','한 여름 연극축제로 유명한 중세모습이 잘 보존된 도시.<br>보랏빛 바다라 불리는 프로방스지방의 라벤더투어를 다녀올 수 있는 거점 도시이기도 함','stubby');
thema["2"][7]=new themaItem('111011143','49.07712692778414', '1.5239238739013671','http://tripgene.com/stubby/photo/6/9/c9b532222848800d2fc0de58af1e6ec7.jpg','k22401991','지베르니','빛의 화가 모네가 말년에 자신의 가족과 정착하여 지내며 자신이 직접 가꾼 정원에서 <수련>이라는 작품을 그린 마을','stubby');
thema["2"][8]=new themaItem('111061030','49.894195', '10.89489500000002','http://tripgene.com/stubby/photo/6/3/60b9f9bcb28a20c739677f754c391441.jpg','ketromos','밤베르크','천년을 흘러온 물의 도시, 밤베르크<br>작은 베네치아라고도 불리며 도시 중심가가 유네스코 문화유산으로 등록되어 있다.','stubby');
thema["2"][9]=new themaItem('111081002','51.2095182356915', '3.22517395019531','http://tripgene.com/stubby/photo/5/4/3bebe78e23234ce5d975c2a9db8d9109.JPG','ivuiepi','브뤼헤','도시전체가 세계문화유산인 동화같은 운하도시. 서유럽의 베네치아로 불리며 중세도시가 잘 보존되어 있는 곳','stubby');

thema["3"][0]=new themaItem('131011013','49.74696','13.37906000000001','http://tripgene.com/stubby/photo/1/2/cd54eaf50769707b5e53fd50bf323d03.jpg','Jay Yeary@flickr','필스너 페스트','나라 및 도시명 : 체코, 플젠<br><br> 필스너 우르켈의 고향인 플젠에서 열리는 체코 최대 규모의 세계 맥주 축제로, 옆나라 독일의 옥토버 페스트보다는 작은 규모이나 축제 기간만큼은 조용했던 시골 도시가 맥주를 사랑하는 전 세계인들의 열기로 후끈해진다 하죠. 매년 8월말에 열리며, 밤에는 축제의 하일라이트인 화려한 불꽃놀이 등 볼거리는 여느 축제 못지 않다고 합니다.','yyyli');
thema["3"][1]=new themaItem('111061005','48.1399742326904','11.579246520996','http://tripgene.com/stubby/photo/1/2/c1b0674990a6f17a943e579492c04be0.JPG','lsh891226','옥토버 페스트','나라 및 도시명 : 독일, 뮌헨<br><br>맥주 애호가라면 누구나 한번쯤 참가하길 꿈꾸는 세계 최대 규모의 맥주 축제인 옥토버페스트입니다. 독일의 전통 소세지와 함께 마시는 생맥주 맛을 잊지못해, 해마다 약 600만명 이상의 전 세계인이 테레지엔비제에 몰린다고 하니 그 인기가 어마어마합니다. 1810년부터 현재에 이르기까지 역사적 전통을 자랑하며, 세계의 맥주를 한 자리에서 맛 볼수 있을 뿐만 아니라 퍼레이드 및 축제장이 댄스장으로 돌변하는 등의 다양한 이벤트도 놓치지 마세요.','yyyli');
thema["3"][2]=new themaItem('111061030','49.894195', '10.89489500000002','http://tripgene.com/stubby/photo/1/2/b12f0be0238503c26fe7b197e11f749a.jpg','Werner Kunz@flickr','밤베르크 맥주 축제','나라 및 도시명 : 독일, 밤베르크<br><br>유네스코 세계문화유산으로 등재된 중세 건축물과 강가에서 분위기있게 맥주를 즐길 수 있어, 시끌벅적한 다른 축제와는 또 다른 낭만을 만끽할 수 있습니다. 밤베르크는 특산 맥주인 라우흐비어가 유명한데, 이는 너도밤나무로 훈연한 맥아로 제조하여 훈제맥주만의 독특한 향이 특징입니다. 독일 대표 맥주인 메르첸, 바이젠 등 7종류의 맥주와 훈연맥아를 결합한, 이 곳에서만 맛볼 수 있는 생맥주가 일품이라 합니다.','yyyli');
thema["3"][3]=new themaItem('131011013','49.74696','13.37906000000001','http://tripgene.com/stubby/photo/1/2/9415fd07237247fe17d9cde5bb507687.jpg','马瑞@flickr','필스너 우르켈 양조장','나라 및 도시명 : 체코, 플젠<br><br> 라거(Lager) 맥주의 대명사인 필스너 우르켈 회사의 양조장을 견학할 수 있습니다. 1842년 10월 5일에 필스너 우르켈이 생산되면서 기존의 탁한 맛과  짙은 색의 에일(Ale) 맥주에서, 깨끗한 황금색과 깔끔한 맛의 라거 맥주로 새로운 역사를 세웠다고 하죠. 또한 나무로 만든 술잔보다 라거 맥주의 빛깔을 돋보이게 하는 유리잔으로 마시는 문화까지 만들어 낸 라거 맥주는, 현재 전세계 맥주 생률의 약 70%나 차지한다고 합니다.','yyyli');
thema["3"][4]=new themaItem('111101001','53.3439672613647','-6.26744270324707','http://tripgene.com/stubby/photo/1/2/fbc68d4fe0afca2d4e0e0ca66c29fa56.jpg','Angelo Failla@flickr','기네스 스토어하우스','나라 및 도시명 : 아일랜드, 더블린<br><br>에일(Ale) 맥주의 대표주자인 기네스 맥주가 탄생한 세인트제임스 게이트 양조장을 2000년에 기네스 스토어하우스로서 개장되었으며, 아일랜드 제일의 관광명소로 꼽히고 있습니다. 기네스사는 세계 최고 기록들을 수록한 기네스북의 후원자라는 점으로 잘 알려져 있는데요, 그보다 설립자인 아서 기네스가 1795년에 폐허에 불과했던 이 양조장을 무려 9천년 동안 임대하기로 계약한 이력이 독특합니다. 생맥주와 함께 한 눈에 즐길 수 있는 더블린 시내의 전경은 보너스라 할 수 있죠.','yyyli');
thema["3"][5]=new themaItem('131011012','48.974171','14.47773000000001','http://tripgene.com/stubby/photo/1/2/31d8dbb59189b78f1247a79926eb4a86.jpg','Debarshi Ray@flickr','부데요비체 부드바르 맥주제조장','나라 및 도시명 : 체코, 체스케 부데요비체<br><br>전세계 18개국으로 수출되는 오리지널 버드와이저(Budweiser)를 맛 볼수 있는 BB 맥주제조장입니다. 옛 보헤미아 왕국 시대부터 체스케 부데요비체 지방의 특산품인 부드바이저는 19세기에 미국인에 의해 바다를 건너가 우리에게 잘 알려진 버드와이저가 됩니다. 그 후 체코과 미국 회사간의 상표 분쟁으로 더욱 유명해졌는데요, 100건이 넘는 소송 끝에 현재는 원조인 체코가 승소하여 향후 50년간은 미국이 체코로부터 원재료를 공급받게 되었습니다.','yyyli');
thema["3"][6]=new themaItem('111071001','52.3737914039891','4.89076137542725','http://tripgene.com/stubby/photo/1/2/1dbc86e5d35e203bfba4cb2be707deab.jpg','Arjan Richter@flickr','하이네켄 맥주 공장','나라 및 도시명 : 네덜란드, 암스테르담<br><br>하이네켄의 역사는 1864년 헤르하트 에이드리안 하이네켄이 암스테르담의 오래된 양조장을 사들이면서 시작됐습니다. 당시에는 지식인과 예술가가 가볍게 즐길 수 있는 술이라는 슬로건으로 인기있는 맥주로 꼽혔다고 하는데요. 독일의 라거 맥주와 같은 ‘하면 발효 방식’으로 시작하였으나 미생물학자에 의해 ‘하이네켄 A-이스트’가 개발되면서 현재의 우리가 마시는 맛으로 발전되었습니다. 이 곳에서 하이네켄 맥주병에 나만의 메세지를 넣어 특별한 맥주를 만들어 보세요!','yyyli');
thema["3"][7]=new themaItem('111061005','48.1399742326904','11.579246520996','http://tripgene.com/stubby/photo/1/2/e8f04cd34bc9578dd2e05aef9f3533ff.jpg','Ingo Meironke','안덱스 수도원 양조장','나라 및 도시명 : 독일, 뮌헨<br><br>안덱스 수도원은 에탈 수도원과 함께 중세시대부터 전쟁과 개혁 속에서도 살아남은 독일의 수도원 직영 양조장 중 한 곳입니다. 수도원 양조장이 생소할 수도 있지만, 맥주 맛은 그 역사만큼이나 염격한 품질관리 하에 세계 최고 수준의 맛을 자랑하며, 해마다 1천만리터의 맥주가 생산된다고 하니, 소박한 수도원 이미지와는 달라보입니다. 수도원 또한 유럽인들의 성지 순례지 중 하나로 손꼽히며, 암머 호수가 언덕 위에 자리잡은 로코코 양식의 성당에서 보이는 헤르싱 마을 전경도 아름답습니다.','yyyli');
thema["3"][8]=new themaItem('111061005','48.1399742326904','11.579246520996','http://tripgene.com/stubby/photo/1/2/12156790c66a872921ada2fb0387024a.jpg','Axel Drainville@flickr','호프브로이 하우스','나라 및 도시명 : 독일, 뮌헨<br><br>1589년 바이에른 왕실의 빌헬름 5세에 의해 설립되어, 현재까지도 독일인 누구에게나 사랑받는 맥주 홀로 명맥을 이어가고 있습니다. 독일 노동자 집회를 위해 히틀러도 방문한 이 곳에서 하루에만 1만 리터 이상의 판매가 판매된다고 하니 그 인기가 짐작됩니다.  이 곳이 가장 특별한 점 하나! 1층에서 독일 전통 맥주를 즐긴 뒤 2층 무도회장에서 바이에른 전통 폴카춤도 즐길 수 있다고 하니 유럽 스타일의 음주가무 문화를 체험해보는 건 어떨까요?','yyyli');
thema["3"][9]=new themaItem('141031001','55.6761325172031', '12.5677585601807','http://tripgene.com/stubby/photo/1/2/41961def23dad29a59f69c5042826274.jpg','blue_quartz@flickr','칼스버그 방문자 센터','나라 및 도시명 : 덴마크, 코펜하겐<br><br>칼스버그 맥주는 스웨덴 왕실 지정의 영예를 얻을 만큼 부드러운 거품과 그 만의 독특한 맛으로 150여년간 150여개국에서 사랑받고 있죠. 칼스버그 방문자 센터는 본래 19세기 건축물의 외양 그대로를 간직한 칼스버그사의 맥주 제조 공장 1호점으로, 해마다 약 15만명의 세계인들이 즐겨찾는 관광 명소로 자리잡았습니다. 전세계의 1만 8천여 종류의 맥주병들을 한 자리에서 볼 수 있으며, 창업주인 야콥센의 아들이 수집한 예술품들도 구경하실 수 있습니다.','yyyli');

thema["4"][0]=new themaItem('121011092','39.41825100493039', '-0.7907688617706299','http://tripgene.com/stubby/photo/1/2/58cf9edc725bb08be0530d1b2995ea92.jpg','Diariocritico de Venezuela@flickr','스페인 토마토 축제','축제 기간 : 2015.8.26 (매년 개최)<br>나라 및 도시명 : 스페인, 부뇰<br><br> 한국에서 가보고 싶은 해외 축제 3위에 빛나는 ‘라 토마티나’는 푸에블로 광장 중앙의 기름이 발린 기둥 꼭대기에 매달린 햄을 따는 것으로 시작되어, 폭죽이 터지고 참가자들의 ‘토마토’란 함성과 함께 토마토를 실은 트럭이 등장하면서 본격적인 토마토 전쟁이 시작됩니다. 단 2시간 동안만 허락되는 이 전쟁에 필요한 무기는 버릴 수 있는 옷과 물안경/고글이면 충분합니다. 지중해의 강렬한 여름, 태양빛 아래에서 토마토로 더위와 함께 스트레스도 날리고, 마음에 붉은 열기를 더하는 건 어떨까요? ','yyyli');
thema["4"][1]=new themaItem('111011003','43.7034053264315', '7.26616859436035','http://tripgene.com/stubby/photo/1/2/cfb777e4234072a1f3497f28806e9fa3.jpg','Deb Collins@flickr','니스 카니발','축제 기간 : 2015.2.13 - 3.1 (매년 개최)<br>나라 및 도시명 : 프랑스, 니스<br><br>세계 3대 카니발로 손꼽히는 니스 카니발은 꽃과 카니발, 그리고 빛이라는 3개 테마의 퍼레이드로 유명하죠! 꽃 퍼레이드에는 화려한 꽃마차의 등장과 함께 10톤 이상의 꽃이 뿌려지며, 이어지는 카니발 퍼레이드에는 각국의 민속무용단과 악사들의 춤의 행진이 관광객들의 눈을 사로잡습니다. 마지막 빛 퍼레이드에는 15만개 이상의 전구가 장식된 거리에서 인형들과 극단들이 공연으로 흥을 돋굽니다. 축제의 마지막 날엔 모든 참가자가 거리로 나와 퍼레이드를 펼치는 <그랑 파라드>가 열리며, 밤엔 카니발 왕의 인형을 바닷가에서 태우며 불꽃놀이로 화려하게 막을 내린다고 하니 놓치지 마세요! ','akeha03');
thema["4"][2]=new themaItem('111011079','43.77681499999999', '7.500275999999988','http://tripgene.com/stubby/photo/1/2/56b7be1df7f079d6e2ee9846b7def254.jpg','Paul Downey@flickr','망통 레몬 축제','축제 기간 : 2015.2.14 - 3.4 (매년 개최)<br>나라 및 도시명 : 프랑스, 망통<br><br>프랑스 남부 지중해 연안 끝자락에 위치한 망통은 작고 조용한 휴양도시이나, 매년 2월부터 3월 초에는 마을 전체가 레몬 조형물로 뒤덮히며 관광객들로 들썩합니다. 1934년부터 시작된 망통의 전통 축제는 예부터 예술가뿐만 아니라 동화나 만화, 민화작가들에게 영감을 불어넣어 왔다고 합니다. 그로 인해 만화나 동화의 주인공이 축제의 주된 소재가 되어, 아이들이 상상하던 동화속 세상이 현실로 나타난다는 점이 가장 큰 매력이라고 할 수 있죠. 어릴 때 읽고 상상했던 동화 속 모습이 궁금하다면 지금 당장 망통으로!','stubby');
thema["4"][3]=new themaItem('111041129','45.466601993256255', '7.87594199180603','http://tripgene.com/stubby/photo/1/2/8b8303d2f7a1451dd03363eef07e33f6.jpg','Edoardo Forneris@flickr','오렌지 전투 축제','축제 기간 : 2015.2.14 - 17 (매년 개최)<br>나라 및 도시명 : 이탈리아, 이브레아<br><br>스페인에 토마토 축제가 있다면, 이탈리아에는 오렌지 축제가 있죠! 이브레아 오렌지 축제는 중세시대부터 이어져 내려온 유서깊은 전통 축제로, 초야권을 행사한 성주를 향해 시민들이 돌을 던진 사건에서 유래되었습니다. 이 오렌지 전투에 필요한 무기는 영주의 머리를 상징하는 오렌지 하나면 되는데요, 헬멧을 쓴 귀족팀이 마차를 타고 광장에 등장하면, 기다리고 있던 유니폼을 입은 평민팀과 귀족팀이 서로를 향해 오렌지를 던지며 당시의 시민봉기를 재현합니다. 약 360톤의 오렌지가 눈 앞에서 날아다니는 모습은 상상만해도 스릴이 넘칩니다','yyyli');
thema["4"][4]=new themaItem('111041006','45.4344485919156', '12.338547706604','http://tripgene.com/stubby/photo/1/2/96d8f659b71fa3153517bca1b0da1a4f.jpg','US Army Africa@flickr','베니스 카니발','축제 기간 : 2015.1.31 - 2.17 (매년 개최)<br>나라 및 도시명 : 이탈리아, 베니스<br><br>사순절의 시작을 알리는 ‘재의 수요일(Ash Wednesday)’의 전 10일 동안 열리는 베니스 카니발은 이탈리아의 대표적인 가면 축제로 잘 알려져 있는데요. 화려한 가면과 복장으로 꾸미고 베니스를 방문하는 참가자과 어울려, 16세기에 6개월 간 성대하게 치러졌던 축제의 화려함을 체험할 수 있습니다. 특히, 밤낮을 가리지 않고 이어지는 축제의 대미를 장식하는 ‘재의 콘서트’도 놓칠 수 없는 포인트죠. 카니발 기간에는 모든 금기와 차별에서 해방되는 관습처럼, 마스크를 쓰면 누구나 꿈꾸던 사람이 될 수 있다는 건 매력적입니다.','stubby');
thema["4"][5]=new themaItem('111041006','45.4344485919156', '12.338547706604','http://tripgene.com/stubby/photo/1/2/65b3cb545336a6356927f92d8d6b8492.jpg','Jean-Pierre Dalbéra@flickr','베니스 비엔날레','축제 기간 : 2015.5.9 – 11.22 (2년에 1번 개최)<br>나라 및 도시명 : 이탈리아, 베니스<br><br>베니스 비엔날레는 홀수해에만 열리는 종합 국제 미술전 비엔날레인데요, 세계 3대 비엔날레로 손꼽힐만큼 세계 규모의 축제입니다. 1895년 이탈리아 국왕의 결혼기념일을 축하하기 위하여 시작된 미술 전시회로서, 세계의 미술계에 미치는 영향력도 무시할 수 없을만큼 높이 평가받고 있습니다.기다리고 기다리던 베니스 비엔날레가 2015년에 열려, 올해에 기회를 놓친 여행자들에게 벌써부터 주목받고 있답니다!','yyyli');
thema["4"][6]=new themaItem('111031001','51.5000874980771', '-0.126256942749023','http://tripgene.com/stubby/photo/1/2/cb9f011e63d8daea3117ff0ac4453c1d.jpg','Angel Ganev@flickr','노팅힐 카니발','축제 기간 : 2015.8.30 – 31 (매년 개최)<br>나라 및 도시명 : 영국, 런던<br><br>유럽 최고 인기의, 최대 규모의 거리 축제로 불리는 노팅힐 카니발은1964년에 영화로도 잘 알려진 런던의 노팅힐 지역에 거주하던 카리브해 출신의 이민자들의 가두행진으로부터 시작되었다는 독특한 유래를 가졌습니다. 카니발은 시작일의 한 달 전부터 흑인들의 전통 춤과 음악, 의상 등으로 분위기가 고조될 뿐만 아니라 현대 예술까지 한데 어울려, 매년 100만명 이상의 전세계인들이 참가하는 다문화축제로 영화보다 높은 인기를 얻고 있습니다.','yyyli');
thema["4"][7]=new themaItem('111031008','55.9502090488548', '-3.18779468536377','http://tripgene.com/stubby/photo/1/2/9c48767fa13a303472cf91f1b2a59255.jpg','Ewan Mclntosh@flickr','에든버러 국제 페스티벌','축제 기간 : 2015.8.7 – 31 (매년 개최)<br>나라 및 도시명 : 영국, 에든버러<br><br>내용 : 매년 8월이 되면 에든버러에서는 미술, 재즈, 책, 영화, 각종 공연, 등불행렬 등 매일 5백개 이상의 크고 작은 공연들이 동시 다발적으로 펼쳐지는데요, 이 다양한 장르의 축제들을 위해 전세계의 유명 예술가들이 스코틀랜드의 옛 수도인 에든버러에 모입니다. 유럽뿐만 아니라 세계에서 손꼽히는 에든버러 국제 페스티벌은 여행자들이 가장 놓쳐서는 안 될 축제임이 확실합니다!','akeha03');
thema["4"][8]=new themaItem('111021005','47.3691175247919', '8.53817939758301','http://tripgene.com/stubby/photo/1/2/d33e6788f50b679399ad09fd22082358.jpg','nils.rohwer@flickr','취리 패쉬트','축제 기간 : 2016.7.3 (3년에 1번 개최)<br>나라 및 도시명 : 스위스, 취리히<br><br><세상 모든 축제 중의 축제>로 불리며 유럽인들에게 사랑받는 취리 패쉬트는 3년에 한 번만 만날 수 있어, 그 인기가 더욱 높습니다. 지상에선 취리히 도심을 가로지르는 리마트 강과 뷔클리 광장을 중심으로 각종 무대와 다양한 먹거리, 상공에선 다이빙쇼와 에어쇼, 그리고 밤 10시부터 라디오 음악과 함께 펼쳐지는 유럽 5대 불꽃놀이까지! 1951년부터 현재까지 60년 이상의 역사만큼이나 매 회마다 늘고있는 관광객들에게 검증된 취리히의 향연, 2016년에는 놓치지 마세요!','yyyli');
thema["4"][9]=new themaItem('131041023','47.50392999999998', '9.748570999999995','http://tripgene.com/stubby/photo/1/2/736c1042a6e8f595dc9cdd33d39d49b2.jpg','Will Spaetzel@flickr','브레겐츠 페스티벌','축제 기간 : 2015.7.22 - 8.23 (매년 개최)<br>나라 및 도시명 : 오스트리아, 브레겐츠<br><br>내용 : 오페라 공연을 위한 축제인 브레겐츠 베스티벌은 독일, 스위스, 오스트리아, 이 세 나라의 접경지역인 브레겐츠의 콘스탄스 호수 위에 떠있는 야외무대에서 펼쳐집니다. 오페라를 기발하게 해석한 무대디자인과 압도적인 세계유일의 수상무대는 매년 화제를 낳고 있죠! 오페라를 좋아하는 사람들뿐만 아니라 미술, 건축, 음악에 관심있는 사람들에게 <죽기 전에 꼭 가봐야 할 축제>로서 꼽히며, 티켓 구하기가 하늘에 별따기라는 사실!','yyyli');


thema["5"][0]=new themaItem('111011004','48.86110101269274', '2.3421478271484375','http://tripgene.com/stubby/photo/1/2/8a06311ddd78f0aa057c9be77f702653.png','Josiah Lau Photography@flickr','파리 마카롱','파는 곳 : 파리 라뒤레, 피에르에르메<br>가격 :  개당 1.90 유로 정도<br>프랑스하면 떠오르는 고급 디저트 중 하나인 마카롱. 대표 마카롱 맛집은 전통 강자인 ‘라뒤레’와 신흥강자인 피에르에르메로 나뉩니다. 매장은 시내 곳곳에 있으니 찾기 쉬운 편입니다. 대부분의 여행자가 선택하는 맛은 로즈, 초콜렛, 바닐라 등이지만 다양한 맛이 있으니 기호에 따라 선택하면 될 듯합니다.','stubby');
thema["5"][1]=new themaItem('121011002','41.3878531743444', '2.17001438140869','http://tripgene.com/stubby/photo/1/2/861dd7b98a2064ac32c4d149af603a5a.JPG','yyyli','스페인 츄러스','파는 곳: 바르셀로나 츄레리아<br>가격 : 1.2유로에 5개 (츄레리아 기준)<br>바르셀로나에는 먹거리가 참 많지만, 그 중에서도 한국 여행객들이 바르셀로나에 여행가면 꼭 들르는 곳 중 하나인 대표 맛집 츄레리아. 1968년부터 운영되어 온 역사를 자랑합니다. 한국어에 능숙한 종업원이 주문을 도와주므로 스페인어 못한다고 걱정할 필요는 없습니다. 영업시간은 월~금 07:00~ 13:00, 15:30~20:15 / 토 : 07:00~14:00, 15:30~20:30 / 일: 07:00 ~ 14:30, 16:00~ 20: 30 이다. 시에스타라고 불리는 중간 break time을 꼭 가지기 때문에 이 점을 염두하세요.','stubby');
thema["5"][2]=new themaItem('111041004','41.8954731928572', '12.4822282791137','http://tripgene.com/stubby/photo/1/2/c8f58c25e29f69a3d0fa2abd14fb2e79.JPG','bjy7574','로마 젤라또','파는 곳: 로마 파씨, 올드브릿지, 지올리띠<br>가격 : 2.5 유로에서 3유로 정도<br>최초로 젤라또가 만들어진 곳은 16세기 이탈리아입니다. 1595년에 피렌체에서 열린 연회의 기록에 메디치 대공의 궁정에서 환상적인 소르베티와 젤라또를 먹었다는 회고가 남아있죠. 이탈리아의 젤라또 장인들이 해외로 이주하면서 그들의 레시피가 유럽을 넘어 전세계로 빠르게 퍼져나갔다는 기록이 있습니다. 그 후로 로마의 휴일에서 오드리 헵번이 스페인 계단에서 젤라또를 먹는 모습이 영상에 담기게 되면서 <이탈리아- 젤라또> 의 수식어가 공식화 되었습니다. 이탈리아 젤라또 3대 맛집은 파씨, 올드브릿지, 지올리띠로 꼽힙니다.','stubby');
thema["5"][3]=new themaItem('111041004','41.8954731928572', '12.4822282791137','http://tripgene.com/stubby/photo/1/2/74211f319774ff80f755ecd1f29c4f70.JPG','bjy7574','로마 티라미슈','파는 곳:  로마, 폼피<br>가격 : 4 유로<br>로마에서 티라미슈를 먹고ㅠ싶다면 폼피를 찾으세요. 폼피는 트레비분수 가까이에 위치합니다. 특이하게 네모나게 각진 케이스에 티라미슈를 넣어줘서 숟가락으로 퍼먹을 수 있게 되어있습니다. 폼피 티라미슈는 오직 테이크아웃만 가능하니, 스페인 광장에서 풍경을 바라보며 먹는 것도 꽤 낭만적입니다. 월요일은 휴무이고, 카드결제가 안되니 현금을 지참하세요. 하나의 팁을 알려드리자면, 폼피 티라미슈의 화장실은 무료입니다.','stubby');
thema["5"][4]=new themaItem('111031001','51.5000874980771', '-0.126256942749023','http://tripgene.com/stubby/photo/1/2/a1af056e89e9b28c84f53802b660d295.GIF','Robin Zebrowski','런던 애프터눈티','파는 곳: 런던 포트넘메이슨, 오린저리 티룸 등<br>가격 : 24파운드에서 60파운드 등 가격이 천차만별<br>런던에는 해리포터와 뮤지컬 외에도 유명한 것이 한가지 더 있어요. 바로 홍차와 디저트의 나라 영국입니다. 느긋하고 여유로운 영국사람들은 하루에 많게는 7~8회 반드시 차를 마시는데 특히, 늦은 오후에 하던 일을 멈추고 삼십 분간의 티타임(tea time)을 갖는 습관이 있답니다. 진정한 런더너가 되고 싶다면 따뜻한 햇살 아래 맛있는 쿠키와 티 한잔의 여유를 가져보는 것도 좋지 않을까요? ','stubby');
thema["5"][5]=new themaItem('131011001','50.0876023334355', '14.4240188598633','http://tripgene.com/stubby/photo/1/2/f3e23899805b13757dc67ede6374a25e.GIF','Liz Jones@flickr','프라하 뜨르들로','파는 곳: 프라하 까를교 근처 KRUSTA<br>가격 : 50~60 코루나<br/>체코의 전통 간식인 뜨르들로. 뜨르들로는 긴 막대기에 반죽을 꽈배기마냥 배배 꼬아서 돌려가며 천천히 굽는 체코의 전통 빵입니다. 기호에 따라 설탕, 초코, 견과류 등 다양한 토핑을 묻혀줍니다. 뜨르들로 가게는 프라하 곳곳에서 쉽게 만날 수 있습니다.','stubby');
thema["5"][6]=new themaItem('131021001','47.4983579195743', '19.0407657623291','http://tripgene.com/stubby/photo/1/2/95567fdff2268b188d426ecdb9ec6928.GIF','Alper Çuğun@flickr','헝가리 랑고스','파는 곳: 부다페스트 북쪽 센텐드레 마을(화가의 마을) 광장 한 가운데 좁다란 골목길로 올라가면 유명한 랑고 집이 있다 <br>가격 : 우리나라 돈으로 약 2천원<br/>헝가리의 국민 간식 랑고스 입니다. 헝가리 사람들은 빵을 많이 먹는데, 랑고스는 한국으로 따지면 호떡과 비슷한 음식입니다. 튀긴 도넛을 얇게 핀 것 같은 빵 위에 이것저것 토핑을 올려먹을 수 있습니다. 저렴한 가격 대비 많은 양으로 배고픈 여행자들에게는 최고의 간식입니다.','stubby');
thema["5"][7]=new themaItem('111041035','45.07699999999998', '7.679779000000013','http://tripgene.com/stubby/photo/1/2/b5bee3982960f9b4467eaff4b5bcb736.GIF','Matt_Weibo@flickr','이태리 판나코타','파는 곳:  토리노, 카페 토리노<br>가격 : 10유로 전후<br>이탈리아의 전통 푸딩 판나코타 입니다. 판노코타는 생크림과 설탕을 은근히 끓여 바닐라로 향을 낸 후 마지막에 젤라틴을 넣어 차갑게 굳힌 이탈리아식 스위트 푸딩입니다. ‘판나’는 이탈리아어로 ‘크림’을, ‘코타’는 ‘익힌’이란 뜻을 가지고 있어요. 판나코타는 세계적으로 유명한 요리이지만 그 유래에 대해서는 알려진 바가 거의 없다는 것이 특징 중 하나입니다. 부드럽고 달콤한 맛이 일품으로, 여러 토핑을 곁들어 함께 드실 수 있습니다. 판나코타는 여러 레스토랑에서 후식으로도 맛볼 수 있지만 100년 전통을 가진 카페 토리노를 추천드립니다.','stubby');
thema["5"][8]=new themaItem('111081001','50.8466245793837', '4.3511438369751','http://tripgene.com/stubby/photo/1/2/9f44c7ffaf13676a878c2bf0d73f596a.GIF','Matt_Weibo@flickr','벨기에 와플','파는 곳: 브뤼셀,MAISON DANDOY(메종 당두아)<br>가격 : 2~7유로<br/>벨기에의 대표 먹거리, 와플. 그 중에서도 메종 당두아는 185년 전통을 가진 와플 가게입니다. 메종 당두아는 당두아 가문 대대로 전해 내려오는 레시피 그대로 만드는 곳이라고 합니다. 바삭한 와플 위에 여러 토핑을 올려 먹을 수 있어 다양한 와플을 만날 수 있습니다. 길거리에서도 저렴한 가격에 와플을 먹을 수 있으니 꼭 한번 드셔 보세요','stubby');
thema["5"][9]=new themaItem('111021005','47.3691175247919', '8.53817939758301','http://tripgene.com/stubby/photo/1/2/c7e859d776288bf1e114721ee75b4639.GIF','Austin Kirk@flickr','스위스 초콜릿','파는 곳: 스위스 곳곳 초콜렛 샵 등<br>가격 : from 1유로 (종류와 가게에 따라 다름)<br>초콜렛 천국, 스위스. 스위스는 1750년에서야 초콜릿이 유입되어 유럽에서 초콜릿을 가장 늦게 알게 된 나라지만 지금은 초콜릿 계의 일인자로 군림하고 있습니다. 특히 밀크 초콜릿은 스위스의 상징물이 되어 전세계인의 사랑을 받고 있죠. 종류도 많고 우리나라에선 비싼 초콜렛들을 저렴한 가격에 만나볼 수 있습니다.','stubby');


function selRoute(idx)
{

	
	thtml='<div style="width:210px;height:505px;overflow:hidden;margin-left:0px;margin-bottom:0px;padding:0;">';
	thtml=thtml+'<div style="width:100%;padding-top:4px;padding-bottom:4px;background:#696969;color:#ffffff;text-align:center"><font class="stubby_m_white">'+bestrouteTitle[idx]+'</font> <a href="javascript:closeThemaList()"><font style="font-size:14pt"><span class="glyphicon glyphicon-remove"></span></font></a></div>';
	for(i=0;i<bestroute[idx].length;i++) 
	{
		xItem=bestroute[idx][i];
		
		thtml=thtml+'<div style="margin-top:4px;border:1px solid #c0c0c0;"><a href="planner_step1.asp?cityserials='+xItem.cityserials+'" title=\''+xItem.deschtml+'\'><img src="'+xItem.mapurl+'" width="210px" height="110px"></a><div style="background:#a1a1a1;padding-top:2px;padding-bottom:2px;color:#fff;text-align:center"><b>'+xItem.title+'</b></div></div>';

	}
	thtml=thtml+'</div>';
	$("#themaList").html(thtml);
	$("#themaList").show();
	$("#themaBtn").hide();
//	$("#mapControllerCenterTop").hide();
}
function selThema(idx)
{

	
	thtml='<div style="width:210px;height:505px;overflow:hidden;margin-left:0px;margin-bottom:0px;padding:0;">';
	thtml=thtml+'<div style="width:100%;padding-top:4px;padding-bottom:4px;background:#696969;color:#ffffff;text-align:center"><font class="stubby_m_white">'+themaTitle[idx]+'</font> <a href="javascript:closeThemaList()"><font style="font-size:14pt"><span class="glyphicon glyphicon-remove"></span></font></a></div>';
	for(i=0;i<thema[idx].length;i++) 
	{
		xItem=thema[idx][i];
		
		var thumb=xItem.imgurl.replace(".jpg","_m.jpg").replace(".JPG","_m.JPG").replace(".gif","_m.gif").replace(".GIF","_m.GIF").replace(".JPEG","_m.JPEG").replace(".jpeg","_m.jpeg");
		thtml=thtml+'<div style="float:left;width:100px;margin-top:4px;height:75px;overflow:hidden;position:relative;margin-left:4px;border:1px solid #c0c0c0;"><a href="javascript:openInfoWindow(\''+xItem.lat+'\',\''+xItem.lng+'\',\''+xItem.cityserial+'\',\''+idx+'\','+i+')" title="'+xItem.title+'"><img width="100px"  height="75px" src="'+thumb+'" alt="'+xItem.title+'" style="margin-left:0px;margin-right:0px;"></a><div style="position:relative;top:-18px;background:#a1a1a1;width:100px;padding-top:1px;padding-bottom:2px;color:#fff;text-align:center">'+xItem.title+'</div></div>';
		
	}
	thtml=thtml+'</div>';
	$("#themaList").html(thtml);
	$("#themaList").show();
	$("#themaBtn").hide();
//	$("#mapControllerCenterTop").hide();
}
function closeThemaList()
{
	$("#themaList").hide();
	$("#themaBtn").show();	
//	$("#mapControllerCenterTop").show();

}
function openInfoWindow(lat,lng,se,themaidx,idx)
{
	if(prv_infowindow)
		prv_infowindow.close();

	var thumb=thema[themaidx][idx].imgurl.replace(".jpg","_m.jpg").replace(".JPG","_m.JPG").replace(".gif","_m.gif").replace(".GIF","_m.GIF").replace(".JPEG","_m.JPEG").replace(".jpeg","_m.jpeg");

	infowindow = new google.maps.InfoWindow();
	thtml='<div><div style="width:240px;float:left;height:180px;position:relative;overflow:hidden;"><div><img src="'+thumb+'" width="240px"></div><div style="position:relative;top:-18px;background:#333;color:#fff;text-align:center"><a href="/'+thema[themaidx][idx].imgowner+'" target="_blank"><font style="color:#fff">photo by '+thema[themaidx][idx].imgowner+'</font></a></div></div>';
	thtml=thtml+'<div style="width:230px;height:180px;padding-left:5px;float:left;overflow-y:auto;"><h5>'+thema[themaidx][idx].title+'</h5>';
	thtml=thtml+'<p>'+thema[themaidx][idx].desc+'</p><p style="text-align:right"><a href="/'+thema[themaidx][idx].curator+'" target="_blank"><font style="color:#333">해설: <u>'+thema[themaidx][idx].curator+'</u></font></a></p></div></div><div class="clearfix"></div><hr/>';
	thtml=thtml+'<iframe scrolling="no" width="330px" height="100px"  frameborder="0" src="planner_step1_infowindow.asp?lang=ko&s='+se+'"></iframe>';
	infowindow.setContent(thtml);
	infowindow.setPosition(new google.maps.LatLng(lat, lng));
	infowindow.open(map);
	getCityPhotos(se);
	prv_infowindow=infowindow;

}
</script>

	

<!---
	<table width="100%" style="margin-bottom:0px;">
	<tr>
		<td style="padding-right:0px" width="220px" valign="top">

		</td>
		<td style="padding-left:10px;" valign="center" align="center" class="menu_region">
			<select style="width:120px" onchange="onselectchanged(this.value);">

			<option value="48.86110101269274,2.3421478271484375">유럽</option>
			<option value="32.04504182822618,112.137451171875">중국/홍콩</option>
			<option value="35.672149273279075,139.74918365478516">일본</option>
			<option value="14.859850400601036,101.337890625">동남아</option>
			<option value="22.268764039073964,77.62890625">인도</option>
			<option value="49.26780455063753,-96.50390625">북미</option>
			<option value="-17.54376055418527,-70.60546875">남미</option>
			<option value="-27.293689224852393,144.4921875">오세아니아</option>
			<option value="5.7908968128719565,21.97265625">아프리카</option>
			<option value="31.80289258670676,57.12890625">중동</option>

			</select>

		</td>
	</tr>
	</table>
--->

</div>

<SCRIPT> 
	function fsubmit()
	{
		txt_citylist="";
		for(i=0;i<citylist.length;i++)
		{
			txt_citylist=txt_citylist+"%2C"+citylist[i];
			if(cities[citylist[i]].spots.length>0)
			{
				for(j=0;j<cities[citylist[i]].spots.length;j++)
					txt_citylist=txt_citylist+"%7C"+cities[citylist[i]].spots[j].serial.substring(9,14);
			}

		}

		if(txt_citylist!="")
		{
			txt_citylist=txt_citylist.substring(3);
			var thedate=$("#thedate").val();
			window.location="http://www.stubbyplanner.com/plan/step3_multiple.asp?sdate="+thedate+"&gid=&mode=&srcserials="+txt_citylist;
		}
		else
			alert("입력된 도시가 없습니다.");

	}
	$(function() {
		$( "input:submit, a, button", ".demo" ).button({ icons: {primary:'ui-icon-circle-plus'} });
		//$( "a", ".demo" ).click(function() { return false; }); 
	});

	function moveTo(lat,lng)
	{
		var center = new google.maps.LatLng(lat, lng);
		map.panTo(center);
	}
</SCRIPT>
<div  id="mapbottom_container" style="margin-bottom:0px;padding-left:20px;padding-right:0px;position:absolute;width:100%;height:100px;overflow:hidden">
	<div id="myhighlight_container" style="display:none;margin-bottom:0px;padding-left:20px;padding-right:20px;position:absolute;width:100%;height:100px;overflow:hidden">&nbsp;</div>
	<div id="highlight_container" style="display:none;margin-top:20px;padding-left:20px;padding-right:20px;position:absolute;width:100%;height:75px;overflow:hidden">&nbsp;</div>
</div>
<script>
 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

 ga('create', 'UA-913663-1', 'auto');
 ga('send', 'pageview');

</script>



    <!-- Static navbar -->
    <div class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom:0px;border-bottom:0px;">
      <div class="container" style="margin-bottom:0px;width:95%">

        <div class="navbar-header" style="margin-bottom:0px;">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/"  style="padding-bottom:5px;padding-top:5px;"><img src="/img_v9/logo_s.png"></a>

        </div>
      
        <div class="navbar-collapse collapse">
<!----
          <ul class="nav navbar-nav">


	<li style="padding-left:0px;padding-right:0px;"><a href="/plan/planner_step1.asp?cityserials=&lang=en" style="padding-left:0px;padding-right:4px;"><img src="/img_v9/ico_flag_en.png"></a></li>
	<li style="padding-left:0px;padding-right:0px;"><a href="/plan/planner_step1.asp?cityserials=&lang=zh-CN" style="padding-left:0px;padding-right:4px;"><img src="/img_v9/ico_flag_zh-CN.png"></a></li>
	<li style="padding-left:0px;padding-right:0px;"><a href="/plan/planner_step1.asp?cityserials=&lang=ko" style="padding-left:0px;padding-right:4px;"><img src="/img_v9/ico_flag_ko.png"></a></li>
	<li style=""><a href="/plan/planner_step1.asp?cityserials=&lang=jp" style="padding-left:0px;padding-right:4px;" ><img src="/img_v9/ico_flag_jp.png"></a></li>
         </ul>
---->
          <ul class="nav navbar-nav navbar-right">

	<li ><a href="/plan/planner_rt.asp"><font class="stubby_m_grey">플래너</font></a></li>



<li class="dropdown" >
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><font class="stubby_m_grey">광장</font> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/square/index.asp?newstype=QNA">Q/A</a></li>
             <li><a href="/square/index.asp?newstype=FND">동행찾기</a></li>
            <li><a href="/square/index.asp?newstype=HOT">특가정보</a></li>
	 <li><a href="/info/list.asp">국가정보</a></li>
            <li><a href="/square/index.asp?newstype=FRE">자유</a></li>
            <li><a href="/square/index.asp?newstype=ALB">여행앨범</a></li>
            <li><a href="/review/list.asp">여행자리뷰</a></li>
          </ul>
        </li>


	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><font class="stubby_m_grey"><span class="glyphicon glyphicon-heart" style="padding-top:0px"></span> 버킷리스트</font> <span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">

		 <li><a href="/chn/list.asp?region=1[1-4]"> 유럽테마 추천</a></li>
		 <li><a href="/chn/list.asp?region=11101"><img src="/images/is/flag/11101_s.gif"> 프랑스 추천</a></li>
		 <li><a href="/chn/list.asp?region=11103"><img src="/images/is/flag/11103_s.gif"> 영국 추천</a></li>
		 <li><a href="/chn/list.asp?region=11104"><img src="/images/is/flag/11104_s.gif"> 이탈리아 추천</a></li>
		 <li><a href="/chn/list.asp?region=12101"><img src="/images/is/flag/12101_s.gif"> 스페인 추천</a></li>
		 <li><a href="/chn/list.asp?region=11102"><img src="/images/is/flag/11102_s.gif"> 스위스 추천</a></li>
		 <li><a href="/chn/list.asp?region=11106"><img src="/images/is/flag/11106_s.gif"> 독일 추천</a></li>
		 <li><a href="/chn/list.asp?region=12104"><img src="/images/is/flag/12104_s.gif"> 터키 추천</a></li>
		 <li><a href="/chn/list.asp?region=13106"><img src="/images/is/flag/13106_s.gif"> 크로아티아 추천</a></li>
		 <li><a href="/chn/list.asp?region=12103"><img src="/images/is/flag/12103_s.gif"> 그리스 추천</a></li>
		 <li><a href="/chn/list.asp?region=11107"><img src="/images/is/flag/11107_s.gif"> 네덜란드 추천</a></li>
		 <li><a href="/chn/list.asp?region=11108"><img src="/images/is/flag/11108_s.gif"> 벨기에 추천</a></li>
		 <li><a href="/chn/list.asp?region=13101"><img src="/images/is/flag/13101_s.gif"> 체코 추천</a></li>
		 <li><a href="/chn/list.asp?region=13104"><img src="/images/is/flag/13104_s.gif"> 오스트리아 추천</a></li>
		 <li><a href="/chn/list.asp?region=13102"><img src="/images/is/flag/13102_s.gif"> 헝가리 추천</a></li>
		 <li><a href="/chn/list.asp?region=13103"><img src="/images/is/flag/13103_s.gif"> 폴란드 추천</a></li>

		 <li><a href="/chn/list.asp?region=16"> 아시아테마 추천</a></li>
		 <li><a href="/chn/list.asp?region=16102"><img src="/images/is/flag/16102_s.gif"> 일본테마 추천</a></li>
		 <li><a href="/chn/list.asp?region=161021063"><img src="/images/is/flag/16102_s.gif"> 오사카 추천</a></li>
		 <li><a href="/chn/list.asp?region=161021039"><img src="/images/is/flag/16102_s.gif"> 교토 추천</a></li>
		 <li><a href="/chn/list.asp?region=161021080"><img src="/images/is/flag/16102_s.gif"> 도쿄 추천</a></li>
		 <li><a href="/chn/list.asp?region=161021067"><img src="/images/is/flag/16102_s.gif"> 삿포로 추천</a></li>

		 <li><a href="/chn/list.asp?region=161011023"><img src="/images/is/flag/16101_s.gif"> 홍콩 추천</a></li>
		 <li><a href="/chn/list.asp?region=161011002"><img src="/images/is/flag/16101_s.gif"> 북경 추천</a></li>
		 <li><a href="/chn/list.asp?region=16125"><img src="/images/is/flag/16125_s.gif"> 대만 추천</a></li>
		 <li><a href="/chn/list.asp?region=16117"><img src="/images/is/flag/16117_s.gif"> 싱가폴 추천</a></li>


		</ul>
	</li>
	<li><font color="#c4c4c4"> </font></li>



	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><font class="stubby_m_grey">여행검색</font> <span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
		 <li><a href="/supertrip/index.asp?region=1[1-4]&term=30&onlyReview=1&onlyBest=1">유럽 30일</a></li>
		 <li><a href="/supertrip/index.asp?region=1[1-4]&term=21&onlyReview=1&onlyBest=1">유럽 21일</a></li>
		 <li><a href="/supertrip/index.asp?region=1[1-4]&term=15&onlyReview=1&onlyBest=1">유럽 15일</a></li>
		 <li><a href="/supertrip/index.asp?region=1[1-4]&term=7&onlyReview=1&onlyBest=1">유럽 7일</a></li>

		 <li><a href="/supertrip/index.asp?region=12101&onlyReview=1&onlyBest=1"><img src="/images/is/flag/12101_s.gif"> 스페인 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=11101&onlyReview=1&onlyBest=1"><img src="/images/is/flag/11101_s.gif"> 프랑스 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=11103&onlyReview=1&onlyBest=1"><img src="/images/is/flag/11103_s.gif"> 영국 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=11104&onlyReview=1&onlyBest=1"><img src="/images/is/flag/11104_s.gif"> 이탈리아 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=13&onlyReview=1&onlyBest=1">동유럽 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=12104&onlyReview=1&onlyBest=1"><img src="/images/is/flag/12104_s.gif"> 터키 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=13106&onlyReview=1&onlyBest=1"><img src="/images/is/flag/13106_s.gif"> 크로아티아 여행</a></li>
		 <li><a href="/supertrip/index.asp?region=12103&onlyReview=1&onlyBest=1"><img src="/images/is/flag/12103_s.gif"> 그리스 여행</a></li>
		 <li><a href="/supertrip/"> 전체보기</a></li>
		</ul>
	</li>          


	<li><font color="#c4c4c4"> </font></li>
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><font class="stubby_m_grey">여행정보</font> <span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">

            <li><a href="/wheretogo/">가이드북</a></li>
             <li><a href="/transit/">도시이동정보</a></li>
		</ul>
	</li>

	<li><font color="#c4c4c4"> </font></li>


<li class="dropdown" >
          <a href="/slp/" role="button" aria-expanded="false"><font class="stubby_m_grey">추천숙소</font> </a>
        </li>

<li class="dropdown" >
          <a href="/market/" role="button" aria-expanded="false"><font class="stubby_m_grey">투어/티켓</font> </a>
        </li>


	<li><font color="#c4c4c4"> </font></li>

  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
	<li>


	</li>

<!---
	<li ><a href="/new/explore.asp"><font class="stubby_m_grey">여행계획</font></a></li>
	<li><font color="#c4c4c4"> </font></li>
	<li  ><a href="/wheretogo/"><font class="stubby_m_grey">가이드북</font></a></li>
--->
          



	<li><div style="background:#a1a1a1;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px;margin-left:8px;margin-top:10px;"><a href="/common/register.asp"><font class="stubby_s_white">+회원가입</font></a></div></li>
	<li><div style="background:#a1a1a1;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px;margin-left:8px;margin-top:10px;"><a href="/common/login.asp"><font class="stubby_s_white">로그인</font></a></div></li>

          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </div>








<script>

function shownotifylist()
{
	var surl="/planner/if_notifylist.asp";
	document.getElementById("if_notifydetail").src=surl;
	$("#notifydetail_title").html("Notifications");
	$('#modal-notifydetail').modal({
		keyboard: true,
		backdrop: 'static',
		show:true
	});
}
function closeModal(id)
{
	$(".modal.in").modal('hide');
}
function login()
{

	closeModal();
	
	var surl="/planner/if_login.asp?h_url="+escape(document.URL);
	document.getElementById("if_login").src=surl;

	$('#modal-login').modal();

}
function shownotifydetail(t,s,ns)
{

		var surl="/planner/if_notifydetail.asp?ns="+ns+"&t="+t+"&s="+s;
		document.getElementById("if_notifydetail").src=surl;
		if(t=="plan")
			$("#notifydetail_title").html("플래너 댓글");
		else
			$("#notifydetail_title").html("NEWS FEED");
		$('#modal-notifydetail').modal();
}

function openTourMap(srcserial,ds,mapid)
{
	if(ds)
	{
		if(mapid)
		{
			bindex=mapid.indexOf("b");
			cid=mapid.substring(1,bindex);
			bid=mapid.substring(bindex+1);

			NewWin=window.open("/tourmap/tourmap.asp?ds="+ds+"&bid="+bid+"&cid="+cid, "map", "width=1000,height=710,toolbar=No,location=No,scrollbars=no,status=No,resizable=yes"); 
			NewWin.moveTo(0,0);
			NewWin.focus();
		}
		else
		{
			NewWin=window.open("/tourmap/tourmap.asp?ds="+ds, "map", "width=1000,height=710,toolbar=No,location=No,scrollbars=no,status=No,resizable=yes"); 
			NewWin.moveTo(0,0);
			NewWin.focus();
		}
	}
	else
	{
		NewWin=window.open("/tourmap/tourmap.asp?SrcSerial="+srcserial, "map", "width=1000,height=710,toolbar=No,location=No,scrollbars=no,status=No,resizable=yes"); 
		NewWin.moveTo(0,0);
		NewWin.focus();
	}
}

function showAD()
{
	closeModal();
	$('#modal-ad').modal();
}
</script>



<div id="modal-notifydetail" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:600px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="notifydetail_title">Notifications</h4>
      </div>
      <div class="modal-body" style="width:580px;height:430px;">
              <iframe id="if_notifydetail" frameborder="0" src="about:blank" width="560px" height="400px" scrolling="no"></iframe>
      </div>
    </div>
  </div>
</div>

<div id="modal-login" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:700px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="notifydetail_title">스투비 로그인</h3>
      </div>
      <div class="modal-body" style="width:680px;height:420px;">
              <iframe id="if_login" frameborder="0" src="about:blank" width="660px" height="400px" scrolling="no"></iframe>
      </div>
    </div>
  </div>
</div>


<script src="http://www.google.com/jsapi"></script>
<script>


</script>

<table width="100%" cellpadding="0" cellspacing="0">
<tr><td style="padding-top:0px"  style="padding-top:0px;padding-bottom:0px">
			<table width="100%"  bgcolor="#ffffff" style="border:1px solid #8d8e81;">
				<tr>
				<td valign="top" style="padding-top:0px;padding-bottom:0px">
					<div id="map_container" style="width:100%;height:600px;overflow:hidden">
						<div id="map_canvas"  style="border-right:1px solid #8d8e81;width:100%;height:580px"></div>
					</div>
				</td>
				<td width="280px" valign="top" align="center">
				<div style="width:100%;">
					<div id="btnStart" style="margin-top:7px;margin-left:5px;margin-right:5px;margin-bottom:5px;background:#353535;width:265px;text-align:center;padding-top:5px;padding-bottom:5px;"><a href="#" onclick="fsubmit();"  style="text-decoration:none;"><font class="stubby_l_white">플래너 만들기 &gt;</font></a></div>


					<div id="anal" style="margin-top:5px;overflow:hidden;">
						<div style="float:left;width:34%;text-align:center;" onmouseover="showinfo('cost')" onmouseout="hideinfo('cost')">
							<font class="stubby_m_black">최소경비</font>
							<p style="font-size:20pt;margin-top:0px;margin-bottom:0px;">0<font style="font-size:9pt">-</font></p>
						</div>
						<div style="float:left;width:33%;text-align:center;" onmouseover="showinfo('period')" onmouseout="hideinfo('period')">
							<font class="stubby_m_black">최소기간</font>
							<p style="font-size:20pt;margin-top:0px;margin-bottom:0px;">0<font style="font-size:9pt">-</font></p>
						</div>
						<div style="float:left;width:33%;text-align:center;" onmouseover="showinfo('period')" onmouseout="hideinfo('period')">
							<font class="stubby_m_black">피크시즌</font>
							<p style="font-size:20pt;margin-top:0px;margin-bottom:0px;">-</p>
						</div>
					</div>


					<div style="border-top:1px solid #000000;padding-top:5px;padding-left:10px;">

					<div class="input-group input-group-lg">
					  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span> 출발일</span>
					  <input style="width:150px;" id="thedate"  type="text" class="form-control" onchange="updateDate()">
					</div>

					</div>
					<div style="margin-top:2px;padding-top:3px;padding-bottom:3px;height:48px;background:#cfcfcf;display:none">
						<h5 class="stubby_s_black" style="margin-top:3px;margin-bottom:3px">항공권<small><span id="txt_total_air_price" style="font-size:9pt"></span></small></h5>
						<span id="IN_CITY" style="font-family:돋움;font-size:9pt"></span>
						<span id="OUT_CITY" style="margin-left:7px;font-family:돋움;font-size:9pt"></span>
					</div>


<script>
function compareAirTicket(tt)
{
	FirstCity=citylist[0];
	LastCity=citylist[citylist.length-1];

	var indate=$("#thedate").val();
	var xx = new Date(indate);
	var thedate_out=new Date();
	var term=4;
	if($("#TXT_TERM"))
	{
		term=eval($("#TXT_TERM").html());
		
	}
	if(term>0)
		term=term;
	else
		term=4;
	thedate_out.setDate(xx.getDate()+term);
	var outdate = getFormattedDate(thedate_out);
	indate_nobar=indate.replace(/-/g,'');
	outdate_nobar=outdate.replace(/-/g,'');


	if(tt=="F")
		window.open("/plan/trs_deeplink.asp?lang=ko&date_all="+indate_nobar+"&TRSType=3&depserial=161031001&desserial="+FirstCity);
	else if(tt=="R")
		window.open("/plan/trs_deeplink.asp?lang=ko&date_all="+outdate_nobar+"&TRSType=3&depserial="+LastCity+"&desserial=161031001");
	else
		window.open("/plan/trs_deeplink.asp?lang=ko&date_all="+indate_nobar+"&rt_date_all="+outdate_nobar+"&TRSType=5&depserial=161031001&desserial="+FirstCity);


}
var air_price_sum=0;
function getAirPrice()
{
	var incity=citylist[0];
	var outcity=citylist[citylist.length-1];
	var air_price_sum=0;
	$("#txt_total_air_price").html('');
	var indate=$("#thedate").val();
	var xx = new Date(indate);
	//var thedate_out=new Date();
	var term=4;
	if($("#TXT_TERM"))
	{
		term=eval($("#TXT_TERM").html());
		
	}
	if(term>0)
		term=term;
	else
		term=4;

	//thedate_out.setDate(xx.getDate()+term);
	var thedate_out=new Date(xx.getTime() + term * 24 * 60 * 60 * 1000 - 30* 24 * 60 * 60 * 1000);
	var outdate = getFormattedDate(thedate_out);


	var txt_cur="만원";
	if(incity==outcity)
	{
	                $.ajax({
	               	     url: 'http://www.tripgene.com/api/getairprice.php?indate='+indate+'&outdate='+outdate+'&lang=ko&i='+incity+'&o='+outcity,
	               	     dataType: 'jsonp',
	               	     success: function(data){
			var thebtn='<div class="div_btn_airprice" style="padding-top:3px;padding-bottom:3px;width:60px;display:inline;background:#a1a1"><a id="btn_airprice" href="javascript:compareAirTicket(\'X\');" style="color:#ffffff;font-family:돋움;font-size:9pt;">시간표</a></div>';
			if(data!="")
			{
				if(data>0)
				{
					thebtn='<div class="div_btn_airprice" style="padding-top:3px;padding-bottom:3px;width:60px;display:inline;background:#e45d44"><a id="btn_airprice" href="javascript:compareAirTicket(\'X\');" style="color:#ffffff;font-family:돋움;font-size:9pt;">'+data+txt_cur+'~ </a></div>';
				}
			}
			$("#IN_CITY").html(cities[incity].name+" 왕복 "+thebtn);
			$("#OUT_CITY").html('');
		      }
		 });
	}
	else
	{
                	$.ajax({
               		     url: 'http://www.tripgene.com/api/getbestprice.php?thedate='+indate+'&lang=ko&trstype=air&dep=161031001&des='+incity,
               		     dataType: 'jsonp',
               		     success: function(data){
			var thebtn='<div class="div_btn_airprice" style="padding-top:3px;padding-bottom:3px;width:60px;display:inline;background:#a1a1a1"><a id="btn_airprice" href="javascript:compareAirTicket(\'F\');" style="color:#ffffff;font-family:돋움;font-size:9pt;">시간표</a></div>';
			if(data!="")
				if(data>0)
				{
					thebtn='<div class="div_btn_airprice" style="padding-top:3px;padding-bottom:3px;width:60px;display:inline;background:#e45d44"> <a id="btn_airprice" href="javascript:compareAirTicket(\'F\');" style="color:#ffffff;font-family:돋움;font-size:9pt;">'+data+txt_cur+'~ </a></div>';
					if(air_price_sum>0)
					{
						air_price_sum=air_price_sum+data;
						$("#txt_total_air_price").html(air_price_sum+"만원~");
					}else{air_price_sum=data;}
				}
			$("#IN_CITY").html(cities[incity].name+"IN "+thebtn);

		      }
		 });
                	$.ajax({
               		     url: 'http://www.tripgene.com/api/getbestprice.php?thedate='+outdate+'&lang=ko&trstype=air&dep='+outcity+'&des=161031001',
               		     dataType: 'jsonp',
               		     success: function(data){
			var thebtn='<div class="div_btn_airprice" style="padding-top:3px;padding-bottom:3px;width:60px;display:inline;background:#a1a1a1"><a id="btn_airprice" href="javascript:compareAirTicket(\'R\');" style="color:#ffffff;font-family:돋움;font-size:9pt;">가격비교</a></div>';
			if(data!="")
				if(data>0)
				{
					thebtn='<div class="div_btn_airprice" style="padding-top:3px;padding-bottom:3px;width:60px;display:inline;background:#e45d44"> <a id="btn_airprice" href="javascript:compareAirTicket(\'R\');" style="color:#ffffff;font-family:돋움;font-size:9pt;">'+data+txt_cur+'~ </a></div>';
					if(air_price_sum>0)
					{
						air_price_sum=air_price_sum+data;
						$("#txt_total_air_price").html(air_price_sum+"만원~");
					}else{air_price_sum=data;}

				}

			$("#OUT_CITY").html(cities[outcity].name+"OUT "+thebtn);
		      }
		 });
	}

}
</script>

<script>
$('#thedate').datepicker();
$('#thedate').datepicker( "option", "dateFormat", "yy-mm-dd" );
$('#thedate').val('2016-05-04')

function updateDate()
{
	getHighlights('');
	var thedate=$("#thedate").val();
	var des;
	var lastIdx=0;
	showLoading(thedate);

	getAirPrice();
	
	$(".cityblock .trsinfo").each(function( idx ) {
		$(".cityblock .trsinfo").eq(idx).find(".check_train").html("시간표");
		$(".cityblock .trsinfo").eq(idx).find(".check_train_div").css("background","#a1a1a1");
		$(".cityblock .trsinfo").eq(idx).find(".check_air").html("시간표");
		$(".cityblock .trsinfo").eq(idx).find(".check_air_div").css("background","#a1a1a1");
	});

		var xx = new Date(thedate);
		var thedate_out=new Date();
		thedate_out.setDate(xx.getDate()+1);
		var thedate_out_str = getFormattedDate(thedate_out);

	$(".cityblock .trsinfo").each(function( idx ) {
		dep=citylist[idx-1];
		des=citylist[idx];
		lastIdx=idx;
		var txt_cur="만원";
		
                	$.ajax({
               		     url: 'http://www.tripgene.com/api/getbestprice.php?thedate='+thedate+'&lang=ko&trstype=rail&dep='+dep+'&des='+des,
               		     dataType: 'jsonp',
               		     success: function(data){
			if(data!="")
				if(data>0)
				{
					$(".cityblock .trsinfo").eq(idx).find(".check_train").html(data+txt_cur+"~");
					$(".cityblock .trsinfo").eq(idx).find(".check_train_div").css("background","#e45d44");
				}
		      }
		 });
                	$.ajax({
               		     url: 'http://www.tripgene.com/api/getbestprice.php?thedate='+thedate+'&lang=ko&trstype=air&dep='+dep+'&des='+des,
               		     dataType: 'jsonp',
               		     success: function(data){
			if(data!="")
				if(data>0)
				{
					$(".cityblock .trsinfo").eq(idx).find(".check_air").html(data+txt_cur+"~");
					$(".cityblock .trsinfo").eq(idx).find(".check_air_div").css("background","#e45d44");
				}
		      }
		 });





	               	$.ajax({
			url: 'http://tripgene.com/api/bookingdeals.php?checkin='+thedate+'&checkout='+ thedate_out_str+'&lang=ko&cityserial='+des,
			dataType: 'jsonp',
			success: function(data){
				if(data!="")
				{
					dataArr=data.split(",");
					var cnt=dataArr[0];
					var turl=dataArr[1].replace("flash_deals=1","pr=0,210000");

					if(cnt>0&&cnt<1000)
						$(".cityblock .deals").eq(idx-1).html(" <a href=\""+turl+"\" target=\"_blank\" style=\"text-decoration:underline;color:#fe3608;font-size:8pt;font-family:tahoma\" title=\" 특별 할인 중인 "+cnt+"개 호텔\">"+cnt+" deals</a>");
					else
						$(".cityblock .deals").eq(idx-1).html(" <a href=\""+turl+"\" target=\"_blank\" style=\"text-decoration:underline;color:#fe3608;font-size:8pt;font-family:tahoma\" title=\" 특별 할인 호텔\">Hot Deals</a>");
				}
		      }
		 });
	});


	               	$.ajax({
			url: 'http://tripgene.com/api/bookingdeals.php?checkin='+thedate+'&checkout='+ thedate_out_str+'&lang=ko&cityserial='+dep,
			dataType: 'jsonp',
			success: function(data){
				if(data!="")
				{
					dataArr=data.split(",");
					var cnt=dataArr[0];
					var turl=dataArr[1].replace("flash_deals=1","pr=0,210000");

					if(cnt>0&&cnt<1000)
						$(".cityblock .deals").eq(lastIdx).html(" <a href=\""+turl+"\" target=\"_blank\" style=\"text-decoration:underline;color:#fe3608;font-size:8pt;font-family:tahoma\" title=\" 특별 할인 중인 "+cnt+"개 호텔\">"+cnt+" deals</a>");
					else
						$(".cityblock .deals").eq(lastIdx).html(" <a href=\""+turl+"\" target=\"_blank\" style=\"text-decoration:underline;color:#fe3608;font-size:8pt;font-family:tahoma\" title=\" 특별 할인 호텔\">Hot Deals</a>");
				}
		      }
		 });

}
function getFormattedDate(date) {
  var year = date.getFullYear();
  var month = (2 + date.getMonth()).toString();
if (month>12)
{
	year++;
	month=month-12;
}
  month = month.length > 1 ? month : '0' + month;
  var day = date.getDate().toString();
  day = day.length > 1 ? day : '0' + day;
  return year + '-' + month + '-' + day;
}
function trslink(trstype,dep,des)
{
	var thedate=$("#thedate").val();
	thedate_nobar=thedate.replace("-","").replace("-","");
	window.open('/plan/trs_deeplink.asp?lang=ko&date_all='+thedate_nobar+'&TRSType='+trstype+'&depserial='+dep+'&desserial='+des);
}
function showinfo(t)
{
	$("#cityroute").hide();
	$("#info_"+t).show();
}
function hideinfo(t)
{
	$("#info_"+t).hide();
	$("#cityroute").show();
}
</script>

					<table cellspacing="0" cellpadding="0" width="100%">
					<tr><td colspan="2" style="padding-top:0px">
		<div id="cityroute" style="position:relative;text-align:center;width:265px;margin-top:0px;padding-left:3px;padding-top:2px;overflow-x:hidden;overflow-y:auto;height:580px;background:#ffffff">
			<br/><br/><br/><font style="font-size:9pt" color="#c0c0c0"><b>입력된 도시가 없습니다.</b></font>
		</div>
					</td></tr>
					</table>
				</div>					



				</td>


				</tr>
			</table>


			<div style="padding-top:0px;text-align:left;">
				<p style="float:right;padding-right:20px;padding-top:0px;font-size:9pt;font-family:돋움">
					<a href="javascript:showIntro()"><u><font style="color:#353535">사용법</font></u></a>&nbsp;&nbsp;
					<a href="javascript:share()"><u><font style="color:#353535">공유하기</font></u></a>&nbsp;&nbsp;
					<a href="/plan/planner_step1.asp?isnew=1"><u><font style="color:#353535">플래너 다시시작</font></u></a>
					
				</p>

				<p style="float:left;padding-left:20px;padding-top:0px;font-size:9pt;font-family:돋움">원하는 도시를 찾을 수 없나요?<a href="javascript:if(confirm('로그인이 필요합니다. 로그인 화면으로 이동할까요?'))window.location='/common/login.asp';"><u><font style="color:#353535">직접 도시 추가</font></u></a></p>
			</div>


<script>
function getLink()
{
	var turl="http://www.stubbyplanner.com/plan/planner_step1.asp?cityserials=";
	for(i=0;i<citylist.length;i++)
	{
		se=citylist[i];
		if(i==citylist.length-1)
		{
			turl=turl+se;
			if(cities[se].spots)
			{
				for(j=0;j<cities[se].spots.length;j++)
				{
					st=cities[se].spots[j].serial;
					st=st.substring(9,14);
					if(j==0)
						turl=turl+"|";
					if(j==cities[se].spots.length-1)
						turl=turl+st;
					else
						turl=turl+st+"|";
				}
			}
		}
		else
		{
			turl=turl+se;
			if(cities[se].spots)
			{
				for(j=0;j<cities[se].spots.length;j++)
				{
					st=cities[se].spots[j].serial;
					st=st.substring(9,14);

					if(j==0)
						turl=turl+"|";

					if(j==cities[se].spots.length-1)
						turl=turl+st;
					else
						turl=turl+st+"|";
				}
			}
			turl=turl+",";

		}

	}
	
	window.location=turl;
}
Spot = function(spotname,spotserial,lat,lng,imgurl) {
        this.name =spotname;
        this.serial = spotserial;
        this.lat = lat;
        this.lng = lng;
        this.imgurl=imgurl;
}
City = function(cityname,cityserial,lat,lng) {
        this.name = cityname;
        this.serial = cityserial;
        this.lat = lat;
        this.lng = lng;
        this.spots=[];
}
    $("#autoc").autocomplete({

      source: "/plan/ajax/searchcity.asp",

      minLength:1,
      select: function( event, ui ) {
	//addCity(ui.item.label,ui.item.id,ui.item.lat,ui.item.lng);
	var myLatlng = new google.maps.LatLng(ui.item.lat,ui.item.lng);

	if(prv_infowindow)
		prv_infowindow.close();

	infowindow = new google.maps.InfoWindow();
	thtml='<iframe scrolling="no" width="330px" height="100px"  frameborder="0" src="planner_step1_infowindow.asp?lang=ko&s='+ui.item.id+'"></iframe>';
	infowindow.setContent(thtml);
	infowindow.setPosition(myLatlng);
	google.maps.event.addListener(infowindow,'closeclick',function(){
		getHighlights('');
	});

	infowindow.open(map);
	prv_infowindow=infowindow;
	getCityPhotos(ui.item.id);
      }
    });

cities=[];
citylist=[];
lines=[];

var lastcity=0;
function redrawMapMarkers()
{
	clearMyMarkers();
	clearNextMarkers();
	for(i=0;i<citylist.length;i++)
	{

		se=citylist[i];
		tcity=cities[se];
		cities[se]=tcity;

		var marker=createMyMarker(tcity.name,tcity.serial,tcity.lat,tcity.lng,i);		
		
		if(i>0)
		{
			s=citylist[i-1];
			lastcity=cities[s];
			 var lineCoordinates = [
			      new google.maps.LatLng(lastcity.lat, lastcity.lng),
			      new google.maps.LatLng(tcity.lat, tcity.lng)
			  ];

			 var lineSymbol = {
			    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
			  };

			  var linePath = new google.maps.Polyline({
			    path: lineCoordinates,
			    icons: [{
			      icon: lineSymbol,
			      offset: '100%'
			    }],
			    strokeColor: '#353535',
			    strokeOpacity: 0.9,
			    strokeWeight: 2
			  });

			linePath.setMap(map);
			lines[lines.length]=linePath;

		}


	}
	lastcity=cities[citylist[citylist.length-1]];
}
function clearLines()
{
	for(i=0;i<lines.length;i++)
	{
		lines[i].setMap(null);
	}
	lines=[];
}
function reOrder()
{
	$(".cityblock").each(function(idx) {
		
		$(this).attr("id","cityblock"+idx);
		$("#cityblock"+idx+" .btnDel").attr("href","javascript:delCity("+idx+")");
		
		
	});
}
function moveCity(sidx,eidx)
{
	
    if(sidx!=eidx)
    {
	if(sidx>eidx)
	{
		tserial=citylist[sidx];
		for(i=sidx;i>eidx;i--)
		{
			citylist[i]=citylist[i-1];
		}
		citylist[eidx]=tserial;	
	}
	else
	{

		tserial=citylist[sidx];
		for(i=sidx;i<=eidx;i++)
		{
			citylist[i]=citylist[i+1];
		}
		citylist[eidx]=tserial;
	}
	
	if(eidx>0)
	{
		dep=citylist[eidx-1];
		des=citylist[eidx];
		loadTrsInfo(eidx,dep,des);
	}

	if(eidx+1<citylist.length)
	{
		dep=citylist[eidx];
		des=citylist[eidx+1];
		loadTrsInfo(eidx+1,dep,des);
	}
	if(sidx>0&&sidx+1<citylist.length)
	{
		dep=citylist[sidx-1];
		des=citylist[sidx];
		
		loadTrsInfo(sidx,dep,des);
	}

	$(".cityblock .trsinfo").eq(0).html('');
	clearLines();
	redrawMapMarkers();
	reOrder();
    }
	reloadCostNPeriod();
	getAirPrice();

}
function reloadCostNPeriod()
{


		txt_citylist="";
		for(i=0;i<citylist.length;i++)
		{
			txt_citylist=txt_citylist+","+citylist[i];
		}
		if(txt_citylist!="")
			txt_citylist=txt_citylist.substring(1);

	$.ajax({
		  url: "ajax/GetCostNStory.asp",
		  data: {
		    lang:"ko",
		    cities:txt_citylist
		  },
		  success: function( data ) {
			$("#anal").html(data);
			
	  	}
	});





}
function loadTrsInfo(idx,depserial,desserial)
{
	var A=cities[depserial];
	var B=cities[desserial];
	$.ajax({
		  url: "ajax/recommtrs.asp",
		  data: {
		    lang:"ko",
		    dep:depserial,
		    des:desserial
		  },
		  success: function( data ) {
			$(".cityblock .trsinfo").eq(idx).html(data);
//			$("#cityblock"+idx+" .trsinfo").html(data);

			var txt_cur="만원";
			var thedate=$("#thedate").val();
	                	$.ajax({
	               		     url: 'http://www.tripgene.com/api/getbestprice.php?thedate='+thedate+'&lang=ko&trstype=rail&dep='+A.serial+'&des='+B.serial,
	               		     dataType: 'jsonp',
	               		     success: function(data){
				if(data!="")
					if(data>0)
					{
						$(".cityblock .trsinfo").eq(idx).find(".check_train").html(data+txt_cur+"~");
						$(".cityblock .trsinfo").eq(idx).find(".check_train_div").css("background","#e45d44");
					}
			      }
			 });

	                	$.ajax({
	               		     url: 'http://www.tripgene.com/api/getbestprice.php?thedate='+thedate+'&lang=ko&trstype=air&dep='+A.serial+'&des='+B.serial,
	               		     dataType: 'jsonp',
	               		     success: function(data){
				if(data!="")
					if(data>0)
					{
						$(".cityblock .trsinfo").eq(idx).find(".check_air").html(data+txt_cur+"~");
						$(".cityblock .trsinfo").eq(idx).find(".check_air_div").css("background","#e45d44");
					}
			      }
			 });


	  	}
	});


}
function delCity(idx)
{
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$("#cityblock"+idx).remove();
		citylist.splice(idx, 1);
		clearLines();
		redrawMapMarkers();
		reOrder();
		if(idx>0&&idx<citylist.length)
		{
			dep=citylist[idx-1];
			des=citylist[idx];
			loadTrsInfo(idx,dep,des);
		}
		$(".cityblock .trsinfo").eq(0).html('');

		if(citylist.length>0)
		{
			lastcity=cities[citylist[citylist.length-1]];
		}
		else
		{
			lastcity=0;
			
		}
	}
	reloadCostNPeriod();
	getHighlights('');
	getAirPrice();
}

function createMyMarker(cityname,cityserial,lat,lng,i) 
{
	var zidx=1000+i;

	if(i==0)
	{
		icoimg="http://www.stubbyplanner.com/img_v8/marker_in.png"
	}
	else if(i==citylist.length-1)
	{
		icoimg="http://www.stubbyplanner.com/img_v8/marker_out.png"

	}
	else
	{
		icoimg="http://www.stubbyplanner.com/img_v8/marker.png"
	}

	var myLatlng = new google.maps.LatLng(tcity.lat,tcity.lng);
	var marker = new google.maps.Marker({
	      icon:icoimg,
	      position: myLatlng,
	      map: map,
	      title: tcity.name,
	      zindex:zidx
	});
            	

	myMarkers.push(marker);
	zzhtml="<div id=\"cityblock"+citylist.length+"\" class=\"cityblock\" style=\"position:relative\"><p class=\"trsinfo\"></p><div class=\"cityinfo\"><input type=\"hidden\" class=\"cityserial\" value=\""+tcity.serial+"\"><div width=\"215px;overflow-x:hidden\"><div style=\"float:left;width:180px\"><img src=\"http://www.stubbyplanner.com/images/is/flag/"+tcity.serial.substring(0,5)+"_s.gif\"><font class=\"stubby_s_black\"> "+tcity.name+"</font><span class=\"deals\"></span></div><div style=\"float:left;width:15px;\"><img id=\"img_move\" style=\"margin-right:5px;\" src=\"/img_v8/ico_move.png\"></div><div style=\"float:left;width:20px;\"><a class=\"btnDel\" href=\"javascript:delCity("+citylist.length+")\"><img style=\"margin-top:2px;float:right\" src=\"/img_v8/btn_delete.png\"></a></div><div class=\"clear\"></div></div> </div><div class=\"spotbox\" style=\"text-align:left\"></div></div>";


	var idx=i;
	  google.maps.event.addListener(marker, 'click', function() {
		if(prv_infowindow)
			prv_infowindow.close();

		infowindow = new google.maps.InfoWindow();
		
		
		thtml='<iframe scrolling="no" width="330px" height="100px"  frameborder="0" src="planner_step1_myinfowindow.asp?idx='+idx+'&lang=ko&s='+cityserial+'"></iframe>';
		infowindow.setContent(thtml);

		google.maps.event.addListener(infowindow,'closeclick',function(){
			
		});


		infowindow.open(map,marker);
		prv_infowindow=infowindow;
		getHighlights(cityserial);
	  });
	return zzhtml;
}
function addCity(cityname,cityserial,lat,lng)
{

	tAddCity(cityname,cityserial,lat,lng);
	getNextCities(lastcity.serial);
	if(prv_infowindow)
	{
		prv_infowindow.close();
		prv_infowindow=null;
	}

	$( ".cityblock .cityinfo" ).bind( "click", function() {
		var se=$(this).children(".cityserial").val();
		var idx=$(this).parent().attr("id").replace(/cityblock/g, '');;

		if(prv_infowindow)
			prv_infowindow.close();

		infowindow = new google.maps.InfoWindow();
		
		thtml='<iframe scrolling="no" width="330px" height="100px"  frameborder="0" src="planner_step1_myinfowindow.asp?idx='+idx+'&lang=ko&s='+se+'"></iframe>';
		infowindow.setContent(thtml);
		
		getHighlights(se);
		infowindow.open(map,myMarkers[idx]);
		
		prv_infowindow=infowindow;
		
	});

	$( ".cityblock .cityinfo" ).bind( "mouseover", function() {
		
//		$(this).children("div").children("div").children("#img_move").show();


	});

	$( ".cityblock .cityinfo" ).bind( "mouseout", function() {
//		$(this).children("div").children("div").children("#img_move").hide();
//		$(this).animate({
//			  opacity: "1"
//		}, "fast");
	});


	var scrollBottom = eval($("#cityroute")[0].scrollHeight);
	$("#cityroute").scrollTop(scrollBottom);
	$("#autoc").val('');

	getAirPrice();
	reloadCostNPeriod();
	getHighlights('');
	
	if(isfirst)
	{
		var i;
		var bounds = new google.maps.LatLngBounds();
		for(i=0;i<citylist.length;i++)
		{
			var tcity=cities[citylist[i]];
			tLatlng= new google.maps.LatLng(tcity.lat,tcity.lng);
			bounds.extend(tLatlng);
		}
		if(i>1)
			map.fitBounds(bounds);
		isfirst=false;
	}
	else
	{
		moveTo(lat,lng);
	}

	
}


function tAddCity(cityname,cityserial,lat,lng)
{
	tcity=new City(cityname,cityserial,lat,lng);
	cities[cityserial]=tcity;
	
	var thtml=createMyMarker(cityname,cityserial,lat,lng,citylist.length-1);

	if(myMarkers.length==1)
	{
		$("#cityroute").html(thtml);
		$("#btnStart").css("background","#ee5a3e");
	}
	else
	{
		$("#cityroute").append(thtml);
	}

	
	if(myMarkers.length>2)
		myMarkers[myMarkers.length-2].setIcon('http://www.stubbyplanner.com/img_v8/marker.png');
	if(myMarkers.length==2)
		myMarkers[myMarkers.length-2].setIcon('http://www.stubbyplanner.com/img_v8/marker_in.png');		

	//redrawMapMarkers();

	if(lastcity!=0)
	{
		 var lineCoordinates = [
		      new google.maps.LatLng(lastcity.lat, lastcity.lng),
		      new google.maps.LatLng(tcity.lat, tcity.lng)
		  ];
			 var lineSymbol = {
			    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
			  };

			  var linePath = new google.maps.Polyline({
			    path: lineCoordinates,
			    icons: [{
			      icon: lineSymbol,
			      offset: '100%'
			    }],
			    strokeColor: '#353535',
			    strokeOpacity: 0.9,
			    strokeWeight: 2
			  });
		linePath.setMap(map);
		lines[lines.length]=linePath;

		var idx=citylist.length;
		loadTrsInfo(idx,lastcity.serial,tcity.serial);
	}
	citylist[citylist.length]=cityserial;
	lastcity=tcity;

	var tidx=citylist.length-1;
	var thedate=$("#thedate").val();

	var xx = new Date(thedate);
	var thedate_out=new Date();
	thedate_out.setDate(xx.getDate()+1);
	var thedate_out_str = getFormattedDate(thedate_out);
               	$.ajax({
		url: 'http://tripgene.com/api/bookingdeals.php?checkin='+thedate+'&checkout='+thedate_out_str+'&lang=ko&cityserial='+cityserial,
		dataType: 'jsonp',
		success: function(data){

			if(data!="")
			{
				dataArr=data.split(",");
				var cnt=dataArr[0];
				var turl=dataArr[1].replace("flash_deals=1","pr=0,210000");
				if(cnt>0&&cnt<1000)
					$(".cityblock .deals").eq(tidx).html(" <a href=\""+turl+"\" target=\"_blank\" style=\"text-decoration:underline;color:#fe3608;font-size:8pt;font-family:tahoma\" title=\""+cityname+"의 특별 할인 중인 "+cnt+"개 호텔\">"+cnt+" deals</a>");
				else
					$(".cityblock .deals").eq(tidx).html(" <a href=\""+turl+"\" target=\"_blank\" style=\"text-decoration:underline;color:#fe3608;font-size:8pt;font-family:tahoma\" title=\""+cityname+"의 특별 할인 호텔\">Hot Deals</a>");
			}
	      }
	 });


}
function drawCities()
{
	
}
function showWthr(cityname,srcserial,thedate)
{
	document.getElementById("if_Wthr").src="if_ShowWthr.asp?srcserial="+srcserial+"&thedate="+thedate;
	$('#title-Wthr').html(cityname+" 예상기온");	
	$('#modal-Wthr').modal();
}
function showTripFriends(cityname,srcserial,thedate)
{
	document.getElementById("if_tripfriend").src="if_tripfriend.asp?srcserial="+srcserial+"&thedate="+thedate;
	$('#title-tripfriend').html(cityname+" 동행추천");	
	$('#modal-tripfriend').modal();
}
function showEvent(cityname,srcserial,thedate,se)
{
	document.getElementById("if_event").src="if_eventdetail.asp?serial="+se+"&srcserial="+srcserial+"&thedate="+thedate;
	$('#title-event').html(cityname+" 축제");	
	$('#modal-event').modal();
}
</script>
  




</td></tr>
</table>


<div id="modal-event" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title-event">축제</h4>
      </div>
      <div class="modal-body" style="">
		<iframe id="if_event" frameborder="0" width="100%"  height="500px" src="about:blank" ></iframe>
	
      </div>
    </div>
  </div>
</div>
<div id="modal-tripfriend" class="modal fade "  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title-tripfriend">동행추천</h4>
      </div>
      <div class="modal-body" style="">
		<iframe id="if_tripfriend" frameborder="0" width="100%"  height="400px" src="about:blank" ></iframe>
	
      </div>
    </div>
  </div>
</div>
<div id="modal-Wthr" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title-Wthr">예상기온</h4>
      </div>
      <div class="modal-body" style="">
		<iframe id="if_Wthr" frameborder="0" width="100%"  height="500px" src="about:blank" ></iframe>
	
      </div>
    </div>
  </div>
</div>

<div id="dialog-addcity" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button class="close" type="button" data-dismiss="modal">×</button>
			<h3>직접 도시 추가</h3>
		</div>
		<div class="modal-body">
			<div style="width:500px;height:430px;padding-left:20px;">
				<iframe id="if_addcity" frameborder="0"  scrolling="no" src="about:blank" width="450px" height="420px"></iframe>
			</div>
		</div>
	</div>
  </div>
</div>

<div id="modal-Guide" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title-Guide">GuideBook</h4>
      </div>
      <div class="modal-body" style="">
		<iframe id="if_guidebook" frameborder="0" width="100%"  height="500px" src="about:blank" ></iframe>
	
      </div>
    </div>
  </div>
</div>


<div id="modal-share" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
       <h4 class="modal-title">공유하기</h4>
      </div>
      <div class="modal-body" style="text-align:center">
	<iframe id="if_share" frameborder="0" width="100%"  height="500px" src="about:blank" ></iframe>	
      </div>
    </div>
  </div>
</div>
<script>
function share()
{
//	var turl="http://www.stubbyplanner.com/plan/planner_step1.asp?cityserials=";
	var turl="";
	for(i=0;i<citylist.length;i++)
	{
		se=citylist[i];
		if(i==citylist.length-1)
		{
			turl=turl+se;
			if(cities[se].spots)
			{
				for(j=0;j<cities[se].spots.length;j++)
				{
					st=cities[se].spots[j].serial;
					st=st.substring(9,14);
					if(j==0)
						turl=turl+"|";
					if(j==cities[se].spots.length-1)
						turl=turl+st;
					else
						turl=turl+st+"|";
				}
			}
		}
		else
		{
			turl=turl+se;
			if(cities[se].spots)
			{
				for(j=0;j<cities[se].spots.length;j++)
				{
					st=cities[se].spots[j].serial;
					st=st.substring(9,14);

					if(j==0)
						turl=turl+"|";

					if(j==cities[se].spots.length-1)
						turl=turl+st;
					else
						turl=turl+st+"|";
				}
			}
			turl=turl+",";

		}

	}

	document.getElementById("if_share").src="if_share.asp?cities="+turl;
	$('#modal-share').modal();
}
</script>

<div id="modal-loading" style="display:none;">
	<div id="modal-loading-bg" style="position:absolute;top:0px;left:0px;width:100%;height:680px;background:#696969;z-index:99999;opacity:0.8;filter:alpha(opacity=80);">
	</div>
	<div  id="modal-loading-content" style="position:absolute;top:30px;left:80px;z-index:999999;width:850px;text-align:center">
		
		<div style="width:300px;height:262px;float:left">
			<img src="/img_v9/logo_big.png">
		</div>
		<div style="width:519px;height:262px;float:left;background:url('/img_v9/balloon_big.png') no-repeat;">
			<div style="padding-left:60px;padding-right:15px;padding-top:10px;">
				<p style="padding-bottom:15px;font-size:18pt;font-family:'NanumGothic';font-weight:bold;color:#696969;line-height:180%">이 여행에 필요한 최저가/특가정보를
<br>
실시간으로 수집하고 있습니다</p>
				 <div class="progress progress-striped" style="width:400px;margin-left:20px;">
					  <div id="progress_val" class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:5%;">5%</div>
				 </div>

				
				<div style="text-align:center;background:#d3d3d3;padding-top:15px;padding-bottom:15px;font-size:13pt;font-family:'NanumGothic';color:#696969;line-height:150%">
					철도/항공 최저가, 호텔 특가정보<br/>
					<font style="font-size:11pt"><span id="txt_thedate"><b>5월 4일 기준(1개월뒤)</b></span></font>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>				
	</div>
</div>


<div id="modal-Intro" style="display:none">
	<div id="modal-Intro-bg" style="position:absolute;top:0px;left:0px;width:100%;height:680px;background:#696969;z-index:99999;opacity:0.8;filter:alpha(opacity=80);">
	</div>
	<div  id="modal-Intro-content" style="position:absolute;top:30px;left:30px;z-index:999999;width:1000px">
		<img id="img_guide" src="/img_v8/guide_ko1.png"  width="1000px"/>
		<map name="001"> 

			<area shape="rect" coords="227,337,325,373" href="javascript:onselectchanged('48.86110101269274,2.3421478271484375')">
			<area shape="rect" coords="352,337,450,373" href="javascript:onselectchanged('32.04504182822618,112.137451171875')">
			<area shape="rect" coords="475,337,573,373" href="javascript:onselectchanged('35.672149273279075,139.74918365478516')">
			<area shape="rect" coords="596,337,694,373" href="javascript:onselectchanged('14.859850400601036,101.337890625')">
			<area shape="rect" coords="719,337,817,373" href="javascript:onselectchanged('22.268764039073964,77.62890625')">
			<area shape="rect" coords="228,403,326,439" href="javascript:onselectchanged('49.26780455063753,-96.50390625')">
			<area shape="rect" coords="351,403,449,439" href="javascript:onselectchanged('-17.54376055418527,-70.60546875')">
			<area shape="rect" coords="475,403,573,439" href="javascript:onselectchanged('-27.293689224852393,144.4921875')">
			<area shape="rect" coords="595,403,693,439" href="javascript:onselectchanged('5.7908968128719565,21.97265625')">
			<area shape="rect" coords="720,403,818,439" href="javascript:onselectchanged('31.80289258670676,57.12890625')">

		</map>
		<map name="002">
			<area shape="rect" coords="0,0,1000,580" href="javascript:introNext();">
		</map>
		
		<div style="position:relative;top:-570px;height:45px;padding-right:30px;text-align:right">
			<a href="javascript:closeIntro();"><img src="/img_v8/planner_guide_close.png"></a>
		</div>
		<div style="position:relative;top:-350px;height:45px;">
			<span style="float:right;padding-right:10px;" id="span_btn_next" ><a href="javascript:introNext();"><img src="/img_v8/planner_guide_next.png"></a></span>
			<span style="padding-left:10px;"  id="span_btn_previous" ><a href="javascript:introPrev();"><img src="/img_v8/planner_guide_previous.png"></a></span>
			<div style="clear:both"></div>
		</div>
		<div style="position:relative;top:-150px;height:45px;">
			<p style="text-align:center">
				<a href="javascript:setPage(1);"><img id="ico_paging_1" src="/img_v8/planner_ico_paging_selected.png"></a>
				<a href="javascript:setPage(2);"><img id="ico_paging_2" src="/img_v8/planner_ico_paging_unselected.png"></a>
				<a href="javascript:setPage(3);"><img id="ico_paging_3" src="/img_v8/planner_ico_paging_unselected.png"></a>
				<a href="javascript:setPage(4);"><img id="ico_paging_4" src="/img_v8/planner_ico_paging_unselected.png"></a>
				<a href="javascript:setPage(5);"><img id="ico_paging_5" src="/img_v8/planner_ico_paging_unselected.png"></a>

			</p>
			<div style="clear:both"></div>
		</div>

		
	</div>
</div>
<script>
	function setPage(idx)
	{
		$("#ico_paging_1").attr("src","/img_v8/planner_ico_paging_unselected.png");
		$("#ico_paging_2").attr("src","/img_v8/planner_ico_paging_unselected.png");
		$("#ico_paging_3").attr("src","/img_v8/planner_ico_paging_unselected.png");
		$("#ico_paging_4").attr("src","/img_v8/planner_ico_paging_unselected.png");
		$("#ico_paging_5").attr("src","/img_v8/planner_ico_paging_unselected.png");

		$("#ico_paging_"+idx).attr("src","/img_v8/planner_ico_paging_selected.png");

		introCurPage=idx;
		$("#img_guide").attr("src","/img_v8/guide_ko"+idx+".png");


		$("#span_btn_previous").show();
		$("#span_btn_next").show();

		if(introCurPage==5)
			$("#span_btn_next").hide();
		if(introCurPage==1)
			$("#span_btn_previous").hide();
			
		if(introCurPage==5)
			$("#img_guide").attr("usemap","#001");
		else
			$("#img_guide").attr("usemap","");

	}
	function closeIntro()
	{
		$("#modal-Intro").hide();
	}
	function showIntro()
	{
		var newH=$(window).height();
		var newTop=(eval($(window).height())-580)/2;
		var newLeft=(eval($(window).width())-1000)/2;

		$("#modal-Intro-bg").css("height",newH);
		$("#modal-Intro-content").css("left",newLeft);
		$("#modal-Intro-content").css("top",newTop);

		$("#modal-Intro").show();		
	}
	function closeLoading()
	{
		$("#modal-loading").hide();
	}
	function showLoading(thedate)
	{
		var newH=$(window).height();
		var newTop=(eval($(window).height())-300)/2;
		var newLeft=(eval($(window).width())-820)/2;

		$("#modal-loading-bg").css("height",newH);
		$("#modal-loading-content").css("left",newLeft);
		$("#modal-loading-content").css("top",newTop);
		if(thedate)
			$("#txt_thedate").html("<b>"+thedate.substring(5,7)+"월 "+thedate.substring(8,10)+"일 기준</b>");

		$("#modal-loading").show();
		curProgress=5;
		interv=window.setInterval(xloading, 400);
	}

	var curProgress=5;
	var interv;
	function xloading()
	{
		curProgress=curProgress+5;
		$("#progress_val").css("width",curProgress+"%");
		$("#progress_val").html(curProgress+"%");
		if(curProgress>99)
		{
			curProgress=0;
			window.clearInterval(interv);
			closeLoading();
		}
	}


//	showIntro();
	

	var introCurPage=1;
	function introPrev()
	{

		if(introCurPage==1)
		{
			introCurPage=5;
		}
		else
		{
			introCurPage--;
			setPage(introCurPage);

		}

	}
	function introNext()
	{

		if(introCurPage==5)
		{
			closeIntro();
		}
		else
		{
			introCurPage++;
			setPage(introCurPage);

		}
	}
	setPage(1);
	function openSearchRoute()
	{

		$("#title-Guide").html("유럽 인기루트 검색");
		document.getElementById("if_guidebook").src="if_planner_searchroute.asp";
		$('#modal-Guide').modal();

	}

	function openGuideBook(s,t)
	{

		$("#title-Guide").html(t+" 가이드북");
		if(s.length==14)
			document.getElementById("if_guidebook").src="if_planner_guidebook_detail.asp?srcserial="+s;
		else
			document.getElementById("if_guidebook").src="if_planner_guidebook.asp?cityserial="+s;

		$('#modal-Guide').modal();

	}
	function openGuideBookExt(s,t,tbl)
	{

		$("#title-Guide").html(t+" 가이드북");
			document.getElementById("if_guidebook").src="if_planner_guidebook.asp?tbl="+tbl+"&cityserial="+s;

		$('#modal-Guide').modal();

	}
</script>

</center>

<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer" style="display:yes">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>



<!-----팝업 시작 ---->
<div id="modal-trsinfo" class="modal fade bs-example-modal-lg">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	 <h4 class="modal-title">도시 이동정보&nbsp;&nbsp;</h4> 
      </div>
      <div class="modal-body">
	 <iframe id="if_trs_info" frameborder="0" src="about:blank" width="100%" height="470px" ></iframe>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	function openTrsinfo(dep,des,thedate)
	{

		var thedate=$("#thedate").val();
		var surl="if_trsinfo.asp?depserial="+dep+"&desserial="+des+"&thedate="+thedate;
		
		document.getElementById("if_trs_info").src=surl;
		
		$('#modal-trsinfo').modal({
			keyboard: true,
			backdrop: 'static',
			show:true
		});

	}
</script>
<!-----팝업 끝---->
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>

</body>
</html>
    