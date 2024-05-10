package middleware

import (
	_ "fanify/docs"
	mkt "fanify/internal/mkt/handler"
	tokens "fanify/internal/tokens/handler"
	user "fanify/internal/user/handler"

	"github.com/gin-gonic/gin"
	swaggerfiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

// @title Fidz
// @version 0.1
// @description API
// @termsOfService http://swagger.io/terms/
// @host localhost:8080
// @BasePath /api
func SetupRouter() *gin.Engine {
	r := gin.Default()

	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerfiles.Handler))

	r.Use(ResponseHandler())

	//Use response, but not Token
	r.GET("/token", generateTokenHandler)
	r.PUT("/login", LoginUser)
	r.POST("/create-user", user.CreateUser)
	auth := r.Group("/api")
	auth.Use(authMiddleware)

	//Response and token service

	auth.POST("/create-contract", user.CreateContract)

	auth.POST("/deploy-contract", user.DeployContract)
	auth.GET("/contract-details", user.PullContract)
	auth.GET("/all-contract", user.PullAllContract)

	auth.PUT("/logged")
	auth.GET("/user", user.PullUser)

	auth.POST("/create-token", tokens.CreateToken)
	auth.POST("/make-transfer", tokens.MakeTransfer)
	auth.POST("/make-trade", tokens.MakeTrade)
	auth.GET("/get-token", tokens.GetToken)
	auth.GET("/all-token", tokens.GetAllToken)

	auth.GET("/converter", tokens.ConverterTokens)
	auth.GET("/gain-tokens", tokens.GainToken)

	auth.POST("/create-item", mkt.CreateItem)
	auth.POST("/create-company", mkt.CreateCompany)
	auth.GET("/all-item", mkt.GetAllItems)
	auth.GET("/one-item", mkt.GetOneItems)
	auth.GET("/one-company", mkt.GetOneCompany)
	auth.GET("/company", mkt.GetOneCompany)
	auth.GET("/all-company", mkt.GetAllCompany)
	return r
}
