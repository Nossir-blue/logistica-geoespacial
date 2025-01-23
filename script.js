// Inicialize o mapa centrado em Luanda
const map = L.map('map').setView([-8.839, 13.234], 12);

// Adicione uma camada de mapa (OpenStreetMap)
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

// Adicione armazéns (GeoJSON)
const armazens = [
    {
        "type": "Feature",
        "properties": { "nome": "Armazém 1" },
        "geometry": { "type": "Point", "coordinates": [13.2343, -8.839] }
    },
    {
        "type": "Feature",
        "properties": { "nome": "Armazém 2" },
        "geometry": { "type": "Point", "coordinates": [13.2654, -8.845] }
    },
    {
        "type": "Feature",
        "properties": { "nome": "Armazém 3" },
        "geometry": { "type": "Point", "coordinates": [13.312, -8.895] }
    }
];

L.geoJSON(armazens, {
    onEachFeature: function (feature, layer) {
        layer.bindPopup("Nome: " + feature.properties.nome);
    }
}).addTo(map);

// Adicione rotas (GeoJSON)
const rota = {
    "type": "Feature",
    "properties": { "descricao": "Rota 1" },
    "geometry": {
        "type": "LineString",
        "coordinates": [
            [13.2343, -8.839],
            [13.2654, -8.845],
            [13.312, -8.895]
        ]
    }
};

L.geoJSON(rota, {
    style: { color: 'blue', weight: 4 }
}).addTo(map);