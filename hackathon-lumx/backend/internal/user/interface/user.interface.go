package inter

type UserController struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}
type UserControllerInputDb struct {
	Email     string `json:"email"`
	Password  string `json:"password"`
	Wallet    string `json:"wallet"`
	WalletId  string `json:"walletId"`
	ProjectId string `json:"projectId"`
	LoginId   uint   `json:"loginId"`
}

type UserOutputController struct {
	ID        string `json:"id"`
	Address   string `json:"address"`
	ProjectID string `json:"projectId"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}

type ContractController struct {
	Name         string  `json:"name"`
	Symbol       string  `json:"symbol"`
	Description  *string `json:"description"`
	ContractType string  `json:"contractType"`
}

type DeployController struct {
	ContractId string `json:"contractId"`
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
