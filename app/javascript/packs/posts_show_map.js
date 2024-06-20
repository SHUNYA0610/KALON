// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.MAP_API_KEY
});

const showMap = document.getElementById('map')
const mapData = JSON.parse(showMap.dataset.json)
let lat = 35.681236
let lng = 139.767125
// ライブラリの読み込み
let map;

if (mapData.latitude > 0 && mapData.longitude > 0) {
  lat = mapData.latitude
  lng = mapData.longitude
}

async function initMap() {

  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
  // 地図の中心と倍率は公式から変更しています。
  map = new Map(document.getElementById("map"), {
    center: { lat: lat, lng: lng }, 
    zoom: 15,
    mapId: 'DEMO_MAP_ID'
  });
  const marker = new google.maps.marker.AdvancedMarkerElement({
    position: { lat: lat, lng: lng },
    map: map
  })
  const infoWindow = new google.maps.InfoWindow({
    content: `
      <p>ショップネーム: ${mapData.shop}<br>住所: ${mapData.address}</p>
    `
  })
  marker.addListener('click', () => {
    infoWindow.open(map, marker);
  })
}

initMap()