package lumx

import (
	lInterface "fanify/package/lumx/interface"

	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

// Feito
func FetchContractDetails(contractId string) (*lInterface.GetContract, error) {
	url := fmt.Sprintf("https://protocol-sandbox.lumx.io/v2/contracts/%s", contractId)
	token := os.Getenv("API_TOKEN") // Ensure you have this environment variable set up
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}
	req.Header.Add("Authorization", "Bearer "+token)

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	var contract lInterface.GetContract
	if err := json.Unmarshal(body, &contract); err != nil {
		return nil, fmt.Errorf("error unmarshalling response: %v", err)
	}

	return &contract, nil
}

// Feito
func FetchContracts() (*lInterface.GetContractsResponse, error) {
	url := "https://protocol-sandbox.lumx.io/v2/contracts"
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}
	req.Header.Add("Authorization", "Bearer "+token)

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	var response lInterface.GetContractsResponse
	if err := json.Unmarshal(body, &response); err != nil {
		return nil, fmt.Errorf("error unmarshalling response: %v", err)
	}

	return &response, nil
}

// Pegar o token
func FetchTokenType(contractId string, uriNumber int) (*lInterface.TokenType, error) {
	baseUrl := "https://protocol-sandbox.lumx.io/v2/contracts/%s/token-types/%d"
	url := fmt.Sprintf(baseUrl, contractId, uriNumber)

	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}
	req.Header.Add("Authorization", "Bearer "+token)

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	var tokenType lInterface.TokenType
	if err := json.Unmarshal(body, &tokenType); err != nil {
		return nil, fmt.Errorf("error unmarshalling response: %v", err)
	}

	return &tokenType, nil
}

// pegar todos os tokens
func FetchTokenTypes(contractId string) (lInterface.TokenTypes, error) {
	url := fmt.Sprintf("https://protocol-sandbox.lumx.io/v2/contracts/%s/token-types", contractId)
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("api token is not set in the environment variables")
	}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}
	req.Header.Add("Authorization", "Bearer "+token)

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	var tokenTypes lInterface.TokenTypes
	if err := json.Unmarshal(body, &tokenTypes); err != nil {
		return nil, fmt.Errorf("error unmarshalling response: %v", err)
	}

	return tokenTypes, nil
}
