package external

import (
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

// @Summary Cria um novo campo
// @Description Cria um novo campo no banco de dados
// @Tags Fields
// @Accept json
// @Produce json
// @Param request body FieldModel true "Dados do campo a ser criado"
// @Success 200 {string} string "Campo criado com sucesso"
// @Router /external-fields [post]
func PostApiFields(c *gin.Context) {
	var fields FieldModel
	if err := c.BindJSON(&fields); err != nil {
		return
	}
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal(".env Dont load")
	}

	URL := os.Getenv("SYN")
	if URL == "" {
		log.Fatal("Dont have Syngenta url")
	}
	token := os.Getenv("RECAPTCHA_TOKEN")
	if URL == "" {
		log.Fatal("Dont have recaptcha token")
	}
	baseURL := URL
	api := NewAPI(baseURL, token)
	api.PostApiExternal(c, "", fields)

}

// @Summary Cria uma nova empresa
// @Description Cria uma nova empresa no banco de dados
// @Tags Companies
// @Accept json
// @Produce json
// @Param request body Company true "Dados da empresa a ser criada"
// @Success 200 {string} string "Empresa criada com sucesso"
// @Router /external-companies [post]
func PostApiCompany(c *gin.Context) {
	var company Company
	if err := c.BindJSON(&company); err != nil {
		return
	}

	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal(".env Dont load")
	}

	URL := os.Getenv("SYN")
	if URL == "" {
		log.Fatal("Dont have Syngenta url")
	}
	token := os.Getenv("RECAPTCHA_TOKEN")
	if URL == "" {
		log.Fatal("Dont have recaptcha token")
	}
	baseURL := URL
	api := NewAPI(baseURL, token)
	api.PostApiExternal(c, "", company)

}

// @Summary Cria uma nova localização
// @Description Cria uma nova localização no banco de dados
// @Tags Locations
// @Accept json
// @Produce json
// @Param request body Location true "Dados da localização a ser criada"
// @Success 200 {string} string "Localização criada com sucesso"
// @Router /external-locations [post]
func PostApiLocation(c *gin.Context) {
	var location Location
	if err := c.BindJSON(&location); err != nil {
		return
	}
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal(".env Dont load")
	}

	URL := os.Getenv("SYN")
	if URL == "" {
		log.Fatal("Dont have Syngenta url")
	}
	token := os.Getenv("RECAPTCHA_TOKEN")
	if URL == "" {
		log.Fatal("Dont have recaptcha token")
	}
	baseURL := URL
	api := NewAPI(baseURL, token)
	api.PostApiExternal(c, "", location)

}
