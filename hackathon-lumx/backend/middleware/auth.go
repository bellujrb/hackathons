package middleware

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
)

func authMiddleware(c *gin.Context) {
	authorizationHeader := c.GetHeader("Authorization")
	if authorizationHeader == "" {
		c.Set("Response", "Authentication token not provided")
		c.Status(http.StatusUnauthorized)
		c.Abort()
		return
	}

	tokenParts := strings.Split(authorizationHeader, " ")
	if len(tokenParts) != 2 || tokenParts[0] != "Bearer" {
		c.Set("Response", "Invalid authentication token")
		c.Status(http.StatusUnauthorized)
		c.Abort()
		return
	}

	tokenString := tokenParts[1]

	_, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return getSecretKey(), nil
	})
	if err != nil {
		c.Set("Response", "Invalid authentication token")
		c.Status(http.StatusUnauthorized)
		c.Abort()
		return
	}

	c.Next()
}
