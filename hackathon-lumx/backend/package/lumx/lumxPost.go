package lumx

import (
	"bytes"
	inter "fanify/internal/user/interface"
	lInterface "fanify/package/lumx/interface"
	"strings"

	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

// Feito
func PostLumxWallet() (*lInterface.WalletResponse, error) {
	url := "https://protocol-sandbox.lumx.io/v2/wallets"
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	req, err := http.NewRequest("POST", url, nil)
	if err != nil {
		return nil, err
	}

	req.Header.Add("Authorization", "Bearer "+token)

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, err
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, err
	}

	switch res.StatusCode {
	case http.StatusCreated:
		var resp lInterface.WalletResponse
		err = json.Unmarshal(body, &resp)
		if err != nil {
			return nil, err
		}
		return &resp, nil
	case http.StatusInternalServerError:
		var errResp lInterface.ErrorResponse
		err = json.Unmarshal(body, &errResp)
		if err != nil {
			return nil, err
		}
		return nil, fmt.Errorf(errResp.Error)
	default:
		return nil, fmt.Errorf("unexpected status code: %d", res.StatusCode)
	}
}

// Feito
func CreateContractLumx(contract inter.ContractController) (*lInterface.GetContract, error) {
	newContract := lInterface.Contract{
		Name:        contract.Name,
		Symbol:      contract.Symbol,
		Description: *contract.Description,
		Type:        contract.ContractType,
	}
	url := "https://protocol-sandbox.lumx.io/v2/contracts"
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	payloadBytes, err := json.Marshal(newContract)
	if err != nil {
		return nil, fmt.Errorf("error marshalling contract: %v", err)
	}
	payload := bytes.NewReader(payloadBytes)

	req, err := http.NewRequest("POST", url, payload)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}

	req.Header.Add("Authorization", "Bearer "+token)
	req.Header.Add("Content-Type", "application/json")

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	switch res.StatusCode {
	case http.StatusCreated: // 201
		var resp lInterface.GetContract
		if err := json.Unmarshal(body, &resp); err != nil {
			return nil, fmt.Errorf("error unmarshalling response: %v", err)
		}
		return &resp, nil
	case http.StatusInternalServerError: // 500
		var errResp lInterface.ErrorResponse
		if err := json.Unmarshal(body, &errResp); err != nil {
			return nil, fmt.Errorf("error unmarshalling error response: %v", err)
		}
		return nil, fmt.Errorf("aPI Error: %s", errResp.Error)
	default:
		return nil, fmt.Errorf("unexpected status code: %d", res.StatusCode)
	}
}

// Feito
func CreateTransfer(transferDetails lInterface.TransferDetails) (*lInterface.TransactionResponse, error) {
	url := "https://protocol-sandbox.lumx.io/v2/transactions/transfers"
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	payloadBytes, err := json.Marshal(transferDetails)
	if err != nil {
		return nil, fmt.Errorf("error marshalling transfer details: %v", err)
	}
	payload := bytes.NewReader(payloadBytes)

	req, err := http.NewRequest("POST", url, payload)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}
	req.Header.Add("Authorization", "Bearer "+token)
	req.Header.Add("Content-Type", "application/json")

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	switch res.StatusCode {
	case http.StatusOK:
		var resp lInterface.TransactionResponse
		if err := json.Unmarshal(body, &resp); err != nil {
			return nil, fmt.Errorf("error unmarshalling response: %v", err)
		}
		return &resp, nil
	case http.StatusInternalServerError:
		var errResp lInterface.ErrorResponse
		if err := json.Unmarshal(body, &errResp); err != nil {
			return nil, fmt.Errorf("error unmarshalling error response: %v", err)
		}
		return nil, fmt.Errorf("api Error: %s", errResp.Error)
	default:
		return nil, fmt.Errorf("unexpected status code: %d", res.StatusCode)
	}
}

