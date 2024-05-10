package storage

import (
	"fanify/db"
	inter "fanify/internal/mkt/interface"
	"time"

	"gorm.io/gorm"
)

func ConsultCompany(q *gorm.DB, name string) (*db.Company, error) {
	var company db.Company
	if err := q.Where("name = ?", name).First(&company).Error; err != nil {
		return nil, err
	}
	return &company, nil
}
func ConsultCnpj(q *gorm.DB, cnpj string) (*db.Company, error) {
	var company db.Company
	if err := q.Where("cnpj = ?", cnpj).First(&company).Error; err != nil {
		return nil, err
	}
	return &company, nil
}
func ConsultItems(q *gorm.DB, name string) ([]db.MktItems, error) {
	var companies []db.MktItems
	if err := q.Where("name LIKE ?", "%"+name+"%").Find(&companies).Error; err != nil {
		return nil, err
	}
	return companies, nil
}
func ConsultItem(q *gorm.DB, name string, company string) (*db.MktItems, error) {
	var mkt db.MktItems
	if err := q.Where("name = ? AND company = ?", name, company).First(&mkt).Error; err != nil {
		return nil, err
	}
	return &mkt, nil
}

func ConsultAllCompany(q *gorm.DB) ([]db.Company, error) {
	var companies []db.Company
	if err := q.Find(&companies).Error; err != nil {
		return nil, err
	}
	return companies, nil
}
func ConsultToken(q *gorm.DB, uri uint64) (*db.Token, error) {
	var token db.Token
	if err := q.Where("urinumber = ?", uri).First(&token).Error; err != nil {
		return nil, err
	}
	return &token, nil
}

func CreateCompany(q *gorm.DB, input inter.CreateCompanyController) (*db.Company, error) {
	newCompany := db.Company{
		Name:     input.Name,
		CNPJ:     input.CNPJ,
		URI:      input.URI,
		UrlImage: input.UrlImage,
		CreateAt: time.Now(),
	}
	if err := q.Create(&newCompany).Error; err != nil {
		return nil, err
	}

	return &newCompany, nil
}
func CreateItem(q *gorm.DB, input inter.CreateItemController) (*db.MktItems, error) {
	newUser := db.MktItems{
		Name:     input.Name,
		Price:    input.Price,
		Company:  input.Company,
		URI:      input.URI,
		UrlImage: input.UrlImage,
		CreateAt: time.Now(),
	}
	if err := q.Create(&newUser).Error; err != nil {
		return nil, err
	}

	return &newUser, nil
}
