import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["mapdiv", "card"]

  connect() {
    mapboxgl.accessToken = this.mapdivTarget.dataset.mapApiKeyValue;
    this.mapdivTarget.map = new mapboxgl.Map({
      container: this.mapdivTarget,
      style: 'mapbox://styles/mapbox/dark-v11',
      zoom: 1
    });
    this.addMarkersToMap();
    this.#fitMapToMarkers();
  }

  addMarkersToMap() {
    const markers = JSON.parse(this.mapdivTarget.dataset.mapMarkersValue)
    markers.forEach((marker, index) => {
      const markerElement = document.createElement('div');
      markerElement.className = 'custom-marker';
      markerElement.innerHTML = '<i class="fa-solid fa-rocket" style="color:#00FF7F; font-size: 24px">'
      const mapMarker = new mapboxgl.Marker(markerElement)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.mapdivTarget.map);

      mapMarker.getElement().setAttribute('data-marker-index', index);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    const markers = JSON.parse(this.mapdivTarget.dataset.mapMarkersValue)
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.mapdivTarget.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  focus(event) {
    const card = event.currentTarget;
    const lat = card.dataset.mapLatValue;
    const lon = card.dataset.mapLonValue;
    this.mapdivTarget.map.flyTo({
      center: [lon, lat],
      zoom: 3,
    });
  }
}
