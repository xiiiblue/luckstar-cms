<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Luck-Star</title>
    <script src="http://ditu.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAUhUslU5GwfiSQCi6vJOcJxSjzaYQOvZ7uvQDC9BqV_FaYQ292xQ3Os91WMFR8amzxOR7cHX6efZDDA"
      type="text/javascript"></script>
	<script type="text/javascript">
	function load() {
		if (GBrowserIsCompatible()) {
			var map = new GMap2(document.getElementById("map"));
			map.addControl(new GSmallMapControl());
			map.addControl(new GMapTypeControl());
			map.setCenter(new GLatLng(36.66994210432943, 117.05616116523742),14);
			// 在给定的点上创建带编号的标注
			function createMarker(point) {
				var marker = new GMarker(point);
				GEvent.addListener(marker, "click", function() {
					marker.openInfoWindowHtml("济南搜索在线广告有限公司");
				});
				return marker;
			}
			// 添加标注
			var point = new GLatLng(36.66994210432943, 117.05616116523742);
			map.addOverlay(createMarker(point));
		}
	}
	</script>
	</head>
<body onload="load()" onunload="GUnload()">

<div id="map" style="width: 600px; height: 400px"></div>
	
</body>
</html>