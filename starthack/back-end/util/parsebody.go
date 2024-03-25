package util

import (
	"encoding/json"
	"fmt"
)

func CreateRequestBody(data interface{}) ([]byte, error) {
	jsonData, err := json.Marshal(data)
	if err != nil {
		return nil, fmt.Errorf("failed to marshal data to JSON: %v", err)
	}
	return jsonData, nil
}
