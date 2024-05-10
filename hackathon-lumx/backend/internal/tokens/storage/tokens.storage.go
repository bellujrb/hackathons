package storage

import (
	"fanify/db"
	inter "fanify/internal/tokens/interface"
	"time"

	"gorm.io/gorm"
)

func CreateTokenDb(q *gorm.DB, input inter.SaveToken) (*db.Token, error) {
	newUser := db.Token{
		UriNumber:  input.UriNumber,
		ContractID: input.ContractID,
		CreateAt:   time.Now(),
	}
	if err := q.Create(&newUser).Error; err != nil {
		return nil, err
	}

	return &newUser, nil
}
