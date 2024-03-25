package external

import "time"

type Location struct {
	OrgID             string            `json:"org_id"`
	Name              string            `json:"name"`
	TimeZone          string            `json:"time_zone"`
	Country           string            `json:"country"`
	State             string            `json:"state"`
	City              string            `json:"city"`
	Address           string            `json:"address"`
	ZipCode           string            `json:"zip_code"`
	PlaceID           string            `json:"place_id"`
	JSONExtendedAttrs map[string]string `json:"json_extended_attributes"`
	ReferencePoint    ReferencePoint    `json:"reference_point"`
}

type ReferencePoint struct {
	Type        string    `json:"type"`
	Coordinates []float64 `json:"coordinates"`
}

type Company struct {
	Name              string            `json:"name"`
	Address           string            `json:"address"`
	City              string            `json:"city"`
	State             string            `json:"state"`
	Country           string            `json:"country"`
	ZipCode           string            `json:"zip_code"`
	PlaceID           string            `json:"place_id"`
	Currency          string            `json:"currency"`
	UnitSystem        string            `json:"unit_system"`
	Phone             string            `json:"phone"`
	JSONExtendedAttrs map[string]string `json:"json_extended_attributes"`
}

type GeoJSON struct {
	Type        string        `json:"type"`
	Coordinates [][][]float64 `json:"coordinates"`
}

type FieldModel struct {
	Name              string            `json:"name"`
	PropertyID        string            `json:"property_id"`
	ParentRegionID    string            `json:"parent_region_id"`
	JSONExtendedAttrs map[string]string `json:"json_extended_attributes"`
	Geometry          GeoJSON           `json:"geometry"`
	DeclaredArea      float64           `json:"declared_area"`
	EventDate         time.Time         `json:"event_date"`
}
