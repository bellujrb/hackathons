package inter

import "time"

type TokenCreateInput struct {
	Traits      *map[string]string `json:"traits,omitempty"`
	Name        string             `json:"name"`
	Description string             `json:"description"`
	MaxSupply   int                `json:"maxSupply"`
	ImageURL    *string            `json:"imageUrl"`
	ContractId  string             `json:"contractId"`
}

type TokenCreateOutput struct {
	ID            string            `json:"id"`
	URINumber     int               `json:"uriNumber"`
	ContractID    string            `json:"contractId"`
	Name          string            `json:"name"`
	Description   string            `json:"description"`
	MaxSupply     int               `json:"maxSupply"`
	CurrentSupply int               `json:"currentSupply"`
	Traits        map[string]string `json:"traits,omitempty"`
	ImageURL      string            `json:"imageUrl"`
	MetadataURL   string            `json:"metadataUrl"`
	CreatedAt     string            `json:"createdAt"`
	UpdatedAt     string            `json:"updatedAt"`
}

type GetToken struct {
	ContractID string `json:"contractId"`
	UriNumber  string `json:"uriNumber"`
}

type AllTokensOutput struct {
	Tokens []TokenCreateOutput `json:"tokens"`
}

type Transaction struct {
	ContractID string `json:"contractId"`
	From       string `json:"from"`
	To         string `json:"to"`
	Quantity   int    `json:"quantity"`
}

type TransferOutput struct {
	ID              string   `json:"id"`
	WalletID        string   `json:"walletId"`
	Status          string   `json:"status"`
	TransactionHash string   `json:"transactionHash"`
	Result          struct{} `json:"result"`
	Request         struct {
		ContractID string `json:"contractId"`
		Quantity   int    `json:"quantity"`
		From       string `json:"from"`
		To         string `json:"to"`
	} `json:"request"`
	Type        string `json:"type"`
	CreatedAt   string `json:"createdAt"`
	UpdatedAt   string `json:"updatedAt"`
	CompletedAt string `json:"completedAt"`
}

type Trade struct {
	Transaction1 Transaction `json:"transaction1"`
	Transaction2 Transaction `json:"transaction2"`
}

type TradeService struct {
	trades map[string]Trade
}

type GainTokenController struct {
	WalletID string `json:"walletId"`
}

type Gimmetoken struct {
	ContractID string `json:"contractID"`
	WalletID   string `json:"walletID"`
	Quantity   int    `json:"quantity"`
	URINumber  int    `json:"uriNumber"`
}

type TransactionRes struct {
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

type PriceInfo struct {
	Price        string
	PriceConvert string
	Token        string
	TokenConvert string
	Date         time.Time
}

type SaveToken struct {
	UriNumber  uint64 `json:"uriNumber"`
	ContractID string `json:"contract_id"`
}
