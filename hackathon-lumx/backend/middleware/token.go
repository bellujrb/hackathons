package middleware

import (
	"fanify/internal/user/service"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
	"github.com/joho/godotenv"
)

func getSecretKey() []byte {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Erro ao carregar o arquivo .env")
	}
	secretKey := os.Getenv("SECRET_KEY")
	if secretKey == "" {
		fmt.Println("Chave secreta não encontrada no arquivo .env")
		os.Exit(1)
	}
	return []byte(secretKey)
}

func generateToken() (string, error) {
	claims := jwt.MapClaims{
		"exp": time.Now().Add(time.Hour * 3).Unix(),
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(getSecretKey())
}

// @Summary Creat a token for apis
// @Description Creat a token for external apis
// @Tags Auth
// @Accept json
// @Produce json
// @Success 200 {object} string "token make:"
// @Router /token [get]
func generateTokenHandler(c *gin.Context) {
	token, err := generateToken()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao gerar token"})
		return
	}
	token = "Bearer " + token
	c.Set("Response", token)
	c.Status(http.StatusOK)
}

// @Summary Login User
// @Description Login user and give a acess token
// @Tags User
// @Accept json
// @Produce json
// @Param Email header string true "E-mail from user"
// @Success 200 {object} string "token make:"
// @Failure 500 {object} string "User not found in db"
// @Router /login [put]
func LoginUser(c *gin.Context) {
	Email := c.GetHeader("Email")
	service.UserLogins(c, Email, true)
	token, err := generateToken()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao gerar token"})
		return
	}
	token = "Bearer " + token
	c.Set("Response", token)
	c.Status(http.StatusOK)
}
