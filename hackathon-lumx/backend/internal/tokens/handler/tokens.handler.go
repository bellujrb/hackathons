package tokens

import (
	inter "fanify/internal/tokens/interface"
	"fanify/internal/tokens/service"
	errors "fanify/middleware/interfaces/errors"

	"github.com/gin-gonic/gin"
)

// @Summary Make Tokens
// @Description Create a new user in db
// @Tags Token
// @Accept json
// @Produce json
// @Param request body inter.TokenCreateInput true "Data for make a new token"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.TokenCreateOutput "New Token Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to created a new token"
// @Router /api/create-token [post]
func CreateToken(c *gin.Context) {
	var input inter.TokenCreateInput
	if err := c.BindJSON(&input); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.CreateToken(c, input)
}

// @Summary Make a transfer
// @Description Create a transfer from a user to a user
// @Tags Token
// @Accept json
// @Produce json
// @Param request body inter.Transaction true "Data for make a new user"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.TransferOutput "Transfer is by sucessfull"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/make-transfer [post]
func MakeTransfer(c *gin.Context) {
	var input inter.Transaction
	if err := c.BindJSON(&input); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.MakeTransfer(c, input)
}

// @Summary Get specify token
// @Description Create a new user in db
// @Tags Token
// @Accept json
// @Produce json
// @Param ContractId header string true "E-mail from user"
// @Param UriToken header string true "Its a uri content in tokens"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/get-token [get]
func GetToken(c *gin.Context) {
	ContractId := c.GetHeader("ContractId")
	UriToken := c.GetHeader("UriToken")
	service.GetToken(c, ContractId, UriToken)
}

// @Summary Get all Tokens
// @Description Create a new user in db
// @Tags Token
// @Accept json
// @Produce json
// @Param ContractId header string true "contract id"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.AllTokensOutput "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/all-token [get]
func GetAllToken(c *gin.Context) {
	ContractId := c.GetHeader("ContractId")
	service.GetAllToken(c, ContractId)
}

// @Summary Make a Trade
// @Description Create a transfer from a user to a new token
// @Tags Token
// @Accept json
// @Produce json
// @Param request body inter.Trade true "Data for make a new user"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.UserOutputController "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/make-trade [post]
func MakeTrade(c *gin.Context) {
	var input inter.Trade
	if err := c.BindJSON(&input); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.MakeTrade(c, input)
}

// @Summary Gain token
// @Description This would be implemented as the application remains open. RoadMap is mocked, and this randomly generates a number, and gives an FDZ that can be 0.000001 or 1
// @Tags Token
// @Accept json
// @Produce json
// @Param request body inter.Gimmetoken true "Data for gain tokens :)"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.TransactionRes "Your tokens is be send for your account"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/gain-tokens [post]
func GainToken(c *gin.Context) {
	var input inter.Gimmetoken
	if err := c.BindJSON(&input); err != nil {
		c.Set("Response", "Invalid parameters, need a JSON with email")
		c.Status(errors.StatusNotAcceptable)
		return
	}
	service.GainTokens(c, input)
}

// @Summary Converter tokens
// @Description Converter tokens for money or another tokens
// @Tags Token
// @Accept json
// @Produce json
// @Param Token header string true "Your tokens"
// @Param Authorization header string true "Token de autenticação (Colocar o token deixando o Bearer)" default(Bearer <token>)
// @Success 200 {object} inter.AllTokensOutput "New User Created successfully"
// @Failure 500 {object} errors.InternalServerError "Unable to store data in database"
// @Router /api/converter-token [get]
func ConverterTokens(c *gin.Context) {
	Token := c.GetHeader("Token")
	service.ConvertToken(c, Token)
}
