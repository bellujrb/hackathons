package db

import "time"

type User struct {
	ID        uint      `gorm:"column:id;primaryKey" json:"id"`
	Email     string    `gorm:"column:email;unique;not null" json:"email"`
	Password  string    `gorm:"column:password;not null" json:"password"`
	Wallet    string    `gorm:"column:wallet" json:"wallet"`
	WalletId  string    `gorm:"column:walletId" json:"walletId"`
	ProjectId string    `gorm:"column:projectId" json:"projectId"`
	Login     Login     `gorm:"foreignKey:LoginID" json:"login"`
	LoginID   uint      `gorm:"column:Login_idLogin;not null" json:"Login_idLogin"`
	CreateAt  time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt  time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type Login struct {
	ID       uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	Email    string    `gorm:"column:email" json:"email"`
	IsLogged bool      `gorm:"column:isLogged;not null" json:"isLogged"`
	CreateAt time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type Miner struct {
	ID                uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	WalletID          string    `gorm:"column:walletID;unique;not null" json:"walletID"`
	CurrentMinerDaily float64   `gorm:"column:mine;unique;not null" json:"mine"`
	CreateAt          time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt          time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type Company struct {
	ID       uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	Name     string    `gorm:"column:name;not null" json:"name"`
	CNPJ     string    `gorm:"column:cnpj;not null" json:"cnpj"`
	URI      uint64    `gorm:"column:uri;not null" json:"uri"`
	UrlImage *string   `gorm:"column:urlImage" json:"urlImage"`
	CreateAt time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type MktItems struct {
	ID       uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	Name     string    `gorm:"column:name" json:"name"`
	Price    float64   `gorm:"column:price;not null" json:"price"`
	Company  string    `gorm:"column:company;not null" json:"company"`
	URI      uint64    `gorm:"column:uri;not null" json:"uri"`
	UrlImage *string   `gorm:"column:urlImage" json:"urlImage"`
	CreateAt time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt time.Time `gorm:"column:update_at;not null" json:"update_at"`
}

type Token struct {
	ID         uint      `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	UriNumber  uint64    `gorm:"column:uriNumber" json:"uriNumber"`
	ContractID string    `gorm:"column:contract_id" json:"contract_id"`
	CreateAt   time.Time `gorm:"column:create_at;not null" json:"create_at"`
	UpdateAt   time.Time `gorm:"column:update_at;not null" json:"update_at"`
}
