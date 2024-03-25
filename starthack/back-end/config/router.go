package config

import (
	_ "synhelper/docs"

	"github.com/gin-gonic/gin"
	swaggerfiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"

	external "synhelper/internal/external"
	field "synhelper/internal/field/handler"
)

// @title Sua API de Comida
// @version 1.0
// @description API para gerenciar informações de alimentos
// @termsOfService http://swagger.io/terms/
// @host localhost:8080
// @BasePath /api
func SetupRouter() *gin.Engine {
	r := gin.Default()

	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerfiles.Handler))

	r.POST("/external-company", external.PostApiCompany)
	r.POST("/external-fields", external.PostApiFields)
	r.POST("/external-location", external.PostApiLocation)

	r.GET("/fields", field.SearchField)
	r.GET("/all-fields", field.SearchAllField)
	r.POST("/classify", field.ClassifyField)
	r.POST("/fields", field.CreateField)
	r.DELETE("/fields", field.DeleteField)
	r.PUT("/fields", field.EditField)

	return r
}
