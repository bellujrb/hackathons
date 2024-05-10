package storage

import (
	"fanify/db"
	inter "fanify/internal/user/interface"
	"time"

	"gorm.io/gorm"
)

func ConsultUser(q *gorm.DB, email string) (*db.User, error) {
	var user db.User
	if err := q.Where("email = ?", email).First(&user).Error; err != nil {
		return nil, err
	}
	var login db.Login
	if err := q.Where("email = ?", email).First(&login).Error; err != nil {
		return nil, err
	}
	user.Login = login
	return &user, nil
}

func CreateUser(q *gorm.DB, input inter.UserControllerInputDb) (*db.User, error) {
	newUser := db.User{
		Email:     input.Email,
		Password:  input.Password,
		Wallet:    input.Wallet,
		WalletId:  input.WalletId,
		ProjectId: input.ProjectId,
		LoginID:   input.LoginId,
		CreateAt:  time.Now(),
	}
	if err := q.Create(&newUser).Error; err != nil {
		return nil, err
	}
	return &newUser, nil
}

func CreateLogin(q *gorm.DB, email string, status bool) (*db.Login, error) {
	CreateAt := time.Now()
	UpdateAt := time.Now()
	newLogin := &db.Login{
		Email:    email,
		IsLogged: status,
		CreateAt: CreateAt,
		UpdateAt: UpdateAt,
	}
	if err := q.Create(newLogin).Error; err != nil {
		return nil, err
	}
	return newLogin, nil
}

func InputCurrentMiner(q *gorm.DB, wallet string, mined int) (*db.Miner, error) {
	input := &db.Miner{
		WalletID:          wallet,
		CurrentMinerDaily: float64(mined),
	}
	if err := q.Create(input).Error; err != nil {
		return nil, err
	}
	return input, nil
}
