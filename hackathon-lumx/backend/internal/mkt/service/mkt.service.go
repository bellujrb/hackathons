package service

import (
	"fanify/db"
	inter "fanify/internal/mkt/interface"
	"fanify/internal/mkt/storage"

	"net/http"

	"github.com/gin-gonic/gin"
)

func CreateItem(c *gin.Context, input inter.CreateItemController) {
	if input.Company == "" {
		c.Set("Error", "Insert a company, its require")
		c.Status(http.StatusNotAcceptable)
		return
	}
	company, err := storage.ConsultCompany(db.Repo, input.Company)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	if company == nil {
		c.Set("Error", "Company not found")
		c.Status(http.StatusNotFound)
	}
	_, err = storage.ConsultToken(db.Repo, input.URI)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	res, err := storage.CreateItem(db.Repo, input)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func CreateCompany(c *gin.Context, input inter.CreateCompanyController) {
	if input.CNPJ == "" {
		c.Set("Error", "Insert a CNPJ, its require")
		c.Status(http.StatusNotAcceptable)
		return
	}
	res, err := storage.CreateCompany(db.Repo, input)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func GetOneItem(c *gin.Context, company string, item string) {
	res, err := storage.ConsultItem(db.Repo, item, company)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func GetCompany(c *gin.Context, company string) {
	res, err := storage.ConsultCompany(db.Repo, company)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func GetAllCompany(c *gin.Context) {
	res, err := storage.ConsultAllCompany(db.Repo)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func GetAllItem(c *gin.Context, company string) {
	res, err := storage.ConsultItems(db.Repo, company)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}
