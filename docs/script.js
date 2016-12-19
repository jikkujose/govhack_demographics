google.charts.load('upcoming', {'packages':['geochart']});
google.charts.setOnLoadCallback(drawRegionsMap);

function drawRegionsMap() {
  var data = google.visualization.arrayToDataTable(country_data);

  var options = {
    colorAxis: {colors: ['#ACD6FF', '#133D6E']}
  };
  var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
  chart.draw(data, options);
}

function writeIntoClass(className, message) {
  document.getElementsByClassName(className)[0].innerHTML = message;
}

function updateMeta() {
  console.log(meta);
  var message = '<b>' +
    meta.total +
    '</b> participants from <b>' +
    meta.countries +
    '</b> countries. Updated on <b>' +
    meta.updated_at +
    '</b>'
  writeIntoClass('meta', message);
}

updateMeta();
