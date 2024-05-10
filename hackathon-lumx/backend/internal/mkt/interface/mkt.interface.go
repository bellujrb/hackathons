package inter

import "time"

type CreateItemController struct {
	Name     string  `json:"name"`
	Price    float64 `json:"price"`
	Company  string  `json:"company"`
	URI      uint64  `json:"URI"`
	UrlImage *string `json:"urlImage"`
}

type CreateCompanyController struct {
	Name     string  `json:"name"`
	CNPJ     string  `json:"cnpj"`
	URI      uint64  `json:"URI"`
	UrlImage *string `json:"urlImage"`
}

type CreateCompanyOutput struct {
	ID        uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	Name      string    `gorm:"column:name;not null" json:"name"`
	CNPJ      string    `gorm:"column:cnpj;not null" json:"cnpj"`
	TokenName string    `gorm:"column:tokenName;not null" json:"tokenName"`
	UrlImage  *string   `gorm:"column:urlImage" json:"urlImage"`
	CreateAt  time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt  time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type MktItemOutput struct {
	ID       uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	Name     string    `gorm:"column:name" json:"name"`
	Price    float64   `gorm:"column:price;not null" json:"price"`
	Company  string    `gorm:"column:company;not null" json:"company"`
	URI      uint64    `gorm:"column:uri;not null" json:"uri"`
	UrlImage *string   `gorm:"column:urlImage" json:"urlImage"`
	CreateAt time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type MktItemsOutput struct {
	items []MktItemOutput
}
