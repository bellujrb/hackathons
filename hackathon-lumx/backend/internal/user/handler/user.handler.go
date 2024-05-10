package user

import (
	inter "fanify/internal/user/interface"
	service "fanify/internal/user/service"
	errors "fanify/middleware/interfaces/errors"

	"github.com/gin-gonic/gin"
)

// @Summary Create user
// @Description Create a new user in db
// @Tags User
// @Accept json
// @Produce json
// @Param request body inter.UserController true "Data for make a new user"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /create-user [post]
func CreateUser(c *gin.Context) {
	var user inter.UserController
	if err := c.BindJSON(&user); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.CreateUser(c, user)
}

// @Summary Create Contract
// @Description Create a new contract
// @Tags Contract
// @Accept json
// @Produce json
// @Param request body inter.ContractController true "Data for make a new contract"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New Contract Created successfully"
// @Failure 500 {object} errors.InternalServerError "Error for make a new contract"
// @Router /api/create-contract [post]
func CreateContract(c *gin.Context) {
	var contract inter.ContractController
	if err := c.BindJSON(&contract); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.CreateContract(c, contract)
}

// @Summary Deploy new contract
// @Description Deploy new contract in the blockchain
// @Tags Contract
// @Accept json
// @Produce json
// @Param request body inter.DeployController true "ContractId for deploy a new contract"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.ContractDeploymentResponse "Deploy its a sucessfully"
// @Failure 500 {object} errors.InternalServerError "Unable to make deploy"
// @Router /api/deploy-contract [post]
func DeployContract(c *gin.Context) {
	var deploy inter.DeployController
	if err := c.BindJSON(&deploy); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.DeployContract(c, deploy)
}

// @Summary Pull a contract
// @Description Pull a contract from blockchain
// @Tags Contract
// @Accept json
// @Produce json
// @Param ContractId header string true  "contract Id"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/contract [get]
func PullContract(c *gin.Context) {
	ContractId := c.GetHeader("Contractid")
	service.PullContract(c, ContractId)
}

// @Summary Get All contracts
// @Description Get All contracts
// @Tags Contract
// @Accept json
// @Produce json
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/all-contract [get]
func PullAllContract(c *gin.Context) {
	service.PullAllContract(c)
}

// @Summary Get user
// @Description pull user and wallet for db
// @Tags User
// @Accept json
// @Produce json
// @Param Email header string true  "E-mail from user"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/user [get]
func PullUser(c *gin.Context) {
	Email := c.GetHeader("Email")
	service.PullUser(c, Email)
}

// @Summary Loggout User
// @Description pull user and wallet for db
// @Tags User
// @Accept json
// @Produce json
// @Param Email header string true  "E-mail from user"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/loggout [put]
func LoggoutUser(c *gin.Context) {
	Email := c.GetHeader("Email")
	service.UserLogins(c, Email, false)
}