// Feito
func DeployContract(contractId string) (*lInterface.ContractDeploymentResponse, error) {
	url := fmt.Sprintf("https://protocol-sandbox.lumx.io/v2/contracts/%s/deploy", contractId)
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	req, err := http.NewRequest("POST", url, nil)
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

	switch res.StatusCode {
	case http.StatusOK:
		var resp lInterface.ContractDeploymentResponse
		if err := json.Unmarshal(body, &resp); err != nil {
			return nil, fmt.Errorf("error unmarshalling response: %v", err)
		}
		return &resp, nil
	case http.StatusForbidden, http.StatusConflict, http.StatusInternalServerError:
		var errResp lInterface.ErrorResponse
		if err := json.Unmarshal(body, &errResp); err != nil {
			return nil, fmt.Errorf("error unmarshalling error response: %v", err)
		}
		return nil, fmt.Errorf("API Error: %s", errResp.Error)
	default:
		return nil, fmt.Errorf("unexpected status code: %d", res.StatusCode)
	}
}

// Transferir do contrato para carteira
func MintTransaction(input lInterface.MintRequest) (*lInterface.MintResponse, error) {
	url := "https://protocol-sandbox.lumx.io/v2/transactions/mints"

	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	requestBody, err := json.Marshal(lInterface.MintRequest{
		ContractID: input.ContractID,
		WalletID:   input.WalletID,
		Quantity:   input.Quantity,
		URINumber:  input.URINumber,
	})
	if err != nil {
		return nil, fmt.Errorf("error encoding request body: %v", err)
	}

	req, err := http.NewRequest("POST", url, strings.NewReader(string(requestBody)))
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}

	req.Header.Add("Authorization", "Bearer "+token)
	req.Header.Add("Content-Type", "application/json")

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	switch res.StatusCode {
	case http.StatusOK:
		var resp lInterface.MintResponse
		if err := json.Unmarshal(body, &resp); err != nil {
			return nil, fmt.Errorf("error unmarshalling response: %v", err)
		}
		return &resp, nil
	case http.StatusForbidden, http.StatusConflict, http.StatusInternalServerError:
		var errResp lInterface.ErrorResponse
		if err := json.Unmarshal(body, &errResp); err != nil {
			return nil, fmt.Errorf("error unmarshalling error response: %v", err)
		}
		return nil, fmt.Errorf("API Error: %s", errResp.Error)
	default:
		return nil, fmt.Errorf("unexpected status code: %d", res.StatusCode)
	}
}

// Criar tokens para o contrato
func CreateTokenType(contractID string, tokenDetails lInterface.TokenTypeRequest) (*lInterface.TokenType, error) {
	url := fmt.Sprintf("https://protocol-sandbox.lumx.io/v2/contracts/%s/token-types", contractID)
	token := os.Getenv("API_TOKEN")
	if token == "" {
		return nil, fmt.Errorf("API token is not set in the environment variables")
	}

	// Serialize the tokenDetails into JSON
	payloadBytes, err := json.Marshal(tokenDetails)
	if err != nil {
		return nil, fmt.Errorf("error marshalling token details: %v", err)
	}
	payload := bytes.NewReader(payloadBytes)

	// Create and send the request
	req, err := http.NewRequest("POST", url, payload)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}
	req.Header.Add("Authorization", "Bearer "+token)
	req.Header.Add("Content-Type", "application/json")

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error performing request: %v", err)
	}
	defer res.Body.Close()

	// Read and handle the response
	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	switch res.StatusCode {
	case http.StatusCreated: // 201
		var resp lInterface.TokenType
		if err := json.Unmarshal(body, &resp); err != nil {
			return nil, fmt.Errorf("error unmarshalling response: %v", err)
		}
		return &resp, nil
	case http.StatusInternalServerError: // 500
		var errResp lInterface.ErrorResponse
		if err := json.Unmarshal(body, &errResp); err != nil {
			return nil, fmt.Errorf("error unmarshalling error response: %v", err)
		}
		return nil, fmt.Errorf("api Error: %s", errResp.Error)
	default:
		return nil, fmt.Errorf("unexpected status code: %d", res.StatusCode)
	}
}
