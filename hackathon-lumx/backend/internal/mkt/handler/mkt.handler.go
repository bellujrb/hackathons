package mkt

import (
	inter "fanify/internal/mkt/interface"
	service "fanify/internal/mkt/service"
	errors "fanify/middleware/interfaces/errors"

	"github.com/gin-gonic/gin"
)

// @Summary Create item
// @Description Create a new item in db
// @Tags Mkt
// @Accept json
// @Produce json
// @Param request body inter.CreateItemController true "Data for make a new item"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.MktItemsOutput "New item Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /create-item [post]
func CreateItem(c *gin.Context) {
	var input inter.CreateItemController
	if err := c.BindJSON(&input); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.CreateItem(c, input)
}

// @Summary Create Company
// @Description Create a new Company
// @Tags Mkt
// @Accept json
// @Produce json
// @Param request body inter.CreateCompanyController true "Data for make a new Company"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New Company Created successfully"
// @Failure 500 {object} errors.InternalServerError "Error for make a new Company"
// @Router /api/create-company [post]
func CreateCompany(c *gin.Context) {
	var company inter.CreateCompanyController
	if err := c.BindJSON(&company); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.CreateCompany(c, company)
}

// @Summary Get All Items
// @Description Get all items for one company
// @Tags Mkt
// @Accept json
// @Produce json
// @Param Company header string true "Company name"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.MktItemsOutput "All items for one company"
// @Failure 500 {object} errors.InternalServerError "Unable to make deploy"
// @Router /api/all-items [get]
func GetAllItems(c *gin.Context) {
	Company := c.GetHeader("Company")
	service.GetAllItem(c, Company)
}

// @Summary Get one item
// @Description Deploy new contract in the blockchain
// @Tags Mkt
// @Accept json
// @Produce json
// @Param Company header string true "Company name"
// @Param ItemName header string true "Item name"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.MktItemOutput "One item for a company"
// @Failure 500 {object} errors.InternalServerError "Unable to make deploy"
// @Router /api/one-item [get]
func GetOneItems(c *gin.Context) {
	Company := c.GetHeader("Company")
	ItemName := c.GetHeader("ItemName")
	service.GetOneItem(c, Company, ItemName)
}

// @Summary Get one company
// @Description Deploy new contract in the blockchain
// @Tags Mkt
// @Accept json
// @Produce json
// @Param Company header string true "Company name"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.MktItemOutput "One item for a company"
// @Failure 500 {object} errors.InternalServerError "Unable to make deploy"
// @Router /api/one-company [get]
func GetOneCompany(c *gin.Context) {
	Company := c.GetHeader("Company")
	service.GetCompany(c, Company)
}

// @Summary Get all company
// @Description Get all company register in db
// @Tags Mkt
// @Accept json
// @Produce json
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.MktItemOutput "One item for a company"
// @Failure 500 {object} errors.InternalServerError "Unable to make deploy"
// @Router /api/all-company [get]
func GetAllCompany(c *gin.Context) {
	service.GetAllCompany(c)
}
