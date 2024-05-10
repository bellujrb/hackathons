package lInterface

type Contract struct {
	Name        string `json:"name"`
	Symbol      string `json:"symbol"`
	Description string `json:"description"`
	Type        string `json:"type"`
}

type InputContract struct {
	Name         string  `json:"name"`
	Symbol       string  `json:"symbol"`
	Description  *string `json:"description"`
	ContractType string  `json:"contractType"`
}

type WalletResponse struct {
	ID        string `json:"id"`
	Address   string `json:"address"`
	ProjectID string `json:"projectId"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}

type TokenTypeResponse struct {
	Name        string                 `json:"name"`
	Description string                 `json:"description"`
	MaxSupply   int                    `json:"maxSupply"`
	Traits      map[string]interface{} `json:"traits"`
	ImageUrl    string                 `json:"imageUrl"`
}

type TransferDetails struct {
	ContractId string `json:"contractId"`
	From       string `json:"from"`
	To         string `json:"to"`
	Quantity   int    `json:"quantity"`
}

type TransferResponse struct {
	Status  string `json:"status"`
	Message string `json:"message"`
}

type ErrorResponse struct {
	Error string `json:"error"`
}

type GetContract struct {
	ID             string `json:"id"`
	Type           string `json:"type"`
	Address        string `json:"address"`
	Name           string `json:"name"`
	Symbol         string `json:"symbol"`
	Description    string `json:"description"`
	BlockchainName string `json:"blockchainName"`
	BlockscanUrl   string `json:"blockscanUrl"`
	CreatedAt      string `json:"createdAt"`
	UpdatedAt      string `json:"updatedAt"`
	DeployedAt     string `json:"deployedAt"`
}

type GetContractsResponse struct {
	Contracts []GetContract `json:"contracts"`
}

type TokenType struct {
	ID            string            `json:"id"`
	UriNumber     int               `json:"uriNumber"`
	ContractID    string            `json:"contractId"`
	Name          string            `json:"name"`
	Description   string            `json:"description"`
	MaxSupply     int               `json:"maxSupply"`
	CurrentSupply int               `json:"currentSupply"`
	Traits        map[string]string `json:"traits"`
	ImageUrl      string            `json:"imageUrl"`
	MetadataUrl   string            `json:"metadataUrl"`
	CreatedAt     string            `json:"createdAt"`
	UpdatedAt     string            `json:"updatedAt"`
}

type ContractDeploymentResponse struct {
	ID             string `json:"id"`
	Type           string `json:"type"`
	Address        string `json:"address"`
	Name           string `json:"name"`
	Symbol         string `json:"symbol"`
	Description    string `json:"description"`
	BlockchainName string `json:"blockchainName"`
	BlockscanUrl   string `json:"blockscanUrl"`
	CreatedAt      string `json:"createdAt"`
	UpdatedAt      string `json:"updatedAt"`
	DeployedAt     string `json:"deployedAt"`
}

type TokenTypes []TokenType

type MintRequest struct {
	ContractID string `json:"contractId"`
	WalletID   string `json:"walletId"`
	Quantity   int    `json:"quantity"`
	URINumber  int    `json:"uriNumber"`
}

type reqs struct {
	ContractID string `json:"contractId"`
	Quantity   int    `json:"quantity"`
	From       string `json:"from"`
	To         string `json:"to"`
}

type TransactionResponse struct {
	ID              string                 `json:"id"`
	WalletID        string                 `json:"walletId"`
	Status          string                 `json:"status"`
	TransactionHash string                 `json:"transactionHash"`
	Result          map[string]interface{} `json:"result"`
	Request         reqs                   `json:"request"`
	Type            string                 `json:"type"`
	CreatedAt       string                 `json:"createdAt"`
	UpdatedAt       string                 `json:"updatedAt"`
	CompletedAt     string                 `json:"completedAt"`
}

type MintResponse struct {
	ID              string            `json:"id"`
	WalletID        string            `json:"walletId"`
	Status          string            `json:"status"`
	TransactionHash string            `json:"transactionHash"`
	Result          map[string]string `json:"result"`
	Request         struct {
		ContractID string `json:"contractId"`
		Quantity   int    `json:"quantity"`
	} `json:"request"`
	Type        string `json:"type"`
	CreatedAt   string `json:"createdAt"`
	UpdatedAt   string `json:"updatedAt"`
	CompletedAt string `json:"completedAt"`
}

type TokenTypeRequest struct {
	Traits      map[string]string `json:"traits,omitempty"`
	MaxSupply   int               `json:"maxSupply"`
	Name        string            `json:"name"`
	Description string            `json:"description"`
	ImageURL    *string           `json:"imageUrl"`
}
